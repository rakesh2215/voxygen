//DP RAM module

module dp_ram
  #(
    parameter
    DATA_WIDTH,
    DEPTH 
    )
(
  input  Clk, 
  input  Rst,

  input  write_ena,
  input  [$clog2(DEPTH)-1:0] addr_a,
  input  [$clog2(DEPTH)-1:0] addr_b,
  input  [DATA_WIDTH-1:0] din_a,
  output reg [DATA_WIDTH-1:0] dout_b
);

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge Clk) 
begin
if (Rst) 
  begin
   dout_b <= 'd0; 
  end
else
  begin
   if (write_ena)
     mem[addr_a] <= din_a;
   dout_b <= mem[addr_b];
  end
end

endmodule
