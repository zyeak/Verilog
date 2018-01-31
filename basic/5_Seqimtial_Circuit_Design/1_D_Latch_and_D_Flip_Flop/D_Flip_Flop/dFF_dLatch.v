// dff using 2 D-Latch
module dff (d, clk, q, qn);
	
	input d, clk;
	output q, qn;
	
	wire q0, qn0;
	wire clkn, clknn;
	
	not	inv1 (clkn, clk);
	not inv2 (clknn, clkn);
	
	d_latch d_master (d, clkn, q0, qn0);
	d_latch d_slave	 (q0, clknn, q, qn);

endmodule
