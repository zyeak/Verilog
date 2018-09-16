`timescale 1ns/1ns

module dff_tb;
	reg prn, clk, d, clrn;
	wire q, qn;

	dff dff (prn, clk, d, clrn, q, qn);

	initial begin
		#0 clk 	= 0;
		   prn 	= 1;
		   clrn = 0;
		 	 d 	= 0;

		#1 clrn = 1;
		#1 prn 	= 0;
			d	= 1;
		#1 prn  = 1;
		#1 	d 	= 0;
		#2   d 	= 1;
		#2   d 	= 0;
		#1   d 	= 1;
		#2   d 	= 0;
		#3   d 	= 1;
		#2   d 	= 0;
		#2   d 	= 1;
		#1   d 	= 0;
		#2   d 	= 1;
		#3   d 	= 0;
		#6   $finish;
	end
	
	initial begin
		$dumpfile("dFF_Schematic.vcd");
		$dumpvars;
	
	end


	always #5 clk = !clk;

endmodule
