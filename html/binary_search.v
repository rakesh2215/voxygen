//binary_search module.
//This module performs binary search on a sorted array of data.

//assumption 1: Sorted array
//Binary search is efficient only for sorted arrays.
//Since it's asked to do binary search, it's assumed that the array is sorted in incrementing or decrementing order.
//Therefore it's assumed that software is having the array sorted and it writes the sorted data in memory(dp_ram) in the binary_search module.


//Potential uses:
//1. Access and search stored elements very fast. 
//The complexity is of the order O(logN), whereas for linear search it's O(N). 

module binary_search
  #(
    parameter
    DATA_WIDTH,
    DEPTH 
    )
(
  input  Clk, Rst,

  //software configuration interface
  input  [$clog2(DEPTH)-1:0] cpu_addr,
  input  [DATA_WIDTH-1:0] cpu_data,
  input  cpu_wr,
  input  cpu_rd,
  output reg cpu_access_done,


  //Requestor interface
  input [DATA_WIDTH-1:0] request_key, //value to search
  input request_key_valid,          //valid signal for request_key, high for one CC

  //Response interface
  output reg [$clog2(DEPTH)-1:0] response_index, //found request_key at this index
  output reg response_valid,                         //valid for one CC. Available within clog2(DEPTH) CC  
  output reg no_match_found                          //asserted if no match found, at clog2(DEPTH) CC
);


//Dual port RAM to store the database and do search operation
wire [DATA_WIDTH-1:0] current_value;
reg [$clog2(DEPTH)-1:0] low_index,middle_index,high_index;

localparam
  IDLE = 3'd0,
  READ = 3'd1,
  COMPARE = 3'd2;

dp_ram
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
   ) dp_ram_inst (
  .Clk(Clk),
  .Rst(Rst),
  .write_ena(cpu_wr),
  .addr_a(cpu_addr),
  .din_a(cpu_data),

  .addr_b(middle_index),
  .dout_b(current_value)
);

reg [2:0] state,wait_count;
reg [DATA_WIDTH-1:0] request_key_latched;
always @ (posedge Clk) 
begin
if (Rst) 
  begin
    state <= IDLE;
    no_match_found <= 1'b0;
    low_index <= 'd0;
    high_index <= {DEPTH{1'b1}};
    middle_index <= 'd0;
    cpu_access_done <= 1'b0;
    wait_count <= 'd0;
  end
else
  begin
    cpu_access_done <= cpu_wr;
    no_match_found <= 1'b0;
    response_valid <= 1'b0;
    case (state)
    IDLE: begin
      low_index <= 'd0;
      high_index <= {DEPTH{1'b1}};
      middle_index <= 'd0;
      if (request_key_valid)
        begin
          state <= READ;
          request_key_latched <= request_key;
        end
    end

    READ: begin
       if (wait_count == 'd0) 
         middle_index <= (low_index + high_index )/2;
       wait_count = wait_count + 1;
       if (wait_count == 2'd2) //for RAM latency
         state <= COMPARE;
    end

    COMPARE: begin
      wait_count <= 'd0;
      if (current_value == request_key_latched) //match found
        begin
          response_valid <= 1'b1;
          response_index <= middle_index;
          state  <= IDLE;
        end
      else
      if (high_index <= low_index) //exhausted search iteration, no match
        begin
          no_match_found <= 1'b1;
          state  <= IDLE;
        end
      else //search further
        begin
          state  <= READ;
          if (current_value < request_key_latched)
            low_index <= middle_index+1;
          else
            high_index <= middle_index-1;
        end
    end

   default: begin
     state  <= IDLE;
   end
  endcase
end
end
 
endmodule
