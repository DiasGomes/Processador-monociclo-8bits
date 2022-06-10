library verilog;
use verilog.vl_types.all;
entity registradores is
    port(
        clock           : in     vl_logic;
        regWrite        : in     vl_logic;
        beq             : in     vl_logic;
        regAlvo         : in     vl_logic_vector(1 downto 0);
        regOpr          : in     vl_logic_vector(1 downto 0);
        data            : in     vl_logic_vector(7 downto 0);
        regAlvoValor    : out    vl_logic_vector(7 downto 0);
        regOprValor     : out    vl_logic_vector(7 downto 0)
    );
end registradores;
