`timescale 1ns/1ns

module man_encoder_tb;

	reg clk, data;
	wire out;

	man_encoder encoder(clk, data, out);

	initial begin
		#0	data = 0;
		#1	data = 1;
		#4	data = 0;
		#4	data = 1;
		#2	data = 0;

		#1 $finish;
	end

	initial begin
		$monitor("%2d:%b\t%b\t", $time, data, out);
		$dumpfile("encoder.vcd");
		$dumpvars;
	end

	always #1 clk = !clk;


endmodule
