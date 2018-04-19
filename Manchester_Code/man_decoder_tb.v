`timescale 1ns/1ns

module man_decoder_tb;

	reg clk_32Mhz, encoded_data, rst;
	wire decoded_data, decoded_clk;

	man_decoder decoder(encoded_data, clk_32Mhz, rst, decoded_data, decoded_clk);

	initial begin

		#0	rst = 0; 
			clk_32Mhz = 0;
			encoded_data = 0;

		#1	rst = 1;
		#1	rst = 0;

		 	encoded_data = 0;
		#32	encoded_data = 1;
		#32	encoded_data = 0;
		#32	encoded_data = 1;
		
		#1 $finish;
	end

	initial begin
		$monitor("%2d: %b\t %b\t", $time, encoded_data, decoded_data);
		$dumpfile("decoder.vcd");
		$dumpvars;
	end

	always #1 clk_32Mhz = ~clk_32Mhz;


endmodule
