module memDados(clock, write, read, dadoEntrada, index, dadoSaida);
	
	input clock;
	input write;
	input read;
	input[7:0] dadoEntrada;
	input [7:0] index;
	
	output[7:0] dadoSaida;
	reg [7:0] dado [15:0];
	
	//carrega dados iniciais na memoria de dados
	initial
	  begin	  
		 
			dado[0] = 8'b00000001;	//k = 1
			//j (dado[1]) é xxxx xxxx
			dado[2] = 8'b00000101;	//n = 5 tamanho do vetor (MAX = dado size - 4), no caso MAX = 12
			// aux (dado[3]) é xxxx xxxx
			// Inicio do vetor
			dado[4] = 8'b00001001;	//v[0] = 9
			dado[5] = 8'b00001000;	//v[1] = 8
			dado[6] = 8'b00000111;	//v[2] = 7
			dado[7] = 8'b00000110;	//v[3] = 6
			dado[8] = 8'b00000101;	//v[4] = 5
			
	 end

//escrita de dados
always @(posedge clock)
	begin 
		if(write) dado[index] = dadoEntrada;
	end
	
//leitura de dados		
assign dadoSaida = (read == 1'b1) ? dado[index]: 8'b0;

endmodule

