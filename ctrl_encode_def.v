// NPC control signal
`define NPC_PLUS4   2'b00
`define NPC_BRANCH  2'b01
`define NPC_JUMP    2'b10
`define NPC_JUMPR   2'B11

// EXT control signal
`define EXT_ZERO    2'b00
`define EXT_SIGNED  2'b01
`define EXT_HIGHPOS 2'b10

// ALU control signal
`define ALU_NOP   5'b00000 
`define ALU_ADDU  5'b00001
`define ALU_ADD   5'b00010
`define ALU_SUBU  5'b00011
`define ALU_SUB   5'b00100 
`define ALU_AND   5'b00101
`define ALU_OR    5'b00110
`define ALU_NOR   5'b00111
`define ALU_XOR   5'b01000
`define ALU_SLT   5'b01001
`define ALU_SLTU  5'b01010 
`define ALU_EQL   5'b01011
`define ALU_BNE   5'b01100
`define ALU_GT0   5'b01101
`define ALU_GE0   5'b01110
`define ALU_LT0   5'b01111
`define ALU_LE0   5'b10000
`define ALU_SLL   5'b10001
`define ALU_SRL   5'b10010
`define ALU_SRA   5'b10011

// GPR control signal
`define GPR_RD   2'b00
`define GPR_RT   2'b01
`define GPR_31   2'b10

`define WD_ALU 2'b00
`define WD_MEM 2'b01
`define WD_PC  2'b10
`define WD_NO  2'b11

// Memory control signal
`define BE_SB  2'b00
`define BE_SH  2'b01
`define BE_SW  2'b10

`define ME_LB  3'b000
`define ME_LBU 3'b001
`define ME_LH  3'b010
`define ME_LHU 3'b011
`define ME_LW  3'b100