library verilog;
use verilog.vl_types.all;
entity Mux is
    port(
        sinalA          : in     vl_logic_vector(7 downto 0);
        sinalB          : in     vl_logic_vector(7 downto 0);
        controle        : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end Mux;
