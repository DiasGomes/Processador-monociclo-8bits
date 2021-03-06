module Controle(InstCode, ULAop, jump, memtoReg, memRead, memWrite, ULAsrc, regWrite, beq, atr);

	input[3:0] InstCode;		// OPcode

	output reg [2:0] ULAop;	// sinal de controle para a ULA
	output reg jump;			// sinal do jump
	output reg memtoReg;		// sinal que seleciona saida da ula ou da memoria de dados
	output reg memRead;		//	sinal que habilita leitura na memoria de dados
	output reg	memWrite;	//	sinal que habilita escrita na memoria de dados
	output reg	ULAsrc;		// sinal que habilita uso do imediato
	output reg regWrite;		// habilita escrita no banco de registradores
	output reg	beq;			// sinal do beq
	output reg	atr;			// sinal para usar o registrador zero -> para a instrucao atr

	// definindo sinais de controle para cada instrucao
	always @(InstCode)
		begin 
			//jump
			if(InstCode[3:2] == 2'b00) 
				begin 
					jump <= 1; 	
					memtoReg <= 1'bX;	
					memRead <= 0; 	
					memWrite <= 0; 
					ULAsrc <= 0; 	
					regWrite <= 0; 
					beq <= 0; 
					atr <= 0;
				end
			//beq
			else if(InstCode[3:2] == 2'b01) 
				begin 
					ULAop <= 3'b100; 			
					jump <= 0; 			
					memtoReg <= 0; 			
					memRead <= 0; 			
					memWrite <= 0; 			
					ULAsrc <= 0; 			
					regWrite <= 0; 			
					beq <= 1; 			
					atr <= 0; 	
				end
			//ADD
			else if(InstCode == 4'b1000) 
			begin
				ULAop <= 3'b000; 			
				jump <= 0; 			
				memtoReg <= 0; 			
				memRead <= 0; 			
				memWrite <= 0; 			
				ULAsrc <= 0; 			
				regWrite <= 1; 			
				beq <= 0; 			
				atr <= 0; 
			end
			//LW
			else if(InstCode == 4'b1001) 
				begin 
					jump <= 0;			
					memtoReg <= 1;				
					memRead <= 1;			
					memWrite <= 0;	
					ULAsrc <= 0;			
					regWrite <= 1;				
					beq <= 0;			
					atr <= 0;
				end
			//SW
			else if(InstCode == 4'b1010) 
			begin 
				jump <= 0;			
				memtoReg <= 'bX;				
				memRead <= 0;			
				memWrite <= 1;				
				ULAsrc <= 0;			
				regWrite <= 0;				
				beq <= 0;			
				atr <= 0;
			end
			//SLT
			else if(InstCode == 4'b1011) 
			begin
				ULAop <= 3'b010; 			
				jump <= 0; 			
				memtoReg <= 0; 			
				memRead <= 0; 			
				memWrite <= 0; 			
				ULAsrc <= 0; 			
				regWrite <= 1; 			
				beq <= 0; 			
				atr <= 0; 			
			end
			//ADDI
			else if(InstCode == 4'b1101) begin 
				ULAop <= 3'b000; 		
				jump <= 0; 			
				memtoReg <= 0; 			
				memRead <= 0; 			
				memWrite <= 0; 			
				ULAsrc <= 1; 			
				regWrite <= 1; 			
				beq <= 0; 			
				atr <= 0; 			
			end
			//ATR
			else if(InstCode == 4'b1110) 
			begin
				ULAop <= 3'b001; 			
				jump <= 0; 			
				memtoReg <= 0; 			
				memRead <= 0; 			
				memWrite <= 0; 			
				ULAsrc <= 1; 			
				regWrite <= 1; 			
				beq <= 0; 			
				atr <= 1; 			
			end
			//SLL
			else if(InstCode == 4'b1111) 
			begin
				ULAop <= 3'b011; 		
				jump <= 0; 			
				memtoReg <= 0; 			
				memRead <= 0; 			
				memWrite <= 0; 			
				ULAsrc <= 1; 			
				regWrite <= 1; 			
				beq <= 0; 			
				atr <= 0; 
			end
			//Halt
			else if(InstCode == 4'b1100) 
			begin 
				$stop();
			end
		end
		
endmodule
