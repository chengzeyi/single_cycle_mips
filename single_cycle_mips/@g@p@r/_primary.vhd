library verilog;
use verilog.vl_types.all;
entity GPR is
    port(
        clk             : in     vl_logic;
        reg_w           : in     vl_logic;
        reg_w_sel       : in     vl_logic_vector(4 downto 0);
        reg_w_data      : in     vl_logic_vector(31 downto 0);
        reg_rs_sel      : in     vl_logic_vector(4 downto 0);
        reg_rt_sel      : in     vl_logic_vector(4 downto 0);
        reg_rs          : out    vl_logic_vector(31 downto 0);
        reg_rt          : out    vl_logic_vector(31 downto 0)
    );
end GPR;
