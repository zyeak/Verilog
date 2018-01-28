`timescale 1ns/1ns

module cmosnot_tb;
	reg a;
	wire f;

	cmosnot cmos_not (f, a);
	
	initial
	begin
		a = 0;
		#1 a = 1;
		#1 a = 0;
		#1 $finish;
	end 

	initial
	begin
		$monitor("%2d:\ta=%b \tf=%b", $time, a, f);
	end

endmodule
