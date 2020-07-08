module tb_or();

// var or const
reg J;
reg K;
reg clk;
wire OUT;

// modules
jkmodule tb(J,K,clk,OUT);

// make vcd file
initial
begin
  $dumpfile("test_out.vcd");
  $dumpvars(0,tb);
  $monitor("%b %b %b",J, K, OUT);
end

initial
begin
  clk = 0;
  repeat(1000)
   #7 clk = ~clk;
end

// start
initial 
begin
  J=0;K=0; #10;
  J=0;K=1; #10;
  J=1;K=0; #10;
  J=1;K=1; #10;
  J=0;K=0; #10;
  J=0;K=1; #10;
  J=1;K=0; #10;
  J=1;K=1; #10;
  J=0;K=0; #10;
  J=0;K=1; #10;
  J=1;K=0; #10;
  J=1;K=1; #10;
  J=0;K=0; #10;
  J=0;K=1; #10;
  J=1;K=0; #10;
  J=1;K=1; #10;
end

endmodule