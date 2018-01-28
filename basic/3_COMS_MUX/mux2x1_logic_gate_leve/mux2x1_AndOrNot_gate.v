module mux2x1_gate(a, b, s, y);
	input a, b, s;
	output y;
	
	wire sNot, a_sNot, b_s;

	not i0 	(sNot, s);
	and i1 	(a_sNot, a, sNot);
	and i2 	(b_s, b, s);
	or	i3	(y, a_sNot, b_s);


endmodule
