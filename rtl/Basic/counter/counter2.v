module counter2 (out, clk, reset);

	parameter WIDTH = 8;

	output [WIDTH-1: 0] out;
	input clk, reset;

	reg [WIDTH-1: 0] out;

	always @(posedge clk or negedge reset)begin
		if(!reset) begin
			out <= 0;
		end
		else begin
			
		end
	end
endmodule
