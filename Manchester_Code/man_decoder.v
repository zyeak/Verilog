module man_decoder(encoded_data, clk_32Mhz, rst, decoded_data, decoded_clk);
	input wire encoded_data, clk_32Mhz, rst;
	output reg decoded_data; 
	output wire decoded_clk;
	
	reg [1:0] cnt1;
	reg [3:0] cnt2;
	reg clk_4Mhz;	

	// Manchester Ddecoder
	always @(posedge clk_32Mhz or negedge rst) begin
		if(rst) begin
			clk_4Mhz <= 0;
			cnt1 <= 0;
			cnt2 <= 0;			
			decoded_data <= 0;
		end
		else begin
			
			if(cnt1 == 2'b11) begin
				clk_4Mhz <= ~clk_4Mhz;
			end
			if(cnt2 == 4'd12) begin 
				decoded_data <= encoded_data;
			end 
			cnt1 <= cnt1 + 1;
			cnt2 <= cnt2 + 1;
		end
	end

	assign decoded_clk = clk_4Mhz;
	

endmodule
