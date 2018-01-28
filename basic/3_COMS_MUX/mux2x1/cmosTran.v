module cmosTran (drain, source, n_gate, p_gate);
	
	input source, n_gate, p_gate;
	output drain;
	
	pmos p1 (drain, source, p_gate);
	nmos n1 (drain, source, n_gate);

endmodule
