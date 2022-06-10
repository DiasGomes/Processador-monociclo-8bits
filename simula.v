module simula();

reg CLK, reset;
wire[7:0] out, regAlvo_Zero, regOpr_imediato, data, memK, memJ, memN, memAux;
wire[7:0]  v0, v1, v2, v3, v4;
wire[3:0] OPcode;
wire[1:0] bit_32, bit_10;

nRisc p(CLK, reset);
  
initial
  begin
		CLK = 0;
		reset = 1;
		#1 reset = 0;
	 end  
 
initial
	begin
		forever	
			begin
				#1 CLK = ~CLK; 
			end
	end
  
initial 
	begin
		$display("===========================================================");
		$display("------------------- INICIO DA SIMULACAO -------------------");
		$display("===========================================================\n");
		forever	
			begin
					#2 $display("PC %0d Instrucao %4b%2b%2b reg1 %0d reg2 %0d data %0d", p.pc_out, p.OPcode, p.bit_32, p.bit_10, p.regAlvo_Zero, p.regOpr_imediato, p.data);
					$display("k [%0d] j [%0d] n [%0d] aux [%0d] v0 [%0d] v1 [%0d] v2 [%0d] v3 [%0d] v4 [%0d]", p.Memoria.dado[0], p.Memoria.dado[1], p.Memoria.dado[2], p.Memoria.dado[3],  p.Memoria.dado[4], p.Memoria.dado[5], p.Memoria.dado[6], p.Memoria.dado[7], p.Memoria.dado[8]);
					$display("--------------------------------------------------------------");
			end
	end
endmodule

