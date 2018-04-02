library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        data_address    : in     vl_logic_vector(4 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        data_wr         : in     vl_logic;
        clk             : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end DM;
