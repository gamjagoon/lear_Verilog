module tb_or();

reg A;
reg B;
wire C;

OR DUP(.A(A),.B(B),.C(C));

initial
begin
  $dumpfile("test_out.vcd");
  $dumpvars(0,DUP);
  $monitor("%b",C);
end

// 시물레이션 용이다
initial begin
  A=0;B=0; #500;
  A=0;B=1; #500;
  A=1;B=0; #500;
  A=1;B=1; #500;
  A=0;B=0; #500;
  $finish;
end




endmodule