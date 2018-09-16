// 4 bit CLA(carry look ahead) = 2 * 2_bit CLA + 1_gp

module clax4 (a, b, c_in, g_out, p_out, s);

	input [3:0] a, b;
	input c_in;
	
	output g_out, p_out;
	output [3:0] s;
	
	wire [1:0] g, p;
	wire 	   c_out;
	
	// clax2 (a, b, c_in, g_out, p_out, s);
	clax2 c1 (a[1:0], b[1:0], c_in, g[0], p[0], s[1:0]);
	clax2 c2 (a[3:2], b[3:2], c_out, g[1], p[1], s[3:2]);
	
	//gp (g, p, c_in, c_out, g_out, p_out);
	gp gp1 (g, p, c_in, g_out, p_out, c_out);
	
endmodule
