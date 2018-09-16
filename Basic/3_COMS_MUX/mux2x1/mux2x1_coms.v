module mux2x1_coms (a, b, s, y);
	input a, b, s;
	output y;
	
	wire s_not; 	//internal wire, output of inverter 

	cmosnot inv (s_not, s);
	
	// cmosTran (drain, source, n_gate, p_gate)
	cmosTran c0 (y, a, s_not, s);
	cmosTran c1 (y, b, s, s_not);

endmodule
