`include "ctrl_encode_def.v"

module GPR(clk, reg_w, reg_w_sel, reg_w_data, reg_rs_sel, reg_rt_sel, reg_rs, reg_rt);

input				clk;
input				reg_w;
input	[4:0]		reg_w_sel, reg_rs_sel, reg_rt_sel;
input	[31:0]		reg_w_data;

output	[31:0]		reg_rs, reg_rt;

reg		[31:0]		gpr[31:0];

always@(posedge clk)begin
	if(reg_w == 1)
		gpr[reg_w_sel] <= reg_w_data;
		$display("R[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", 0, gpr[1], gpr[2], gpr[3], gpr[4], gpr[5], gpr[6], gpr[7]);
		$display("R[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[8], gpr[9], gpr[10], gpr[11], gpr[12], gpr[13], gpr[14], gpr[15]);
		$display("R[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[16], gpr[17], gpr[18], gpr[19], gpr[20], gpr[21], gpr[22], gpr[23]);
		$display("R[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", gpr[24], gpr[25], gpr[26], gpr[27], gpr[28], gpr[29], gpr[30], gpr[31]);
		$display("R[%4X]=%8X", reg_w_sel, gpr[reg_w_sel]);
end

assign reg_rs = (reg_rs_sel == 0)? 0 : gpr[reg_rs_sel];
assign reg_rt = (reg_rt_sel == 0)? 0 : gpr[reg_rt_sel];

endmodule