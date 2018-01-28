`timescale 1ns/1ns

module mux2x1_dataflow_tb;

	reg s, a, b;
	wire y;

	mux2x1_dataflow mux2x1 (a, b, s, y);

	initial
	begin
		a = 0; b = 0; s = 0;
		$display("time\ts\ta\tb\ty");
		$monitor("%2d: \t%b \t%b \t%b \t%b", $time, s, a, b, y);
		#8 $finish;
	end

	always #1 a = !a;
	always #2 b = !b;
	always #4 s = !s;

endmodule
