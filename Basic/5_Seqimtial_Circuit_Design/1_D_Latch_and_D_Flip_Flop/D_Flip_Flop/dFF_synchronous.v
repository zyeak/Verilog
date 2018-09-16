// dff with synchronous reset (to clk)

module dff (d, clk, clrn, q);
	
	input d, clk, clrn;
	output reg q;
	
	
/*
	//positive edge
	always @(posedge clk) begin
		if (!clrn) 	q <= 0;
		else		q <= d;
	end
*/
	
	//negative edge
	always @(posedge clk or negedge clrn) begin
		if (!clrn) 	q <= 0;
		else		q <= d;
	end
	
endmodule