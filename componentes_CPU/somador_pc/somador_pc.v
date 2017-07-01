module somador_pc(pc, desvio, salto, addOp, pcAtual);
	// ----------Portas de Entrada---------- //
	input [25:0] pc; // Endereco do contador de programa atual
	input [25:0] desvio; // Endereco de desvios condicionais (branches)
	input [25:0] salto; // Endereco de desvios incondicionais (jumps)
	
	// ----------Portas de Saida---------- //
	output reg [25:0] pcAtual; // Endereco do contador de programa do proximo ciclo
	
	// ----------Controle---------- //
	input [1:0] addOp; // Decide como alterar o pc
	
	always @ (*) begin
		case(addOp)
			2'b00: pcAtual = pc; // Pausa o PC
			2'b01: pcAtual = pc + 1; // Incremento normal
			2'b10: pcAtual = desvio; // Desvio (Branch)
			2'b11: pcAtual = salto; // Salto (Jump)
		endcase
	end
endmodule
