module DMF_module (
  IN, OUT, SEL
);
input IN;
input [1:0] SEL;
output reg[3:0] OUT;

always @(IN or SEL) begin
  case(SEL)
   2'b00:begin OUT[0]=IN;OUT[1]=0;OUT[2]=0;OUT[3]=0;end
   2'b01:begin OUT[0]=0;OUT[1]=IN;OUT[2]=0;OUT[3]=0;end
   2'b10:begin OUT[0]=0;OUT[1]=0;OUT[2]=IN;OUT[3]=0;end
   2'b11:begin OUT[0]=0;OUT[1]=0;OUT[2]=0;OUT[3]=IN;end
  endcase
end

endmodule