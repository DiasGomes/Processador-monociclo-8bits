module pc(clock, reset,adress_in,adress_out);

// inputs
input clock;				//	clock
input reset;				// reset
input [7:0] adress_in;	//	numero da instrucao

// outputs
output reg[7:0] adress_out;

// inicializa
initial
	begin
	
		adress_out = 8'b00000000;
	
	end


// reseta instrucoes	
always @(negedge clock)
	begin
	
		adress_out = reset? 8'b00000000:adress_in;
		
	end

endmodule

