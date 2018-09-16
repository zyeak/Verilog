/*
* 32-bit adder/subracter
* input: a, b, sub
* output: s
*
*/

module addsub32(
	input [31:0] a,b,
	input 	     sub,	// sub 0: s = a+b; 
				//     1: s = a-b;
	output [31:0] s,	// sum
);

	wire [31:0] b_xor_sub = b ^ {32{sub}};	// b xor sub

	// cla32 -- 32-bit carry look ahead adder
	// sub == 0: a + b = a +   b  + 0  = a + (b xor sub) + sub
	// 	  1: a - b = a + (-b) + 1  = a + (b xor sub) + sub
	cal32 as32 (a, b_xor_sub, sub, s);


endmodule
