// FIFO

module fifo (clk, clrn, read, write, data_in, data_out, ready, overflow);

	input clk, clrn;
	input read, write;					// read and wirte, active high
	input [7:0] data_in;
	output [7:0] data_out;
	output ready;						// fifo has data
	output reg overflow;				// fifo overflow flag

	reg [7:0] fifo_buffer [7:0];		// fifo buffer of depth 8
	reg [2:0] write_pointer;
	reg [2:0] read_pointer;
	
	always @ (posedge clk or negedge clrn) begin
		if (!clrn)	begin
			write_pointer <= 0;
			read_pointer <= 0;
			overflow <= 0;
		end	//if_!clrn
		else begin
			if (write) begin
				if((write_pointer + 3'b1) != read_pointer) begin
					fifo_buffer[write_pointer] <= data_in;
					write_pointer <= write_pointer + 3'b1;
				end //if
				else begin
					overflow <= 1;
				end // else
			end //if_write
			
			if (read && ready) begin
				read_pointer <= read_pointer + 3'b1;
				overflow <= 0;
			end //if_read
			
		end //else
	end //always
	
	assign ready = (write_pointer != read_pointer);
	assign data_out = fifo_buffer[read_pointer];
	
endmodule
