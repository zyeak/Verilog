`timescale 1ns/1ns

module shift_tb;

	reg [31:0] data;
	reg [4:0] s;
	reg right, arith;
	
	wire [31:0] result;
	
	shift shift (data, s, right, arith, result);

	initial begin
		   right = 0; arith = 0; data = 32'hff00_00ff;  s = 5'h8; 	
		#1 right = 1; arith = 0; data = 32'hff00_00ff;  s = 5'h8; 	
		#1 right = 1; arith = 1; data = 32'hff00_00ff;  s = 5'h8; 	
		#1 right = 0; arith = 0; data = 32'hff00_00ff;  s = 5'h0; 	
		#1 $finish;		
	end
	
	initial begin
		$monitor("%2d:\tright=%b\tarith=%b\tdata=%h\ts=%b\tresult=%h", $time, right, arith, data, s, result);
	end
	

endmodule
