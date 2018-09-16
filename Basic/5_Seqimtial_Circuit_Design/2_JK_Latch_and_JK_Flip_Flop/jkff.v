// jk_latch is rarely used, because it toggles without speed control
// jk_ff is common used.
// jk_ff with asynchronous reset 
module jkff (j, k, clk, clrn, q);
	
	input j ,k, clk, clrn;
	output reg q;
	
	always @ (posedge clk or negedge clrn) begin
		if (!clrn)	q <= 0;
		else 		q <= j & ~q | ~k & q;
	end

	
endmodule
