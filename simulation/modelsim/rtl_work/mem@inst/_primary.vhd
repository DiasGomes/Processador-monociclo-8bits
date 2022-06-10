library verilog;
use verilog.vl_types.all;
entity memInst is
    port(
        clock           : in     vl_logic;
        endereco        : in     vl_logic_vector(7 downto 0);
        OPcode          : out    vl_logic_vector(3 downto 0);
        \label\         : out    vl_logic_vector(5 downto 0);
        regAlvo         : out    vl_logic_vector(1 downto 0);
        regOuImed       : out    vl_logic_vector(1 downto 0)
    );
end memInst;
