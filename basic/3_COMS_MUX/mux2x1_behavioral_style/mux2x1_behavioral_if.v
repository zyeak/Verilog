module mux2x1_behavioral (a, b, s, y);
	
	input a, b, s;
	output y;

	reg y;

	always @ (s or a or b)
	begin
		y = a;

		if(s)
		begin
			y = b;
		end

	end 

endmodule
