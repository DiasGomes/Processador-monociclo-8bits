module extensor6para8(sinal, out);

input[5:0] sinal;		// label
output reg[7:0] out;	//	label com 8 bits

always @(sinal)
	begin
		out[5:0] <= sinal;
		out[7:6] <= 2'b00;
	end

endmodule
