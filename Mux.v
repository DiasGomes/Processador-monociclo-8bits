module Mux(sinalA, sinalB, controle, out);

	input[7:0] sinalA, sinalB;		// valores genericos de 8 bits
	input controle;					// sinal de controle generico
	output reg[7:0] out;				// saida

	// escolhe saida com base no sinal de controle
	always @(sinalA, sinalB, controle)
		begin
			if(controle == 1'b0)	out <= sinalA;
			else if(controle == 1'b1)	out <= sinalB;	
		end

endmodule
