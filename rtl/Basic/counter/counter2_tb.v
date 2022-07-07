module test ;
	reg reset = 0;

	initial begin
		# 17 reset = 1;
		# 11 reset = 0;
		# 29 reset = 1;
		# 11 reset = 0;
		# 100 $stop;
	end

	initial begin
			$dumpfile("test.vcd");
			$dumpvars(0,test);
	end

	reg clk = 0;
	always #5 clk = !clk;
	wire [7:0]value;

	counter2 DUT(value,clk,reset);

	initial begin
		$monitor("At time %t, value = %h (%0d)",
				$time, value, value);
	end
endmodule
