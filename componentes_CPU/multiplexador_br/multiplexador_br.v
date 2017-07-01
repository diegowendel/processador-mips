module multiplexador_br(RT, RD, ctrl_mux_br, regEscrito);
	// ----------Portas de Entrada---------- //
	input [4:0] RT; // Registrador escrito em instrucoes tipo I
	input [4:0] RD; // Registrador escrito em instrucoes tipo R
	
	// ----------Portas de Saida---------- //
	output reg [4:0] regEscrito; // Registrador que sera escrito
	
	// ----------Controle---------- //
	input ctrl_mux_br; // Sinal de controle vindo da UC
	
	always @ (*) begin	
		case(ctrl_mux_br)
			1'b0: regEscrito = RT; // Instrucao tipo I
			1'b1: regEscrito = RD; // Instrucao tipo R
		endcase
	end
endmodule