library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        adress_in       : in     vl_logic_vector(7 downto 0);
        adress_out      : out    vl_logic_vector(7 downto 0)
    );
end pc;
