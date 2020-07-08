module moor (
  input clk,input A,
  output reg red, output reg green, output reg yellow
);

reg [2:0] stateNow = 3'b0;

always @(posedge clk ) begin
  case(stateNow)
  3'b000:begin 
    stateNow<=3'b001;
  end
  3'b001:begin 
    if(!A)
    stateNow<=3'b010;
    else
    stateNow<=3'b001;
   end
  3'b010:begin
    stateNow<=3'b000;
   end
  endcase
end

always @(posedge clk ) begin
  case(stateNow)
  3'b000:begin 
     {red,green,yellow} <= 3'b010;
  end
  3'b001:begin
    {red,green,yellow} <= 3'b001;
  end
  3'b010:begin
    {red,green,yellow} <= 3'b100;
  end
  endcase
end
  
endmodule