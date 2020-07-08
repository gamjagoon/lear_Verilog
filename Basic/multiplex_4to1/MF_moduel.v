module MF_module (
  IN, OUT, SEL
);
input wire [3:0] IN;
input wire [1:0] SEL;
output reg OUT;

always @(IN or SEL) begin
  OUT = IN[SEL];
end

endmodule