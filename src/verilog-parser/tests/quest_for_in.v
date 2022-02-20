module quest_for_in();

integer i;
reg clk;

initial begin
  clk = 0;
  #4 $finish;
end

always #1 clk = !clk;

always @ (posedge clk)
begin
  for (i=0; i < 8; i = i + 1) begin : FOR_IN
    if (i == 5) begin
      disable FOR_IN;
    end
    $display ("Current i : %g",i);
  end
end
endmodule
