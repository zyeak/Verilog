`timescale 1ns/1ns
module jkff_tb;

	reg j, k, clk, clrn;
	wire q;

	jkff jkff(j, k, clk, clrn, q);

	initial begin
		 clk = 1; clrn = 0;
		 j = 0; k = 0;
		 #1 clrn = 1; k = 1;
		 #2 k = 0; j = 1;
		 #2 j = 0;
		 #2 k = 1; j = 1;
		 #8 k = 0; j = 0;
		 #2 $finish;
	end
	
	initial begin
		$dumpfile("jkff.vcd");
		$dumpvars;
	end

	always #1 clk = !clk;

endmodule	
