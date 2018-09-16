// genrates carry
module gp (g, p, c_in, c_out, g_out, p_out);

	input [1:0] g, p;
	input c_in;
	
	output c_out, p_out, g_out;
	
	assign g_out = g[1] | P[1] & g[0];
	assign p_out = p[1] & p[0];
	assign c_out = g[0] | p[0] & c_in;

endmodule