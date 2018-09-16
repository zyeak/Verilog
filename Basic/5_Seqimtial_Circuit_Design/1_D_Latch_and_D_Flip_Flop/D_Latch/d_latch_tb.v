`timescale 1ns/1ns

module d_latch_tb;
	
	reg c, d;
	wire q, qn;

	d_latch d_latch (c, d, q, qn);

	initial begin
		#0  c = 0; d = 0;
		#28 $finish;
	end

	initial begin
		$dumpfile("d_latch.vcd");
		$dumpvars;
	end 

	always #4 c = !c;
	always #3 d = !d;

endmodule
