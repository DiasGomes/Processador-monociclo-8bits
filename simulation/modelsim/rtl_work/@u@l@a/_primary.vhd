library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        reg1            : in     vl_logic_vector(7 downto 0);
        reg2            : in     vl_logic_vector(7 downto 0);
        op              : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        ULAOut          : out    vl_logic_vector(7 downto 0)
    );
end ULA;
