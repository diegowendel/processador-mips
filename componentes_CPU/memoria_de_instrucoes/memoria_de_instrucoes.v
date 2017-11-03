module memoria_de_instrucoes(pc, instrucao);
	// Entrada
	input [25:0] pc;				// PC Atual
	
	// Saida
	output [31:0] instrucao;	// Proxima instrucao a ser executada
	
	parameter MEM_SIZE = 150; // Tamanho da memoria
	wire [31:0] rom [MEM_SIZE-1:0];// Memoria de instrucoes

	assign rom[0] = 32'b010110_00000000000000000000000001;		// Jump to Main
	assign rom[1] = 32'b000001_11110_11110_0000000000000001; 	// addi
	assign rom[2] = 32'b010011_00000_10100_0000000000000000; 	// in
	assign rom[3] = 32'b010010_11110_10100_0000000000000000; 	// sw
	assign rom[4] = 32'b001111_11110_01010_0000000000000000; 	// lw
	assign rom[5] = 32'b001110_01010_00110_0000000000000000; 	// mov
	assign rom[6] = 32'b010000_00000_00111_0000000000000000; 	// li
	assign rom[7] = 32'b010100_00000_00110_0000000000000000; 	// out
	assign rom[8] = 32'b010011_00000_10101_0000000000000000; 	// in
	assign rom[9] = 32'b010010_11110_10101_0000000000000000; 	// sw
	assign rom[10] = 32'b001111_11110_01011_0000000000000000; 	// lw
	assign rom[11] = 32'b001110_01011_00110_0000000000000000; 	// mov
	assign rom[12] = 32'b010000_00000_00111_0000000000000001; 	// li
	assign rom[13] = 32'b010100_00000_00110_0000000000000001; 	// out
	assign rom[14] = 32'b010011_00000_10110_0000000000000000; 	// in
	assign rom[15] = 32'b010010_11110_10110_0000000000000000; 	// sw
	assign rom[16] = 32'b001111_11110_01100_0000000000000000; 	// lw
	assign rom[17] = 32'b001110_01100_00110_0000000000000000; 	// mov
	assign rom[18] = 32'b010000_00000_00111_0000000000000010; 	// li
	assign rom[19] = 32'b010100_00000_00110_0000000000000010; 	// out
	assign rom[20] = 32'b011000_00000000000000000000000000; 	// halt

	assign instrucao = rom[pc];
endmodule
