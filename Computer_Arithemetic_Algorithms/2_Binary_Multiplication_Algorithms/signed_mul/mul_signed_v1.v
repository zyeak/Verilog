// 8x8 signed multiplier
module mul_signed (a, b, z);

	input [7:0] a, b;
	output [15:0] z;
	
	wire [7:0] ab0 = a & {8{b[0]}};
	wire [7:0] ab1 = a & {8{b[1]}};
	wire [7:0] ab2 = a & {8{b[2]}};
	wire [7:0] ab3 = a & {8{b[3]}};
	wire [7:0] ab4 = a & {8{b[4]}};
	wire [7:0] ab5 = a & {8{b[5]}};
	wire [7:0] ab6 = a & {8{b[6]}};
	wire [7:0] ab7 = a & {8{b[7]}};
	
	assign z = (({8'b1, ~ab0[7], ab0[6:0]} 		 +
				{7'b0, ~ab1[7], ab1[6:0], 1'b0}) +
				({6'b0, ~ab2[7], ab2[6:0],1'b1}  +
				{5'b0, ~ab3[7], ab3[6:0], 1'b2}) +
				({4'b0, ~ab4[7], ab4[6:0],1'b3}  +
				{3'b0, ~ab5[7], ab5[6:0], 1'b4}) +
				({2'b0, ~ab6[7], ab6[6:0],1'b5}  +
				{1'b1, ~ab7[7], ~ab7[6:0], 1'b6}) );
	
endmodule