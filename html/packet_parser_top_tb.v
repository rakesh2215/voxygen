           // *************** Packet parser testbench ************


// 1. Calls top DUT module packet_parser_top
// 2. Generates random size packets with random payload content
// 3. Drives packets on InBus interface. Stores comparision data in a FIFO
// 4. Monitor FSM received DUT output, reads the local FIFO and compares for result


module packet_parser_top_tb ();
 
localparam
  DATA_WIDTH    = 'd64,
  FIELD_NUMBER   = 4,
  FIELD_SIZE_MAX = 4;

parameter [(8*FIELD_NUMBER)-1:0] FIELD_OFFSET = {8'd1, 8'd2, 8'd3, 8'd4};
parameter [(FIELD_SIZE_MAX*FIELD_NUMBER*8)-1:0] FIELD_SIZE = {32'd1, 32'd2, 32'd3, 32'd4};

reg Clk, Rst;
reg InBus_DataValid,InBus_DataSop,InBus_DataEop;
reg [$clog2(DATA_WIDTH/8)-1:0] InBus_Mod;
reg [DATA_WIDTH-1:0] InBus_Data;
wire OutBus_AllValues_Ready;
wire [((FIELD_NUMBER*FIELD_SIZE_MAX*8)-1):0] OutBus_Field_muxed;
wire [FIELD_NUMBER-1:0] OutBus_Valid_muxed; 
wire [FIELD_NUMBER-1:0] error_offset_or_size_muxed;

packet_parser_top 
   #(.DATA_WIDTH(DATA_WIDTH),
   .FIELD_NUMBER(FIELD_NUMBER),
   .FIELD_SIZE(FIELD_SIZE),
   .FIELD_OFFSET(FIELD_OFFSET),
   .FIELD_SIZE_MAX(FIELD_SIZE_MAX)
   ) DUT (
    .Clk(Clk),
    .Rst(Rst),
    .InBus_DataValid(InBus_DataValid),
    .InBus_DataSop(InBus_DataSop),
    .InBus_DataEop(InBus_DataEop),
    .InBus_Mod(InBus_Mod),    
    .InBus_Data(InBus_Data),

    .OutBus_AllValues_Ready(OutBus_AllValues_Ready),
    .OutBus_Field_muxed(OutBus_Field_muxed),
    .OutBus_Valid_muxed(OutBus_Valid_muxed),
    .error_offset_or_size_muxed(error_offset_or_size_muxed)
   );

localparam MAX_PKTS = 8; 
reg [$clog2(MAX_PKTS):0] packet_count;
reg [15:0] packet_size,byte_count;
reg [(FIELD_SIZE_MAX*8)-1:0] field0,field1,field2,field3;
reg [(FIELD_SIZE_MAX*FIELD_NUMBER*8)-1:0]queue_out;
int i;

//array of packet lengths
reg [15:0] pkt_len_array [0:MAX_PKTS];
initial begin
  Clk = 1'b0;
  Rst = 1'b1;
  repeat(4) #10 Clk = ~Clk;
  $display("reset released");
  Rst = 1'b0;
  forever #10 Clk = ~Clk;
end

initial begin
  //Generate MAX_PKTS packets of random length upto 16K
  for (i=0; i<MAX_PKTS; i=i+1) begin
    //pkt_len_array[i] <= 10+$random%100; //Constraining packet size of range 10 to 110 bytes so that all fields can be inserted
    pkt_len_array[i] <= 'd100; //Constraining packet size of range 10 to 110 bytes so that all fields can be inserted
  end
   $display("packet length array initialized");
end

reg [2:0] state;
localparam IDLE = 0,
           TXFR_PKT = 1;

//queue for storage of test fields
byte queue[$];
reg field0_is_ready,field1_is_ready,field2_is_ready,field3_is_ready;
//State machine to drive packets onto the DUT interface
always @ (posedge Clk) 
begin
if (Rst) 
  begin
    InBus_DataValid <= 1'b0;
    InBus_DataSop   <= 1'b0;    
    InBus_DataEop   <= 1'b0;    
    InBus_Data      <= 'd0;
    packet_count    <= 'd0;
    InBus_Mod       <= 'd0;
    field0_is_ready <= 1'b0;
    field1_is_ready <= 1'b0;
    field2_is_ready <= 1'b0;
    field3_is_ready <= 1'b0;
    state <= IDLE;
    byte_count <= 'd0;
  end
