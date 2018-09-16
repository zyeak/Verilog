module mux2x1_triState (a, b, s, y);
	
	input a, b ,s;
	output y;

	//bufif0 (out, in, ctl)	//tri-statue buffer: ctl=0, out=in;
	bufif0 b0 (y, a, s);

	//bufif1 (out, in, ctl)	//tri-statue buffer: ctl=1, out=in;
	bufif1 b1 (y, b, s);


endmodule

