module uart (
input  clk,input nRST,output reg received_byte,input tx
);

reg [9:0]cnt;
reg tx_active;

always @(posedge clk or negedge nRST) begin
  if(!nRST || cnt == 936) begin
    cnt <= 10'b0;
    tx_active <= 1'b0;
  end 
  else if(tx_active == 0 && tx == 0)begin
    tx_active <= 1'b1;
  end
  else if(tx_active)begin
    cnt <=cnt + 1'b1;
  end
end

always @(posedge clk) begin
  if(cnt==936 && tx_active)
  begin
    tx_active<=1'b0;
    if(cnt == 156) begin
      received_byte = {received_byte[6:0],tx}
      
    end
  end
end
  
endmodule