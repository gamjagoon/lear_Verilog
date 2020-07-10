module CNT_4BIT_UPDOWN (
  en, clk, nRST, up, out
);
input en;
input clk;
input nRST;
input up;
output reg [3:0] out;

always @(posedge clk or negedge nRST) begin
  if(!nRST) begin
    out<=4'b0000; // 초기값은 0 이다/
  end else if(en) begin
    if(up)
      out <= out + 4'b0001;
    else
      out <= out - 4'b0001;
  end else begin end
end
endmodule