library verilog;
use verilog.vl_types.all;
entity CU is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        alu_zero        : in     vl_logic;
        pc_sel          : out    vl_logic_vector(1 downto 0);
        data_mem_wr     : out    vl_logic;
        reg_dst         : out    vl_logic_vector(1 downto 0);
        reg_src         : out    vl_logic_vector(1 downto 0);
        alu_src_a_sel   : out    vl_logic;
        alu_src_b_sel   : out    vl_logic;
        ext_src         : out    vl_logic;
        ext_op          : out    vl_logic_vector(1 downto 0);
        alu_op          : out    vl_logic_vector(4 downto 0)
    );
end CU;
