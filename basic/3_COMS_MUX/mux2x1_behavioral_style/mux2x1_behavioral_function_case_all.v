module mux2x1_behavioral (a, b, s, y);
	
	input a, b, s;
	output y;

	assign y = sele(a, b, s);
	function sele;
		input a, b, s;
		case (s)
			1'b0: sele = a;
			1'b1: sele = b;
		endcase
		
	endfunction
	

endmodule
