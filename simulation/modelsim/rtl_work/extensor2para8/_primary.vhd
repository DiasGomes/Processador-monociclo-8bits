library verilog;
use verilog.vl_types.all;
entity extensor2para8 is
    port(
        sinal           : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end extensor2para8;
