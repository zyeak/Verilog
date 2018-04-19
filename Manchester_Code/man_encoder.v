
module man_encoder(clk, data, out);
	input wire clk, data;
	output reg out;

	assign out = clk ^ data;

endmodule
