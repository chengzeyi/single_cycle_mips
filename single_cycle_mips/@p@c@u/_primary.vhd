library verilog;
use verilog.vl_types.all;
entity PCU is
    port(
        reset           : in     vl_logic;
        pc_sel          : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        address_j       : in     vl_logic_vector(31 downto 0);
        address_jr      : in     vl_logic_vector(31 downto 0);
        address_b       : in     vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0)
    );
end PCU;
