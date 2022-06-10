module Muxzero(sinal, sinalAtr, out);

// inputs
input[7:0] sinal;		// valor de um registrador
input sinalAtr;		// sinal de controle emitido pela instrucao atr

// outputs
output reg[7:0] out;

// se for instrucao atr retorna valor do registrador zero
always @(sinal, sinalAtr)
	begin
		if(sinalAtr == 1'b0)	out <= sinal;
		else if(sinalAtr == 1'b1)	out <= 8'b00000000;	
	end

endmodule
