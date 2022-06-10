library verilog;
use verilog.vl_types.all;
entity Controle is
    port(
        InstCode        : in     vl_logic_vector(3 downto 0);
        ULAop           : out    vl_logic_vector(2 downto 0);
        jump            : out    vl_logic;
        memtoReg        : out    vl_logic;
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        ULAsrc          : out    vl_logic;
        regWrite        : out    vl_logic;
        beq             : out    vl_logic;
        atr             : out    vl_logic
    );
end Controle;
