/*
* ALU Design --- 32bit ALU with a zero flag
* inputs: a,b,aluc
* outputs: r, z
*
* ALU_control: [3:0] 4bit
* x 0 0 0 ADD
* x 1 0 0 SUB
* x 0 0 1 AND
* x 1 0 1 OR
* x 0 1 0 XOR
* x 1 1 0 LUI -- Load upper immediate
* 0 0 1 1 SLL -- Shift Left Logic
* 0 1 1 1 SRL -- Shift Right Logic
* 1 1 1 1 SRA -- shift Right Arithmetic
*/

module alu(
	input [31:0] a,b,			// input a and b;
	input [3:0] aluc,			// alu control [3:0]
	output [31:0] r,			// result
	output 	      z				// zero flga
)


	wire [31:0] d_and = a & b;			// AND
	wire [31:0] d_or  = a | b;			// OR
	wire [31:0] d_xor = a ^ b;			// XOR
	wire [31:0] d_lui = {b[15:0], 16'h0};		// LUI
	wire [31:0] d_and_or = aluc[2]?d_or : d_and;	// Select Instruction AND or OR
	wire [31:0] d_xor_lui = aluc[2]?d_lui : d_xor;	// Select Instruction LUI or XOR
	wire [31:0] d_as, d_sh;				// d_as -- ADD or SUB; d_sh -- Shift

	// Add or Sub
	addsub as32(a, b, aluc[2], d_as);

	// Shift
	shift shifter(b, a[4:0], aluc[2], aluc[3], d_sh);

	// Mux4x32: ALU result selected by Mux
	mux4x32 result(d_sa, d_and_or, d_xor_lui, d_sh, aluc[1:0], r);

	// zero flag: z = (r==0) 
	assign z = ~|r;

endmoudle
