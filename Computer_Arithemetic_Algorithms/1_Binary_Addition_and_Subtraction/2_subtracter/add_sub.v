// 4 bit adder / subtracter

module add_sub (a, b, ci, sub, s, co);
	
	input	[3:0] a, b;
	input   ci;
	input 	sub;
	output 	[3:0] s;
	output  co;
	
	wire [3:0] bx = b ^ {4{sub}};
	wire  	   cix = ci ^ sub;
	wire [2:0] c;
	
	add a0 (a[0], b[0], cix, s[0], c[0]);
	add a1 (a[1], b[1], c[0], s[1], c[1]);
	add a2 (a[2], b[2], c[1], s[2], c[2]);
	add a3 (a[3], b[3], c[2], s[3], co);

endmodule
