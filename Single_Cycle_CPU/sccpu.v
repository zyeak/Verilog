// single cycle CPU
module sccpu (clk, clrn, inst, dmem , pc, wmen, alu, data);
	input clk, clrn;
	input [31:0] inst;		// instruction from instruction memory
	input [31:0] dmem;      // data from data memory;
	
	output [31:0] pc;		// programer counter
	output [31:0] alu;		// ALU output
	output [31:0] data;		// output data to data memory
	output wmen;			// write data memory enable

	// instruction fields;
	wire [5:0] op = inst[31:26];			// op
	wire [4:0] rs = inst[25:21];			// rs
	wire [4:0] rt = inst[20:16];			// rt
	wire [4:0] rd = inst[15:11];			// rd
	
	wire [5:0]  func = inst[05:00];			// function
	wire [15:0] imm  = inst[15:00];			// immediate
	wire [25:0]	addr = inst[25:00];			// address
 	
	// control signals;
	wire [3:0] 	aluc;						// ALU operational control
	wire [1:0] 	pcsrc;						// select pc source
	wire 	   	wreg;						// wire regfile
	wire		regrt;						// data reg number of rt
	wire		m2reg;						// memory to register; instruction lw;
	wire		shift;						// instruction shift;
	wire 		aluimm;						// ALU input b is an i32;
	wire		jal;						// instruction jal;
	wire 		sext;						// sign extension
	
	// data path wires;
	wire [31:0] p4;							// pc + 4
	wire [31:0] bpc;						// branch target address;
	wire [31:0] npc;						// next pc;
	wire [31:0] qa, qb;						// register output port A and B;
	wire [31:0] alua, alub;					// ALU input A and B;	
	wire [31:0] wd;							// regfile write data;
	wire [31:0] r;							// ALU out or mem;
	wire [31:0] sa = {27'b0, inst[10:6]};	// shift amount;
	wire [31:0] s16 = {16{sext & in[15]}};	// 16-bits signs;
	wire [31:0] i32 = {s16, imm};			// 32-bits immediate;
	wire [31:0] dis = {s16[13:0], imm, 2'b00};// word distance;
	wire [31:0] jpc = {p4[31:28], addr, 2'b00}; // jump target address;
	wire [4:0]  reg_dest;					// rs or rt;
	wire [4:0]  wn = reg_dest | {5{jal}};	//reg write reg #;
	wire 		z;							// zero flag;
	
	// control unit;
	sccu_dataflow cu (op, func, z, wmen, wreg,
						regrt, m2reg, aluc, shift,
						aluimm, pcsrc, jal, sext);
	
	
	//data path;
	
	
endmodule