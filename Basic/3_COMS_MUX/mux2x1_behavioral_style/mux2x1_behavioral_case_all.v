module mux2x1_behavioral (a, b, s, y);
	
	input a, b, s;
	output y;

	reg y;

	always @ (s or a or b)
	begin
		case (s)
			1'b0: y = a;
			1'b1: y = b;
		endcase
	end 

endmodule
