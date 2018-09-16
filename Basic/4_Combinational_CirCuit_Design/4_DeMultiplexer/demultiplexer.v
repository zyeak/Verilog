// a 1-to-8 demultiplexer
module demux1to8 (s, y, a);

	input	[3:0] s;
	input		  y;
	output	[7:0] a;
	
	assign a = (1 << s) & {8{y}};	// the value of (2^s)th bit = y;

endmodule