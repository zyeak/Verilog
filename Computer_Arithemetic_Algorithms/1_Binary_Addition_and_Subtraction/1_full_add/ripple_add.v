// ripple adder, 4 bit
// area-efficient, but slow because the carry travels through the chain of the full adders. 

module ripple_add (a, b, ci, s, co);
	
	input	[3:0] a, b;
	input   ci;
	output 	[3:0] s;
	output  co;
	
	wire [2:0] c;
	
	add a0 (a[0], b[0], ci, s[0], c[0]);
	add a1 (a[1], b[1], c[0], s[1], c[1]);
	add a2 (a[2], b[2], c[1], s[2], c[2]);
	add a3 (a[3], b[3], c[2], s[3], co);

endmodule
