`timescale 1ns/1ns

module dff_tb;
	reg clk, d;
	wire q, qn;

	dff dff (d, clk, q, qn);

	initial begin
		#0 clk = 0;
		 	 d = 0;
		#2   d = 1;
		#2   d = 0;
		#2   d = 1;
		#2   d = 0;
		#1   d = 1;
		#2   d = 0;
		#3   d = 1;
		#2   d = 0;
		#2   d = 1;
		#1   d = 0;
		#2   d = 1;
		#3   d = 0;
		#6   $finish;
	end
	
	initial begin
		$dumpfile("dff.vcd");
		$dumpvars;
	
	end


	always #5 clk = !clk;

endmodule
