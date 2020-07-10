module tb();

// var or const
reg clk;
reg A;
wire  red;
wire  green;
wire  yellow;

// modules
moor DUP(clk,A,red,green,yellow);

// make vcd file
initial
begin
  $dumpfile("test_out.vcd");
  $dumpvars(0,DUP);
  $monitor("%b %b %b %b",A,red,green,yellow);
end

// start
initial begin
  clk = 0;
  repeat(1000) #7 clk <= ~clk;
end

initial begin
  #10; A<=1'b0;
  #10; A<=1'b1;
  #10; A<=1'b0;
  #10; A<=1'b1;
  #10; A<=1'b0;
  #10; A<=1'b1;
  #10; A<=1'b0;
  #10; A<=1'b1;
  #10; A<=1'b0;
  #10; A<=1'b1;
  #10; A<=1'b0;
end



endmodule