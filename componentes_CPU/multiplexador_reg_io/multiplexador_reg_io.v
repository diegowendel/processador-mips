module multiplexador_reg_io(externo, interno, ctrl, out);
	// Entradas
	input [31:0] interno; // Dado vindo da ULA ou memoria
	input [31:0] externo; // Dado vindo de I/O
	input ctrl;
	
	// Saida
	output [31:0] out;
	
	assign out = ctrl ? externo : interno;
endmodule
