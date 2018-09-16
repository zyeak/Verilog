`timescale 1ns/1ns

module mux2x32_tb;
	
	reg [31:0] a0, a1;
	reg s;
	wire [31:0] y;
	
	mux2x32 mux2x32 (a0, a1, s, y);
	
	initial 
	begin
		
		a0 = 32'b0; a1 = 32'b0;
		s = 0;
		
		$display("time\ts\ta0\ta1\ty");
		$monitor("%2d:\t%b\t%b\t%b\t%b", $time, s, a0, a1, y);
		
		#10 $finish;
	end
	
	always #1 a0 = a0 + 1;
	always #2 a1 = a1 + 1;
	always #5 s = !s;
	
endmodule
