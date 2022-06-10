module extensor2para8(sinal, out);

	input[1:0] sinal;		// imediato
	output reg[7:0] out;	// imediato com 8 bits

	always @(sinal)
		begin
			out[1:0] <= sinal;
			out[7:2] <= 2'b000000;
		end

endmodule
