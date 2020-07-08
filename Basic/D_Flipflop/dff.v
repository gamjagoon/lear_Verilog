module dff (
  input wire D,
  input wire clk,
  output reg out
);

always @(posedge clk) begin // 엣지마다 out의 값을 변경한다
  out<=D;
end
endmodule