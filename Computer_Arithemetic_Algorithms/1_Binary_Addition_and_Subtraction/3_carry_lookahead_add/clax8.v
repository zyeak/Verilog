// 8 bit CLA(carry look ahead) = 2 * 4_bit CLA + 1_gp

module clax8 (a, b, c_in, g_out, p_out, s);

	input [7:0] a, b;
	input c_in;
	
	output  g_out, p_out;
	output [7:0] s;
	
	wire [1:0] g, p;
	wire	c_out;
	
	// clax4 (a, b, c_in, g_out, p_out, s);
	clax4 c1 (a[3:0], b[3:0], c_in, g[0], p[0], s[3:0]);
	clax4 c2 (a[7:4], b[7:4], c_out, g[1], p[1], s[7:4]);
	
	//gp (g, p, c_in, c_out, g_out, p_out);
	gp gp1 (g, p, c_in,  g_out, p_out, c_out);
	
endmodule
