//             *******   binary_search module testbench  *******  //

//Steps:
//1. Write the data from software interface
//2. Request for key
//3. Wait for response. Match response index with expected index

//assumption 1: Sorted array
//Binary search is efficient only for sorted arrays.
//Since it's asked to do binary search, it's assumed that the array is sorted in incrementing or decrementing order.
//Therefore it's assumed that software is having the array sorted and it writes the sorted data in memory(dp_ram) in the binary_search module.

module binary_search_tb();

reg Clk, Rst;
localparam
  DEPTH = 'd1024,
  DATA_WIDTH = 'd32;
localparam
  IDLE = 3'd0,
  WAIT = 3'd1,
  REQUST = 3'd2,
  COMPARE = 3'd3;

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
reg [DATA_WIDTH-1:0] request_key;
reg [1:0] sw_state,req_state;
reg [$clog2(DEPTH)-1:0] j, test_index,test_index_latched;
wire [$clog2(DEPTH)-1:0] response_index;
reg request_key_valid;
reg [2:0] wait_count;
reg [DATA_WIDTH-1:0] cpu_data;
reg [$clog2(DEPTH)-1:0] cpu_addr;
reg cpu_wr,cpu_rd,init_done;


binary_search 
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
   ) DUT (
  
   .Clk(Clk),
   .Rst(Rst),
   
  //software configuration interface
  .cpu_addr(cpu_addr),
  .cpu_data(cpu_data),
  .cpu_wr(cpu_wr),
  .cpu_rd(cpu_rd),
  .cpu_access_done(cpu_access_done),

  //Requestor interface
  .request_key(request_key), 
  .request_key_valid(request_key_valid), 

  //Response interface
  .response_index(response_index), 
  .response_valid(response_valid),                      
  .no_match_found(no_match_found)                          
);

//1. Generate an array and sort it.
//   Assumes availability of sort function in testbench simulation environment

//2. Write the array into DUT over software interface

//3. Drive request interface. Drive a random value between 1 & DEPTH
//   and wait for response. 
//4. Check for match and response time
integer i;
initial begin
  Clk = 1'b0;
  Rst = 1'b1;
  repeat(4) #10 Clk = ~Clk;
  Rst = 1'b0;
  forever #10 Clk = ~Clk;
end

initial begin
//generate the random data
  for (i=0; i<DEPTH; i=i+1) begin
    mem[i] = $random;
  end
//sort the data
 mem.sort; 
end



//Drive SW configuration
//Write data same as address for a simple sorted data
always @(posedge Clk) 
begin
if (Rst) 
  begin
    cpu_wr   <= 'b0;
    cpu_addr <= 'b0;    
    cpu_data <= 'b0;    
    sw_state <= IDLE;
    j <= 0;
    init_done <= 1'b0;
  end
else 
  begin
    cpu_wr   <= 1'b0;
    case (sw_state)
    IDLE: begin
      if ((cpu_addr < DEPTH) && ~init_done)
        begin
          cpu_wr   <= 1'b1;
          cpu_data <= mem[j];
          sw_state <= WAIT;
        end
    end

    WAIT:begin
      cpu_wr   <= 1'b0;
      if (cpu_access_done) 
        begin
          sw_state <= IDLE;
          if (cpu_addr <= DEPTH-2)
            begin
              cpu_addr <= cpu_addr + 1;
              j <= j +1;
            end
 
        if (cpu_addr == DEPTH-1)
          init_done <= 1'b1;
        end
    end
    endcase
  end
end


//Drive the request interface and wait for response
always @(posedge Clk) 
begin
if (Rst || ~init_done) 
  begin
    request_key_valid <= 1'b0;
    request_key       <= 'd0;
    req_state         <= IDLE;
    wait_count        <= 'd0;
  end
else 
  begin
    request_key_valid <= 1'b0;
    case (req_state)
    IDLE: begin
      test_index <= $random;  //pick a random index from the array
      request_key        <= mem[test_index];
      req_state <= REQUST;
    end

    REQUST: begin
      request_key_valid  <= 1'b1;
      request_key        <= mem[test_index];
      test_index_latched <= test_index;
      req_state <= WAIT;
      $display("Search Request with Key: %h  Expected Index: %h",mem[test_index],test_index);
    end

    WAIT:begin
      wait_count <= wait_count + 1;
      if (wait_count <= $clog2(DEPTH)) //response should come within log(DEPTH CC)
        begin
          if (response_valid) 
            begin
              req_state <= IDLE;
              $display("Response received Index: %h",response_index);
              if (test_index_latched == response_index)
                $display("test passed");
              else
                $display("test failed:: response index didn't match");
            end
        end
      else
        begin
          req_state <= IDLE;
          $display("test failed:: response didn't come");
        end
    end
    endcase
  end
end

endmodule
