module mux2x1_dataflow (a, b, s, y);

	input a, b, s;
	output y;

//	assign y = (~s & a) | (s & b);
	assign y = s ? a : b;	

endmodule
