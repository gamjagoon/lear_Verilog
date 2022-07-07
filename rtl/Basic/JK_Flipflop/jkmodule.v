module jkmodule (
  input wire J,
  input wire K,
  input wire clk,
  output reg OUT
);

always @(posedge clk ) begin
  if(J==0 && K== 0)
  begin  
  end
  else if(J==0 && K== 1)
  begin
    OUT<=1'b0; // 베릴 로그에서는 자릿수'b0
  end
  else if(J==1 && K== 0)
  begin
    OUT<=1'b1;
  end
  else 
  begin
    OUT <= ~OUT;
  end
end
  
endmodule