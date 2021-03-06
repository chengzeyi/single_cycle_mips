`include "ctrl_encode_def.v"
`include "instruction_def.v"

module CU(opcode, funct, alu_zero, pc_sel, data_mem_wr, reg_dst, reg_src, alu_src_a_sel, alu_src_b_sel, ext_src, ext_op, alu_op);
	
input	[5:0]		opcode;				//指令操作码字段
input	[5:0]		funct;				//指令功能字段
input				alu_zero;			//0:计算结果不为0，1：计算结果为0

output	reg[1:0]	pc_sel;				//#PC选择信号
output	reg			data_mem_wr;		//#选择读或写存储器，0：读，1：写
output	reg[1:0]	reg_dst;			//选择写入的寄存器
output	reg[1:0]	reg_src;			//#寄存器堆写入数据源及使能选择
output	reg			alu_src_a_sel;			//运算器操作数a选择，0：rs，1：unsigned externed shamt
output	reg			alu_src_b_sel;		//运算器操作数b选择，0：rt，1；externed immediate
output	reg			ext_src	;			//扩展操作数选择，0：immediate，1：shamt
output	reg[1:0]	ext_op;				//扩展功能选择
output	reg[4:0]	alu_op;				//Alu运算功能选择

initial begin
	pc_sel = `NPC_PLUS4;
	data_mem_wr = 0;
	reg_dst = `GPR_RD;
	reg_src = `WD_NO;
	alu_src_a_sel = 0;
	alu_src_b_sel = 0;
	ext_src = 0;
	ext_op = `EXT_ZERO;
	alu_op = `ALU_NOP;
end

always@(opcode or funct or alu_zero)begin
	case(opcode)
		`INSTR_RTYPE_OP:
			case(funct)
				`INSTR_ADD_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_ADD;
				end
				`INSTR_ADDU_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_ADDU;
				end
				`INSTR_SUB_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SUB;
				end
				`INSTR_SUBU_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SUBU;
				end
				`INSTR_AND_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_AND;
				end
				`INSTR_NOR_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_NOR;
				end
				`INSTR_OR_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_OR;
				end
				`INSTR_XOR_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_XOR;
				end
				`INSTR_SLT_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SLT;
				end
				`INSTR_SLTU_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SLTU;
				end
				`INSTR_SLL_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 1;
					alu_src_b_sel = 0;
					ext_src = 1;
					ext_op = `EXT_ZERO;
					alu_op = `ALU_SLL;
				end
				`INSTR_SRL_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 1;
					alu_src_b_sel = 0;
					ext_src = 1;
					ext_op = `EXT_ZERO;
					alu_op = `ALU_SRL;
				end
				`INSTR_SRA_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 1;
					alu_src_b_sel = 0;
					ext_src = 1;
					ext_op = `EXT_ZERO;
					alu_op = `ALU_SRA;
				end
				`INSTR_SLLV_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SLL;
				end
				`INSTR_SRLV_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SRL;
				end
				`INSTR_SRAV_FUNCT:begin
					pc_sel = `NPC_PLUS4;
					data_mem_wr = 0;
					reg_dst = `GPR_RD;
					reg_src = `WD_ALU;
					alu_src_a_sel = 0;
					alu_src_b_sel = 0;
					alu_op = `ALU_SRA;
				end
				`INSTR_JR_FUNCT:begin
					pc_sel = `NPC_JUMPR;
					data_mem_wr = 0;
					reg_src = `WD_NO;
				end
				`INSTR_JALR_FUNCT:begin
					pc_sel = `NPC_JUMPR;
					data_mem_wr = 0;
					reg_dst = `GPR_31;
					reg_src = `WD_PC;
				end
			endcase
		`INSTR_LB_OP:begin
		end
		`INSTR_LH_OP:begin
		end
		`INSTR_LBU_OP:begin
		end
		`INSTR_LHU_OP:begin
		end
		`INSTR_LW_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_MEM;
			ext_op = `EXT_SIGNED;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			alu_op = `ALU_ADD;
		end
		`INSTR_SB_OP:begin
		end
		`INSTR_SH_OP:begin
		end
		`INSTR_SW_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 1;
			reg_src = `WD_NO;
			ext_op = `EXT_SIGNED;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			alu_op = `ALU_ADD;
		end
		`INSTR_ADDI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_SIGNED;
			alu_op = `ALU_ADD;
		end
		`INSTR_ADDIU_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_ZERO;
			alu_op = `ALU_ADDU;
		end
		`INSTR_ANDI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_ZERO;
			alu_op = `ALU_AND;
		end
		`INSTR_ORI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_ZERO;
			alu_op = `ALU_OR;
		end
		`INSTR_XORI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_ZERO;
			alu_op = `ALU_XOR;
		end
		`INSTR_LUI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_src = 0;
			ext_op = `EXT_HIGHPOS;
			alu_op = `ALU_ADDU;
		end
		`INSTR_SLTI_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_op = `EXT_SIGNED;
			alu_op = `ALU_SLT;
		end
		`INSTR_SLTIU_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_dst = `GPR_RT;
			reg_src = `WD_ALU;
			alu_src_a_sel = 0;
			alu_src_b_sel = 1;
			ext_op = `EXT_ZERO;
			alu_op = `ALU_SLTU;
		end
		`INSTR_BEQ_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_src = `WD_NO;
			alu_src_a_sel = 0;
			alu_src_b_sel = 0;
			ext_src = 0;
			ext_op = `EXT_SIGNED;
			alu_op = `ALU_SUB;
			if(alu_zero == 1)begin
				pc_sel = `NPC_BRANCH;
			end
		end
		`INSTR_BNE_OP:begin
			pc_sel = `NPC_PLUS4;
			data_mem_wr = 0;
			reg_src = `WD_NO;
			alu_src_a_sel = 0;
			alu_src_b_sel = 0;
			ext_src = 0;
			ext_op = `EXT_SIGNED;
			alu_op = `ALU_SUB;
			if(alu_zero == 0)begin
				pc_sel = `NPC_PLUS4;
			end
		end
		`INSTR_BGEZ_OP:begin
		end
		`INSTR_BGTZ_OP:begin
		end
		`INSTR_BLEZ_OP:begin
		end
		`INSTR_BLTZ_OP:begin
		end
		`INSTR_J_OP:begin
			pc_sel = `NPC_JUMP;
			data_mem_wr = 0;
			reg_src = `WD_NO;
		end
		`INSTR_JAL_OP:begin
			pc_sel = `NPC_JUMP;
			data_mem_wr = 0;
			reg_src = `WD_PC;
		end
	endcase
end

endmodule