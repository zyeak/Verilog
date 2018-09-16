//
module goldschmidt (a, b, start, clk, clrn, q,  busy, ready, count, yn);

	input [31:0] a, b;										//dividend a: .1xxxxx
															// divisor b: .1xxxxx
	input start;
	input clk, clrn;
	output [31:0] q;										// quotinet:  x.xxxxx
	output reg busy, ready;
	output [2:0] count;
	output [31:0] yn;										// .111111
	
	reg [63:0] reg_a;										// x.xxxxx
	reg [63:0] reg_b;										// 0.xxxxx	
	reg [2:0]  count;
	
	wire [63:0] two_minus_yi = ~reg_b + 1'b1;				// 1.xxxxx (2 - yi)
	wire [127:0] xi = reg_a * two_minus_yi;					//0x.xxxxx
	wire [127:0] yi = reg_b * two_minus_yi;					//0x.xxxxx
	
	assign q = reg_a[62:32] + |reg_a[31:29];				//rounding up
	assign yn = reg_b[62:31];
	
	always @(posedge clk or negedge clrn) begin
		
		if(!clrn) begin
			ready <= 0;
			busy  <= 0;
		end	//!clrn
		else begin
			if(start) begin
				reg_a <= {1'b0, a, 31'b0};					// 0.1xxxx0000
				reg_b <= {1'b0, b, 31'b0};					// 0.1xxxx0000
				busy  <= 1;
				ready <= 0;
				count <= 0;
			end //start
			else if (busy) begin
				reg_a <= xi[126:63];						// x.xxxxx
				reg_b <= yi[126:63];						// 0.xxxxx
				count <= count + 3'b1;
				
				if (count == 3'h4) begin					// finish
					busy <= 0;
					ready <= 1;
				end // count
				
				
			end //busy
			
		end //else
	end

endmodule