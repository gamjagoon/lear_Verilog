module tb ();

reg P;
reg clk;
wire Q;

dff tb(P,clk,Q);

  initial
  begin
    $dumpfile("test_out.vcd");
    $dumpvars(0,tb);
  end

  initial begin //40ns 클럭 만들기
  clk = 0;
    repeat(1000)
      #20 clk =~clk;
  end

  initial begin
    P=1;#10;
    P=0;#10;
    P=1;#10;
    P=0;#10;
    P=0;#10;
    P=0;#10;
    P=1;#10;
    P=0;#10;
  end




  
endmodule