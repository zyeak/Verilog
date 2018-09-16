`timescale 1ns/1ns

module cmosnand_tb;
	reg a, b;
	wire f;

	cmosnand cmos_nand (f, a, b);
	
	initial
	begin
		a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
		#1 $finish;
	end 

	initial
	begin
		$monitor("%2d:\ta=%b \tb=%b \tf=%b", $time, a, b, f);
	end

endmodule
