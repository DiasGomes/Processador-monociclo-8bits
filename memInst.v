module memInst(clock, endereco, OPcode, label, regAlvo, regOuImed);


/*
CODIGO EM C
	ordena(int v[], int n){
		for (k = 1; k < n; k++) {
			for (j = 0; j+1 < n; j++) {
				if (vetor[j] > vetor[j + 1]) {
					aux = vetor[j];
					vetor[j] = vetor[j + 1];
					vetor[j + 1] = aux;
				}
			}
		}
	}
*/

input clock;					// clock
input [7:0] endereco;		// numero da intrucao a ser acessada 
output reg[3:0] OPcode;		// OPcode da instrucao
output reg[5:0] label;		// label se tiver
output reg[1:0] regAlvo, regOuImed;	// numero de registrador ou valor do imediato

reg [7:0] inst [0:63];		// memoria com as instrucoes

//carrega o codigo na memoria de instrucao
initial 
	begin
	
	//loopOne:		
	inst[0] = 8'b11100000;	//atr	// $a0 = endereço de k (0)
	inst[1] = 8'b10011000;	//lw	// $a2 = k
	inst[2] = 8'b11100110;	//atr	// Cálculo para endereço de n (2)
	inst[3] = 8'b10011101;	//lw	// $a3 = n
	inst[4] = 8'b01101000;	//BEQ	// k < n
	inst[5] = 8'b11011001;	//addi 	// k++
	inst[6] = 8'b10101000;	//sw	// guarda na memória o valor de k
	inst[7] = 8'b11100001;	//atr	// Cálculo para endereço de J (1)
	inst[8] = 8'b11101000;	//atr	// a2 = 0 
	inst[9] = 8'b10101000;	//sw	// guarda na memória o valor de j = 0
//loopTwo:		
	inst[10] = 8'b11100001;	//atr	// Cálculo para endereço de J (1)
	inst[11] = 8'b11100110;	//atr	// Cálculo para endereço de n (2)
	inst[12] = 8'b10011000;	//lw	// $a2 = j
	inst[13] = 8'b10011101;	//lw	// $a3 = n
	inst[14] = 8'b11011001;	//addi	// $a2 = j+1
	inst[15] = 8'b01000000;	//BEQ	// j < n-1 no caso a comparação é j+1 < n -> já que não há subtração
// if
	inst[16] = 8'b10011000;	//lw	// $a2 = j (recarrega valor j)
	inst[17] = 8'b11100010;	//atr	// Cálculo de endereço de vetor[0]
	inst[18] = 8'b11110001;	//sll	// $a0 = endereço de vetor[0] (4)
	inst[19] = 8'b10000010;	//add	// $a0 = endereço de vetor[j]
	inst[20] = 8'b11100100;	//atr	// zera valor $a1
	inst[21] = 8'b10000100;	//add	// $a1 = endereço de vetor[j]
	inst[22] = 8'b11010101;	//addi	// Cálculo de endereço de vetor[j+1]
	inst[23] = 8'b10011000;	//lw	// $a2 = valor de vetor[j]
	inst[24] = 8'b10011101;	//lw	// $a3 = valor de vetor[j+1]
	inst[25] = 8'b10111110;	//slt	// if (vetor[j] > vetor[j + 1]) ou if (vetor[j + 1] < vetor[j])
	inst[26] = 8'b11101000;	//atr	// zera valor do registrador para comparação
	inst[27] = 8'b01100011;	//BEQ	// verifica se é menor
	inst[28] = 8'b11101111;	//atr	// Cálculo de endereço de aux (3)
	inst[29] = 8'b10011000;	//lw	// $a2 = valor de vetor[j]
	inst[30] = 8'b10101011;	//sw	// aux = vetor[j];
	inst[31] = 8'b10011001;	//lw	// $a2 = valor de vetor[j+1]
	inst[32] = 8'b10101000;	//sw	// vetor[j] = vetor[j + 1]; 
	inst[33] = 8'b10011011;	//lw	// $a2 = valor de aux
	inst[34] = 8'b10101001;	//sw	// vetor[j + 1] = aux; 
//next:	
	inst[35] = 8'b11100001; //atr	// Cálculo para endereço de J (1)
	inst[36] = 8'b10011000;	//lw	// $a2 = j
	inst[37] = 8'b11011001;	//addi	// j++
	inst[38] = 8'b10101000;	//sw	// guarda na memória o valor de j
	inst[39] = 8'b00001010;	//j	// Retorno do loop
//exit:		
	inst[40] = 8'b11000000;	//h	// encerra o programa

	end
	
	
// acessos a memoria
always @(endereco)
	begin
		OPcode <= inst[endereco][7:4];
		label <= inst[endereco][5:0];
		regAlvo <= inst[endereco][3:2];
		regOuImed <= inst[endereco][1:0];
	end

endmodule


