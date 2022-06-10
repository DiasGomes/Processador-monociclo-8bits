module nRisc(clock, reset);

	// inputs
	input clock, reset;

	//wires
	wire[7:0] memoriaDados_Out;
	wire[3:0] OPcode;
	wire[5:0] bit_50;
	wire[1:0] bit_32;
	wire[1:0] bit_10;
	wire[7:0] regAlvo_Zero;
	wire[7:0] regOpr_imediato;
	wire[7:0] pc_out;
	wire[7:0] data;
	wire[7:0] pc_plus, regAlvo, regOpr, label, imediato, pc_jump, nextPC, ULAout;
	wire zero, memRead, memWrite;

	//sinais de controle
	wire[2:0] ULAop;
	wire jump, memtoReg, ULAsrc, regWrite, atr, beq;

	// contador de instrucoes
	pc pc_Module(clock, reset, nextPC, pc_out);
	
	// modulo de registradores
	registradores registradores_Module(clock, regWrite, beq, bit_32, bit_10, data,regAlvo, regOpr);
	
	// extensor de sinal de 2 bits para 8 bits - usado para imediato
	extensor2para8 extensor2para8_Module(bit_10, imediato);
	
	// extensor de sinal de 6 bits para 8 bits - usado para salto
	extensor6para8 extensor6para8_Module(bit_50, label);
	
	// multiplexador para selecionar registrador com valor zero
	Muxzero Muxzero_Module(regAlvo, atr, regAlvo_Zero);
	
	// unidade de controle
	Controle controle_Module(OPcode, ULAop, jump, memtoReg, memRead, memWrite, ULAsrc, regWrite, beq, atr);
	
	// multiplexador que seleciona registrador ou imediato
	Mux Mux_REGtoULA(regOpr, imediato, ULAsrc, regOpr_imediato);
	
	// ULA
	ULA ULA_Module(regAlvo_Zero, regOpr_imediato, ULAop, zero, ULAout);
	
	// multiplexador que seleciona saida da ULA ou da unidade de memoria de dados
	Mux Mux_ULAouMEM(ULAout, memoriaDados_Out, memtoReg, data);
	
	// incrementa PC
	somadorPC somadorPC_Module(pc_out, pc_plus);
	
	// multiplexador para jump
	Mux Mux_PCouJUMP(pc_plus, label, jump, pc_jump);
	
	// multiplexador para BEQ
	Mux Mux_PCouBRANCH(pc_jump, label, zero & beq, nextPC);
	
	// memoria de dados
	memDados Memoria(clock, memWrite, memRead, regAlvo_Zero, regOpr_imediato, memoriaDados_Out);
	
	// memoria de instrucao
	memInst MemoriaInstrucao(clock, pc_out, OPcode, bit_50, bit_32, bit_10);

endmodule
