// a RS(reset-set) latch
module rs_latch (s, r, q, qn);
	
	input r, s;
	output q, qn;
	
	nand nand1 (q, s, qn);
	nand nand2 (qn, r, q);
	
endmodule