module ULA(reg1, reg2, op, zero, ULAOut);

// inputs
input [7:0] reg1, reg2;	// valor vindo dos registradores/imediato
input [2:0] op;			// sinal que indica qual instrucao 

// outputs
output zero;				// saida para indicar se o salto do beq deve ser tomado
output reg[7:0] ULAOut;	// resultado da operacao

always @(reg1, reg2, op) 
	begin 
		// qual instrucao deve ser executada
		case (op)
			0: ULAOut <= reg1 + reg2;				//ADD
			1: ULAOut <= reg1 | reg2;				//ORI
			2: ULAOut <= reg1 < reg2 ? 1 : 0;	//SLT
			3: ULAOut <= reg1 << reg2;				//SLL
			4: ULAOut <= reg1 == reg2 ? 1 : 0;		//BEQ
			default: ULAOut <= 0;
		endcase
	end

// sinal de controle para salto branch	
assign zero = (ULAOut == 1);

endmodule
