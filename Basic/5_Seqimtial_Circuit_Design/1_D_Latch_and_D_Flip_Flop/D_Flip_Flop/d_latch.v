// a D latch, which can store one bit information
module d_latch (d, c, q, qn);

	input d, c;
	output q, qn;
	
	wire r, s;
	
	nand nand1 (s, d, c);
	nand nand2 (r, ~d, c);
	
	rs_latch rs (s, r, q, qn);	
endmodule
