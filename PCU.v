`include "ctrl_encode_def.v"

module PCU(reset, pc_sel, clk, address_j, address_jr, address_b, pc);

input				reset;
input	[1:0]		pc_sel; //PC选择信号
input				clk; //时钟信号
input	[31:0]		address_j;
input	[31:0]		address_jr;
input	[31:0]		address_b;

output	reg[31:0]	pc; //程序计数器

reg[31:0]	temp;
integer		i;

initial
	pc = 0;

always@(posedge reset)
	pc = 0;

always@(posedge clk)
	if(pc_sel == `NPC_PLUS4)begin
		pc = pc + 4;
	end
	else if(pc_sel == `NPC_BRANCH)begin
	  pc = pc + 4;
		for(i = 0; i < 30; i = i + 1)begin
			temp[31 - i] = address_b[29 - i];
			temp[0] = 0;
			temp[1] = 0;
		end //for
		pc = pc + temp;
	end //if
	else if(pc_sel == `NPC_JUMP)begin
	  pc = pc + 4;
		for(i = 0; i < 26; i = i + 1)begin
			pc[i + 2] = address_j[i];
		end
		pc[0] = 0;
		pc[1] = 0;
	end //if
	else if(pc_sel == `NPC_JUMPR)begin
		pc = address_jr;
	end

endmodule