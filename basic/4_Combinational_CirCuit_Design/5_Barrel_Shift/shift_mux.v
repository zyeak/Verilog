// a barrel shift using mux
module shift (data, s, right, arith, result);

	input [31:0] data;		//input: 32bit data to be shifter;
	input [4:0] s;	//input: shifter amount, 5 bits;
	input right;			//shift right: 1; shift left: 0;
	input arith;			//arithmetic shift: 1; logic shift: 0;
	output [31:0] result;	//output: 32bit shift result;
	
	wire [31:0] t0, t1, t2, t3, t4;				// wires: outputs of muxs
	wire [31:0] s1, s2, s3, s4, s5;				// wires: outputs of muxs
	
	wire a = data[31] & arith;					// a: filling bit;
	
	wire [15:0]	e = {16{a}};					// replicate a to 16 bits
	
	parameter z = 16'b0;						//a 16 bits zero
	
	wire [31:0] sdl0, sdl1, sdl2, sdl3, sdl4;	//left shift data
	wire [31:0]	sdr0, sdr1, sdr2, sdr3, sdr4;	//right shift data
	
	// left shift
	assign sdl4 = {data[15:0], z};					// shift to left by 16 bits
	assign sdl3 = {data[23:0], z[7:0]};			// shift to left by 8 bits
	assign sdl2 = {data[27:0], z[3:0]};			// shift to left by 4 bits
	assign sdl1 = {data[29:0], z[1:0]};			// shift to left by 2 bits
	assign sdl0 = {data[30:0], z[0]};				// shift to left by 1 bits
	
	// ritht shift
	assign sdr4 = {e, data[31:16]};				// shift to ritht by 16 bits
	assign sdr3 = {e[7:0], data[31:8]};			// shift to ritht by 8 bits
	assign sdr2 = {e[3:0], data[31:4]};			// shift to ritht by 4 bits
	assign sdr1 = {e[1:0], data[31:2]};			// shift to ritht by 2 bits
	assign sdr0 = {e[0], data[31:1]};				// shift to ritht by 1 bits
	
	//select left or right
	mux2x32 m_rigth4 (sdl4, sdr4, right, t4);
	mux2x32 m_rigth3 (sdl3, sdr3, right, t3);
	mux2x32 m_rigth2 (sdl2, sdr2, right, t2);
	mux2x32 m_rigth1 (sdl1, sdr1, right, t1);
	mux2x32 m_rigth0 (sdl0, sdr0, right, t0);
	
	//select shift or not_shift
	mux2x32 m_shift4 (data, t4, s[4], s4);
	mux2x32 m_shift3 (s4, t3, s[3], s3);
	mux2x32 m_shift2 (s3, t2, s[2], s2);
	mux2x32 m_shift1 (s2, t1, s[1], s1);
	mux2x32 m_shift0 (s1, t0, s[0], result);
	
endmodule
