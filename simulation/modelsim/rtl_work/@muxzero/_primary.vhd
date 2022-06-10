library verilog;
use verilog.vl_types.all;
entity Muxzero is
    port(
        sinal           : in     vl_logic_vector(7 downto 0);
        sinalAtr        : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end Muxzero;
