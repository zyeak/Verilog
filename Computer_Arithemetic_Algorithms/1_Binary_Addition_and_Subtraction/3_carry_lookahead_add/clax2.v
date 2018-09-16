// 2 bit CLA(carry look ahead) = 2_add + 1_gp

module clax2 (a, b, c_in, g_out, p_out, s);

	input [1:0] a, b;
	input c_in;
	
	output  g_out, p_out;
	output [1:0] s;
	
	wire [1:0] p,g;
	wire c_out;
	
	//add (a, b, c, g, p, s);
	add a1 (a[0], b[0], c_in, g[0], p[0], s[0]);
	add a2 (a[1], b[1], c_out, g[1], p[1], s[1]);
	
	//gp (g, p, c_in, c_out, g_out, p_out);
	gp gp1 (g, p, c_in, g_out, p_out, c_out);

endmodule
