// full adder, behavioral style

module add (a, b, ci, s, co);

	input a, b, ci;
	output s, co;
	
	assign {co, s} = a + b + ci;

endmodule