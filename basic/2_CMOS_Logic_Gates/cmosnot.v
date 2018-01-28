module cmosnot (f, a);
	input a;
	output f;
	supply1 vdd;
	supply0	gnd;
	
	// pmos(drain, source, gate);
	pmos p1 (f, vdd, a);

	// nmos(drian, source, gate);
	nmos n1 (f, gnd, a);
endmodule
