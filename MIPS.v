`include "ctrl_encode_def.v"

module MIPS(reset, clk);

input				reset;
input				clk;
//PC
wire	[31:0]		pc;
//IM
wire	[4:0]		ins_address;
wire	[31:0]		instruction;
//GPR
wire	[4:0]		reg_w_sel, reg_rs_sel, reg_rt_sel;
wire	[31:0]		reg_w_data;
wire	[31:0]		reg_rs, reg_rt;
wire				reg_w;
//EXT
wire	[15:0]		ext_in;
wire	[1:0]		ext_op;
wire	[31:0]		ext_out;
//DM
wire	[4:0]		data_address;
wire	[31:0]		data_out;
//CU
wire	[5:0]		opcode;
wire	[5:0]		funct;
wire	[1:0]		pc_sel;
wire	[1:0]		reg_dst;
wire	[1:0]		reg_src;
wire				data_mem_wr;
wire				alu_src_a_sel;
wire				alu_src_b_sel;
wire				ext_src;
wire	[4:0]		alu_op;
//ALU
wire	[31:0]		alu_src_a;
wire	[31:0]		alu_src_b;
wire	[31:0]		alu_result;
wire				alu_zero;

//PC块实例化	
PCU pcu(.reset(reset), .pc_sel(pc_sel), .clk(clk), .address_j(instruction), .address_jr(reg_rs), .address_b(ext_out), .pc(pc));

assign ins_address = pc[6:2];
//指令寄存器实例化	
IM im(.ins_address(ins_address), .instruction(instruction));

assign opcode = instruction[31:26];
assign funct = instruction[5:0];
assign reg_rs_sel = instruction[25:21];
assign reg_rt_sel = instruction[20:16];
assign reg_w_sel = (reg_dst == `GPR_RD)? instruction[15:11] : (reg_dst == `GPR_RT)? instruction[20:16] : {5'b11111};
assign reg_w_data = (reg_src == `WD_ALU)? alu_result : (reg_src == `WD_MEM)? data_out : (pc + 4); 
assign reg_w = (reg_src == `WD_NO)? 0 : 1;
//寄存器堆实例化
GPR gpr(.clk(clk), .reg_w(reg_w), .reg_w_sel(reg_w_sel), .reg_w_data(reg_w_data), .reg_rs_sel(reg_rs_sel), .reg_rt_sel(reg_rt_sel), .reg_rs(reg_rs), .reg_rt(reg_rt));
//控制器实例化
CU cu(.opcode(opcode), .funct(funct), .alu_zero(alu_zero), .pc_sel(pc_sel), .data_mem_wr(data_mem_wr), .reg_dst(reg_dst), .reg_src(reg_src), .alu_src_a_sel(alu_src_a_sel), .alu_src_b_sel(alu_src_b_sel), .ext_src(ext_src), .ext_op(ext_op), .alu_op(alu_op));
assign alu_src_a = (alu_src_a_sel == 0)? reg_rs : ext_out;
assign alu_src_b = (alu_src_b_sel == 0)? reg_rt : ext_out;
assign ext_in = (ext_src == 0)? instruction[15:0] : {11'b00000000000, instruction[10:6]};
//扩展器实例化	
EXT ext(.ext_in(ext_in), .ext_op(ext_op), .ext_out(ext_out));
//ALU实例化	
ALU alu(.alu_src_a(alu_src_a), .alu_src_b(alu_src_b), .alu_op(alu_op), .alu_result(alu_result), .alu_zero(alu_zero));
//DM实例化
assign data_address = alu_result[4:0];
DM dm(.data_address(data_address), .data_in(reg_rt), .data_wr(data_mem_wr), .clk(clk), .data_out(data_out));

endmodule











