module CNT_4BIT_UPDOWN_tb ();

reg en, clk, nRST, up;
wire [3:0] out;

CNT_4BIT_UPDOWN DUP(en,clk,nRST,up,out);

initial
begin
  $dumpfile("test_out.vcd");
  $dumpvars(0,DUP);
  $monitor("%d",out);
end

initial begin
  clk = 1'b0;
  repeat(10000) #5 clk =~clk;
end

initial begin
  en=0;
  up=1;
  nRST=0; #50;
  nRST=1; #50;
  en=1; #50;
  up=0;
end
  
endmodule