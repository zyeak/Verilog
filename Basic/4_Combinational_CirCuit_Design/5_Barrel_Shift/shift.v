// barrel shifter, behavior style
module shift (data, shift, right, arith, result);
	
	input [31:0] data;		//input: 32bit data to be shifter;
	input [4:0] shift;	//input: shifter amount, 5 bits;
	input right;			//shift right: 1; shift left: 0;
	input arith;			//arithmetic shift: 1; logic shift: 0;
	output [31:0] result;	//output: 32bit shift result;
	
	reg [31:0] result;
	
	always @* begin
		if( !right ) begin					// shift left
			result = data << shift;
		end
		else if( !arith ) begin				// logic right shift 
			result = data >> shift;
		end
		else begin							// arithmetic right shift
//			result = data >>> shift;			// method1		ff00_00ff => 00ff_0000
			result = $signed(data) >>> shift;	// method2 		ff00_00ff => ffff_0000
		end
	
	end

endmodule
