`timescale 1ns/1ns

module fifo_tb;
	reg clk, clrn;
	reg read, write;
	reg [7:0] data_in;
	wire [7:0] data_out;
	wire ready;
	wire overflow;

	fifo fifo (clk, clrn, read, write, data_in, data_out, ready, overflow);

	initial begin
		#0 clk 	= 0;
		   clrn = 0;
		   read = 0;
		   write = 0;

		#2 clrn = 1;
	       write = 1;
		   data_in = 8'he0;
		#2 data_in = 8'he1;
		#2 data_in = 8'he2;
		#2 data_in = 8'he3;
		#2 data_in = 8'he4;
		#2 data_in = 8'he5;
			read = 1;

		#2 data_in = 8'he6;
		#2 data_in = 8'he7;
		#2 data_in = 8'he8;
			read = 0;

		#2 data_in = 8'he9;
		#2 data_in = 8'hea;
		#2 data_in = 8'heb;
		#2 data_in = 8'hec;
		#2 data_in = 8'hed;
		#2 data_in = 8'hee;
		#2 data_in = 8'hef;
		#2 data_in = 8'hf0;
			read = 1;
		#2 data_in = 8'hf1;
		#2 data_in = 8'hf2;
			read = 0;
		#2 data_in = 8'hf3;
			read = 1;
		#2 data_in = 8'hf4;
			write = 0;
		#5 $finish;
	end

	always #1 clk = !clk;

	initial begin
		$dumpfile("fifo.vcd");
		$dumpvars;
	end

endmodule
