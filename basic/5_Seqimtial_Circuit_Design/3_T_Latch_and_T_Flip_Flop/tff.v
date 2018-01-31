module tff (t, clk, clrn, q);
	
	input t, clk, clrn;
	output reg q;
	
	always @ (posedge clk or negedge clrn) begin
		if (!clrn)	q <= 0;
		else 		q <= t & ~q | ~t & q;
	end

	
endmodule
