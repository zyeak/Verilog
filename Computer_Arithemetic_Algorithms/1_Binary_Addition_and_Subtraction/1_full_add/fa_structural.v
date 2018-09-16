// full adder, structural style

module add (a, b, ci, s, co);

	input a, b, ci;
	output s, co;
	
	wire ab, bc, ca;
	
	and i1 (ab, a, b);
	and i2 (bc, b, c);
	and i3 (ca, c, a);
	
	or i4 (co, ab, bc, ca);
	
	xor i5 (s, a, b, ci);

endmodule