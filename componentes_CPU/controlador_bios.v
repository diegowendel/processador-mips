module controlador_bios(clock, mem, bios, transfOK, instrucao, reset);
	// Entradas
	input clock;
	input [31:0] mem;													// Instrucao vinda da Memoria
	input [31:0] bios;												// Instrucao vinda da Bios
	input transfOK;
	
	// Saida
	output [31:0] instrucao;										// Instrucao efetiva
	output reg reset;
	
	reg estado = 1'b0;												// Estado atual - Inicia no estado da BIOS
	localparam HALT = 6'b011000;									// Opcode da instrucao HALT
	localparam BIOS = 1'b0, MEMORIA_INSTRUCOES = 1'b1;		// Estados
	
	wire [5:0] opcode;
	assign opcode = instrucao[31:26];
	
	always @ (posedge clock) begin
		if (estado == BIOS && opcode == HALT) begin
			estado <= MEMORIA_INSTRUCOES;
			reset <= 1'b1;
		end else begin
			reset <= 1'b0;
		end
	end
	assign instrucao = estado == BIOS ? bios : transfOK ? mem : 32'b010000_00000_00000_0000000000000000; // LI 0 -> RZ
endmodule