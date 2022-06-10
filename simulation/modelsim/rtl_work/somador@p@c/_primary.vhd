library verilog;
use verilog.vl_types.all;
entity somadorPC is
    port(
        adress_in       : in     vl_logic_vector(7 downto 0);
        adress_out      : out    vl_logic_vector(7 downto 0)
    );
end somadorPC;
