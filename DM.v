`include "ctrl_encode_def.v"

module DM(data_address, data_in, data_wr, clk, data_out);

input	[4:0]		data_address;
input	[31:0]		data_in;
input				data_wr;
input				clk;

output	[31:0]		data_out;

reg	[31:0]		data_mem[1023:0];

always@(posedge clk)begin
	if(data_wr == 1)
		data_mem[data_address] <= data_in;
end

assign data_out = data_mem[data_address];

endmodule