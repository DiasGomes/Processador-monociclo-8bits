library verilog;
use verilog.vl_types.all;
entity extensor6para8 is
    port(
        sinal           : in     vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end extensor6para8;