else 
  begin
    //default values
    InBus_DataSop   <= 1'b0;    
    InBus_DataEop   <= 1'b0;    
    InBus_DataValid <= 1'b0;    
    InBus_Mod       <= 'd0;
    case (state)
    IDLE: begin
      field0_is_ready <= 1'b0;
      field1_is_ready <= 1'b0;
      field2_is_ready <= 1'b0;
      field3_is_ready <= 1'b0;
        if (packet_count <= MAX_PKTS)
        begin
          packet_size = pkt_len_array[packet_count];
          state      <= TXFR_PKT;
        end
    end

    TXFR_PKT:begin
      if (byte_count==0)
        InBus_DataSop    <= 1'b1;
      InBus_DataValid  <= 1'b1;
      InBus_Mod       <= 'd0;
      byte_count  <= byte_count + DATA_WIDTH/8; 
      InBus_Data <= $random;

      //extract fields and write in a local queue at EoP; to be read when values are ready from DUT for comparision
      if (byte_count >= FIELD_OFFSET[7:0])  begin
        field0 <= InBus_Data[((FIELD_OFFSET[7:0]%(DATA_WIDTH/8))*8) +: (FIELD_SIZE[31:0]*8)];
        field0_is_ready <= 1'b1;
      end
      if (byte_count >= FIELD_OFFSET[15:8]) begin
        field1 <= InBus_Data[((FIELD_OFFSET[15:8]%(DATA_WIDTH/8))*8) +: (FIELD_SIZE[63:32]*8)];
        field1_is_ready <= 1'b1;
      end 
      if (byte_count >= FIELD_OFFSET[23:16]) begin
        field2 <= InBus_Data[((FIELD_OFFSET[23:16]%(DATA_WIDTH/8))*8) +: (FIELD_SIZE[95:64]*8)];
        field2_is_ready <= 1'b1;
      end
      if (byte_count >= FIELD_OFFSET[31:24]) begin
        field3 <= InBus_Data[((FIELD_OFFSET[31:24]%(DATA_WIDTH/8))*8) +: (FIELD_SIZE[127:96]*8)];
        field3_is_ready <= 1'b1;
      end 

      if (byte_count >= packet_size)
        begin
          byte_count <= 'd0;
          state <= IDLE;
          packet_count <= packet_count + 1'd1;
          if (~InBus_DataEop)
            InBus_DataEop    <= 1'b1;
          InBus_Mod        <= packet_size%(DATA_WIDTH/8);
        end
    end
    endcase
  end
end

reg OutBus_AllValues_Ready_d1;
wire all_fields_ready = field0_is_ready && field1_is_ready && field2_is_ready && field3_is_ready;
reg all_fields_ready_d1;
reg [9:0] wr_addr,rd_addr;
wire push_queue = all_fields_ready && ~all_fields_ready_d1;
dp_ram
  #(
    .DATA_WIDTH(128),
    .DEPTH(32)
   ) dp_ram_inst (
  .Clk(Clk),
  .Rst(Rst),
  .write_ena(push_queue),
  .addr_a(wr_addr),
  .din_a({field3,field2,field1,field0}),

  .addr_b(rd_addr),
  .dout_b(queue_out)
);

always @ (posedge Clk) 
begin
if (Rst) 
  begin
    OutBus_AllValues_Ready_d1 <= 'b0;
    all_fields_ready_d1 <= 1'b0;
    wr_addr <= 'd0;
    rd_addr <= 'd0;
  end
else 
  begin
    OutBus_AllValues_Ready_d1 <= OutBus_AllValues_Ready;
    all_fields_ready_d1 <= all_fields_ready;
    if (push_queue)
      wr_addr <= wr_addr + 1'd1;

    if (OutBus_AllValues_Ready)
      begin
        rd_addr <= rd_addr + 1'd1;
        if ((OutBus_Valid_muxed[0] && (OutBus_Field_muxed[31:0] == queue_out[31:0])) &&
           (OutBus_Valid_muxed[1] && (OutBus_Field_muxed[63:32] == queue_out[63:32])) &&
           (OutBus_Valid_muxed[2] && (OutBus_Field_muxed[95:64] == queue_out[95:64])) &&
           (OutBus_Valid_muxed[3] && (OutBus_Field_muxed[127:96] == queue_out[127:96])))

          $display("TEST PASSED");
        else
          $display("TEST FAILED");
      end
  end
end
 
endmodule
