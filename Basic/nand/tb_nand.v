module tb_nand4;
  reg [3:0] a;
  wire y;
  integer i;

  nand_if tb(a,y);

  initial
  begin
    $dumpfile("test_out.vcd");
    $dumpvars(-1,tb);
    $monitor("%b",y);
  end

  initial
  begin
    a = 0;
    for(i = 0; i < 32; i = i + 1)
    begin
      #20;
      a=i;
    end
    $finish;
  end
endmodule