// Single cycle computer

module sccomp (clk, clrn, inst, pc, alu_out, mem_out);

	input clk, clrn;
	
	output [31:0] pc;
	output [31:0] inst;
	output [31:0] alu_out;
	output [31:0] mem_out;
	
	wire  [31:0] data;
	wire 		 wmem;					// wire data memory
	
	sccpu cpu (clk, clrn, inst, mem_out, pc, wmen, alu_out, data);
	scinstmem imem (pc, inst);
	scdatamem dmem (clk, mem_out, data, alu_out, wmen);

endmodule