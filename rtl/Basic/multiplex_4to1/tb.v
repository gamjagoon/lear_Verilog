module tb();

// var or const
reg [3:0] IN;
reg [1:0] SEL;
wire OUT;

// modules
MF_module tb(
  IN, OUT, SEL
);

// make vcd file
initial
begin
  $dumpfile("test_out.vcd");
  $dumpvars(0,tb);
  $monitor("%b %b",IN,OUT);
end

// start
initial begin
  #100;IN=4'b1010;
  #100; SEL=2'b00;
  #100; SEL=2'b01;
  #100; SEL=2'b10;
  #100; SEL=2'b11;
  #100; SEL=2'b00;
  #100; SEL=2'b01;
  #100; SEL=2'b10;
  #100; SEL=2'b11;
  #100; SEL=2'b00;
  #100; SEL=2'b01;
  #100; SEL=2'b10;
  #100; SEL=2'b11;
end

endmodule