// 32x32 register

module regfile (rna, rnb, d, wn, we, clk, clrn, qa, qb);

	input [31:0] d;
	input [4:0] rna, rnb;			// reg # of read port A and B
	input [4:0] wn;				// reg # of write port
	input we;				// write enable
	input clk, clrn;
	
	output [31:0] qa, qb;			// read port A and B

	reg [31:0] register [1:31];		
	
	integer i;
	
	assign qa = (rna == 0) ? 0 : register[rna];
	assign qb = (rnb == 0) ? 0 : register[rnb];
	
	always @(posedge clk or negedge clrn) begin
	
		if (!clrn) begin
			for (i = 1; i < 32; i++)
				register[i] <= 0;
		end // !clrn
		else begin
			if ((wn != 0) && we)
				register[wn] <= d;
		end // else
	
	end // always
	
	
endmodule
