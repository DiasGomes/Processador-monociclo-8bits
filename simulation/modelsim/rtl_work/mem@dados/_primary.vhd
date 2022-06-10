library verilog;
use verilog.vl_types.all;
entity memDados is
    port(
        clock           : in     vl_logic;
        write           : in     vl_logic;
        read            : in     vl_logic;
        dadoEntrada     : in     vl_logic_vector(7 downto 0);
        index           : in     vl_logic_vector(7 downto 0);
        dadoSaida       : out    vl_logic_vector(7 downto 0)
    );
end memDados;
