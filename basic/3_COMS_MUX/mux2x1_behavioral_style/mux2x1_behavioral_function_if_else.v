module mux2x1_behavioral (a, b, s, y);
	
	input a, b, s;
	output y;

	assign y = sele (a, b, s);
	
	function sele;
		input a, b ,s;
		if(s)
			sele = b;
		else
			sele = a;
	endfunction

endmodule
