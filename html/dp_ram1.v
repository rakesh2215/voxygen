//DP RAM module

module dp_ram1
(
  input  Clk, 
  input  Rst,

  input  write_ena,
  input  [1:0] addr_a,
  input  [1:0] addr_b,
  input  [1:0] din_a,
  output reg [1:0] dout_b
);

reg [1:0] mem [0:4-1];

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
