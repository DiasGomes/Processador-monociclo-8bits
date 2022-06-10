module registradores(clock, regWrite, beq, regAlvo, regOpr, data,regAlvoValor, regOprValor);

// inputs
input clock;							// clock
input regWrite;						// sinal de escrita no registrador
input beq;								// sinal de controle para BEQ -> sempre entre r2 e r3
input [1:0] regAlvo, regOpr;		// qual registrador da instrucao
input [7:0] data;						// valor a ser escrito no registrador

// outputs
output [7:0] regAlvoValor, regOprValor;	//valores dos registradores requisitados

// registradores
reg [7:0] regis [3:0];

//escrita no registrador alvo
always @(posedge clock)
	begin
		if(regWrite == 1'b1) //sinal de controle para escrita no registrador alvo
			begin
				regis[regAlvo] = data;
			end 
	end
//leitura do valor do registrador 
assign regAlvoValor = (beq == 0)? regis[regAlvo] : regis[2];  	// BEQ -> regAlvo == r2 
assign regOprValor = (beq == 0)? regis[regOpr] : regis[3];  	// BEQ -> regOpr == r3 
 

endmodule
