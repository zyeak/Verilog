//
module newton (a, b, start, clk, clrn, q,  busy, ready, count);

	input [31:0] a, b;										//dividend a: .1xxxxx
															// divisor b: .1xxxxx
	input start;
	input clk, clrn;
	output [31:0] q;										// quotinet:  x.xxxxx
	output reg busy, ready;
	output [1:0] count;
	
	reg [31:0] reg_a;										//  .1xxxxx
	reg [31:0] reg_b;										//  .1xxxxx	
	reg [33:0] reg_x;										//xx.xxxxx
	reg [2:0]  count;
	
	// x_{i+1} = x_i * (2 - x_i * b) 
	wire [65:0] axi = reg_a * reg_x;						// xx.xxxxx
	wire [65:0] bxi = reg_b * reg_x;						// xx.xxxxx
	
	wire [33:0] b34 = ~bxi[64:31] + 1'b1;					//  x.xxxxx 
	wire [67:0] x68 = reg_x * b34;							//xxx.xxxxx
	wire [7:0]  x0  = rom(b[30:27]);
	
	assign q = axi[64:33] + |axi[32:30];					//rounding up
	
	always @(posedge clk or negedge clrn) begin
		
		if(!clrn) begin
			ready <= 0;
			busy  <= 0;
		end	//!clrn
		else begin
			if(start) begin
				reg_a <= a;									// 0.1xxxxxxxx
				reg_b <= b;									// 0.1xxxxxxxx
				reg_x <= {2'b1, x0, 24'b0};					//01.xxxxx0000
				busy  <= 1;
				ready <= 0;
				count <= 0;
			end //start
			else if (busy) begin
				reg_x <= x68[66:33];						//xx.xxxxx
				count <= count + 2'b1;
				
				if (count == 2'h2) begin					// finish
					busy <= 0;
					ready <= 1;
				end // count
				
			end //busy
			
		end //else
	end

	function [7:0] rom;										// a rom table
		input [3:0] b;
		case (b)
			4'h0: rom = 8'hff;		4'h1: rom=8'hdf;
			4'h2: rom = 8'hc3;		4'h3: rom=8'haa;
			4'h4: rom = 8'h93;		4'h5: rom=8'h7f;
			4'h6: rom = 8'h6d;		4'h7: rom=8'h5c;
			4'h8: rom = 8'h4d;		4'h9: rom=8'h3f;
			4'ha: rom = 8'h33;		4'hb: rom=8'h27;
			4'hc: rom = 8'h1c;		4'hd: rom=8'h12;
			4'he: rom = 8'h08;		4'hf: rom=8'h00;
			
		endcase
	endfunction
endmodule