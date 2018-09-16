// 8-3 priority encoder with enable
// d[7] has hightest priority and d[0] has the lowest priority.

module encoder (d, ena, n, g);
	
	input [7:0] d;
	input ena;
	output [2:0] n;
	output g;
	
	assign g = ena & |d;			// if there is at least a 1 in d
									// |d = d[7]+d[6]+d[5]+d[4]+d[3]+d[2]+d[1]+d[0] 
	assign n = enc(ena, d);			// call a function enc
	
	function [2:0] enc;
		input ena;
		input [7:0] d;
		
		case ({ena, d})
		
			9'b1_1xxxxxx: enc = 3'd7;	//d[7] has the hightest priority
			9'b1_01xxxxx: enc = 3'd6;	//d[6] is active, ignore d[5:0]
			9'b1_001xxxx: enc = 3'd5;
			9'b1_0001xxx: enc = 3'd4;
			9'b1_00001xx: enc = 3'd3;
			9'b1_000001x: enc = 3'd2;
			9'b1_0000001: enc = 3'd1;	//d[0] has the loweset priority
			default:	  enc = 3'd0;
		
		endcase
		
	endfunction
	

endmodule 
