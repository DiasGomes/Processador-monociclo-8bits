module somadorPC(adress_in, adress_out);

// inputs
input[7:0] adress_in;	// numero da instrucao

// outputs
output reg[7:0] adress_out;	// proxima instrucao

// incrementa PC
always @(adress_in)
	begin
		adress_out <= adress_in + 1;
	end

endmodule
