module quest_for_out();

integer i;
reg clk;

initial begin
  clk = 0;
  #4 $finish;
end

always #1 clk = !clk;

always @ (posedge clk)
begin : FOR_OUT
  for (i=0; i < 8; i = i + 1) begin
    if (i == 5) begin
      disable FOR_OUT;
    end
    $display ("Current i : %g",i);
  end
end
endmodule
