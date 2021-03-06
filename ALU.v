`include "ctrl_encode_def.v"

module ALU(alu_src_a, alu_src_b, alu_op, alu_result, alu_zero);

input	[31:0]		alu_src_a; //运算数据a
input	[31:0]		alu_src_b; //运算数据b
input	[4:0]		alu_op; //运算器控制信号

output	reg[31:0]	alu_result; //运算器输出结果
output	reg			alu_zero; //结果是否为零

reg[31:0]	temp;

initial begin
	alu_result = 0;
	alu_zero = 0;
	temp = 0;
end

always@(alu_src_a or alu_src_b or alu_op)begin
	case(alu_op)
		`ALU_NOP:begin
		end
		`ALU_ADDU:begin
			alu_result = $unsigned(alu_src_a) + $unsigned(alu_src_b);
		end
		`ALU_ADD:begin
			alu_result = $signed(alu_src_a) + $signed(alu_src_b);
		end
		`ALU_SUBU:begin
			alu_result = $unsigned(alu_src_a) - $unsigned(alu_src_b);
		end
		`ALU_SUB:begin
			alu_result = $signed(alu_src_a) - $signed(alu_src_b);
		end
		`ALU_AND:begin
			alu_result = alu_src_a & alu_src_b;
		end
		`ALU_OR:begin
			alu_result = alu_src_a | alu_src_b;
		end
		`ALU_NOR:begin
			alu_result = ~ (alu_src_a | alu_src_b);
		end
		`ALU_XOR:begin
			alu_result = ((~ alu_src_a) & alu_src_b) | (alu_src_a * (~ alu_src_b));
		end
		`ALU_SLT:begin
			alu_result = 0;
			if($signed(alu_src_a) < $signed(alu_src_b))begin
				alu_result = 1;
			end
		end
		`ALU_SLTU:begin
			alu_result = 0;
			if($unsigned(alu_src_a) < $unsigned(alu_src_b))begin
				alu_result = 1;
			end
		end
		`ALU_EQL:begin
		end
		`ALU_BNE:begin
		end
		`ALU_GT0:begin
		end
		`ALU_GE0:begin
		end
		`ALU_LT0:begin
		end
		`ALU_LE0:begin
		end
		`ALU_SLL:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result << 1;
		  end
		end
		`ALU_SRL:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result >> 1;
		  end
		end
		`ALU_SRA:begin
		  alu_result = alu_src_b;
		  for(temp = 0; temp < alu_src_a; temp = temp + 1)begin
		    alu_result = alu_result >> 1;
		    alu_result[31] = alu_result[30];
		  end
		end
	endcase
	if(alu_result == 0)begin
		alu_zero = 1;
	end
	else begin
		alu_zero = 0;
	end
end

endmodule