//                ********** packet_parser top module ******* //

//          **** This block calls packet_parser core module and uses verilog 'generate' loop over parameter FIELD_NUMBER **** //

module packet_parser_top
  #(
    parameter
    DATA_WIDTH,
    FIELD_NUMBER,
    FIELD_SIZE_MAX,
    FIELD_OFFSET,
    FIELD_SIZE
    )
(
  input  Clk, Rst,
  input  InBus_DataEmpty,
  input  InBus_DataValid,
  input  InBus_DataSop,
  input  InBus_DataEop,
  input  [$clog2(DATA_WIDTH/8)-1:0] InBus_Mod,
  input  [DATA_WIDTH-1:0] InBus_Data,

  output InBus_DataRead,
  output reg OutBus_AllValues_Ready,

  output [FIELD_NUMBER-1:0] OutBus_Valid_muxed,
  output [(FIELD_NUMBER*FIELD_SIZE_MAX*8)-1:0] OutBus_Field_muxed,
  output [FIELD_NUMBER-1:0] error_offset_or_size_muxed
);

//assumption 1:
//Push interface: InBus_DataRead & InBus_DataEmpty are not required,
//since InBus_DataValid controls data validity on the bus.

//assumption 3:
//InBus_Mod is non-zero only at InBus_DataEop
//and it indicates valid bytes on LSB
//parameter [7:0] FIELD_OFFSET [FIELD_NUMBER-1 : 0]   = {8'd1, 8'd2, 8'd3, 8'd4};
//parameter [FIELD_SIZE_MAX-1:0] FIELD_SIZE [FIELD_NUMBER-1 : 0]   = {32'd1, 32'd2, 32'd3, 32'd4};

genvar i;
generate
for (i=0; i<FIELD_NUMBER; i=i+1) begin: loop
  packet_parser #(.DATA_WIDTH(DATA_WIDTH),.FIELD_SIZE_MAX(FIELD_SIZE_MAX),.FIELD_OFFSET(FIELD_OFFSET[8*(i+1)-1:8*i]),.FIELD_SIZE(FIELD_SIZE[(FIELD_SIZE_MAX*8*(i+1))-1:FIELD_SIZE_MAX*8*i]))
                packet_parser_top(
                //inputs
                .Clk(Clk),
                .Rst(Rst),
                .InBus_Data(InBus_Data),
                .InBus_DataValid(InBus_DataValid),
                .InBus_DataSop(InBus_DataSop),
                .InBus_DataEop(InBus_DataEop),
                .InBus_Mod(InBus_Mod),

                //outputs
                .OutBus_Valid(OutBus_Valid_muxed[i]),
                .OutBus_Field(OutBus_Field_muxed[((i+1)*FIELD_SIZE_MAX*8)-1:i*FIELD_SIZE_MAX*8]),
                .error_offset_or_size(error_offset_or_size_muxed[i])
                );
end: loop
endgenerate

//generate OutBus_AllValues_Ready at InBus_DataEop
//All other outputs are coming from genvar block
always @ (posedge Clk) 
begin
if (Rst) 
  begin
    OutBus_AllValues_Ready <= 1'b0;
  end
else
  begin
    if (InBus_DataValid && InBus_DataEop)
      OutBus_AllValues_Ready <= 1'b1;
    else
      OutBus_AllValues_Ready <= 1'b0;
  end
end

endmodule
