// adder
module add (a, b, c, g, p, s);

	input a, b, c;
	output s, g, p;
	
	assign s = a ^ b ^ c;
	assign g = a & b;
	assign p = a | b;

endmodule