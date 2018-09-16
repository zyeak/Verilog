// dff generated from schematic, industry way
module dff (prn, clk, d, clrn, q, qn);
	input prn, clk, d, clrn;						//prn: preset; cln: clear (active low);
	output q, qn;
	
	wire wire_0, wire_1, wire_2, wire_3;  

	assign wire_0 = ~(wire_1 & prn 	& wire_2); 	//3-input nand
	assign wire_1 = ~(clk 	 & clrn & wire_0);
	assign wire_2 = ~(wire_3 & clrn & d);
	assign wire_3 = ~(wire_1 & clk  & wire_2);
	
	assign q = ~(prn & wire_1 & qn);
	assign qn = ~(q & wire_3 & clrn);
	
endmodule
