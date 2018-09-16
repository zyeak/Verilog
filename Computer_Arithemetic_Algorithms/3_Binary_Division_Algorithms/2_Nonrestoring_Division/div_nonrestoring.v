//
module div (a, b, start, clk, clrn, q, r, busy, ready, count);

	input [31:0] a, b;
	input start;
	input clk, clrn;
	output [31:0] q;	// quotinet
	output [15:0] r;	// remaindor
	output reg busy, ready;
	output [4:0] count;
	
	reg [31:0] reg_q;
	reg [15:0] reg_r;
	reg [15:0] reg_b;	// storing divisor b
	reg [4:0]  count;
	
//	wire [16:0] sub_out = {reg_r, reg_q[31]} - {1'b0, reg_b}	// sub
//	wire [15:0] mux_out = sub_out[16] ? {reg_r[14:0], reg_q[31]} : sub_out[15:0];	//restoring or not
	wire [16:0] sub_add = reg_r[15] ?								// add or sub 
							{reg_r, reg_q[31]} + {1'b0, reg_b} : 	// +b
							{reg_r, reg_q[31]} - {1'b0, reg_b};		// -b
	
	
	assign q = reg_q;
	assign r = reg_r[15] ? reg_r + reg_b : reg_r;
	
	always @(posedge clk or negedge clrn) begin
		
		if(!clrn) begin
			ready <= 0;
			busy  <= 0;
		end	//!clrn
		else begin
			if(start) begin
				reg_q <= a;
				reg_b <= b;
				reg_r <= 0;
				busy  <= 1;
				ready <= 0;
				count <= 0;
			end //start
			else if (busy) begin
				reg_q <= {reg_q[30:0], ~sub_add[16]};	// <<1
				reg_r <= sub_add[15:0];
				count <= count + 5'b1;
				
				if (count == 5'h1f) begin				// finish
					busy <= 0;
					ready <= 1;
				end // count
				
				
			end //busy
			
		end //else
	end

endmodule