module disco_rigido (clk, we, addr, datain, dataout);
	input clk;										// clock
	input we;										// write enable
	input [31:0] addr;							// disk address
	input [31:0] datain;							// data in (to disk)
	
	output reg [31:0] dataout;					// data out (from disk)
	
	localparam DISK_SIZE = 1024;				// Tamanho do disco
	reg [31:0] disk [DISK_SIZE-1:0];			// disk cells
	
	always @ (posedge clk) begin
		if (we) disk[addr] <= datain;			// write disk
	end
	
	always @ (negedge clk) begin
		dataout <= disk[addr];
	end

	initial begin
		// SISTEMA OPERACIONAL

disk[0] <= 32'b111100_00000000000000000100111100;		// Jump to Main
disk[1] <= 32'b000001_11110_11110_0000000000000010; 	// addi
disk[2] <= 32'b010000_00000_10100_0000000000100000; 	// li
disk[3] <= 32'b010010_00101_10100_0000000000100000; 	// sw
disk[4] <= 32'b010000_00000_10101_0000000001100100; 	// li
disk[5] <= 32'b010010_00101_10101_0000000000100001; 	// sw
disk[6] <= 32'b010000_00000_10110_0000000000001010; 	// li
disk[7] <= 32'b010010_00101_10110_0000000000100010; 	// sw
disk[8] <= 32'b010000_00000_10111_0000001111111111; 	// li
disk[9] <= 32'b010010_00101_10111_0000000000100100; 	// sw
disk[10] <= 32'b010000_00000_11000_0000000000011111; 	// li
disk[11] <= 32'b010010_00101_11000_0000000001001101; 	// sw
disk[12] <= 32'b010000_00000_11001_0000000000111101; 	// li
disk[13] <= 32'b010010_00101_11001_0000000001001110; 	// sw
disk[14] <= 32'b010000_00000_11010_0000000000111111; 	// li
disk[15] <= 32'b010010_00101_11010_0000000001001111; 	// sw
disk[16] <= 32'b010000_00000_11011_0000000000000000; 	// li
disk[17] <= 32'b010010_00101_11011_0000000001010000; 	// sw
disk[18] <= 32'b010000_00000_11100_0000000000000001; 	// li
disk[19] <= 32'b010010_00101_11100_0000000001010001; 	// sw
disk[20] <= 32'b010000_00000_11101_0000000000000010; 	// li
disk[21] <= 32'b010010_00101_11101_0000000001010010; 	// sw
disk[22] <= 32'b010000_00000_10100_0000000000000011; 	// li
disk[23] <= 32'b010010_00101_10100_0000000001010011; 	// sw
disk[24] <= 32'b010000_00000_10101_0000000000000100; 	// li
disk[25] <= 32'b010010_00101_10101_0000000001010100; 	// sw
disk[26] <= 32'b010000_00000_10110_0000000000001001; 	// li
disk[27] <= 32'b010010_00101_10110_0000000001010101; 	// sw
disk[28] <= 32'b001111_00101_01010_0000000001010000; 	// lw
disk[29] <= 32'b010010_00101_01010_0000000001010110; 	// sw
disk[30] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[31] <= 32'b000001_11110_11110_0000000000000101; 	// addi
disk[32] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[33] <= 32'b010010_11110_10100_1111111111111111; 	// sw
disk[34] <= 32'b001111_11110_01010_1111111111111111; 	// lw
disk[35] <= 32'b001111_00101_01011_0000000000100010; 	// lw
disk[36] <= 32'b000000_01010_01011_10101_00000_001110; 	// lt
disk[37] <= 32'b010101_10101_00000_0000000000111010; 	// jf
disk[38] <= 32'b010001_00101_01100_0000000000100101; 	// la
disk[39] <= 32'b000000_01100_01010_10110_00000_000000; 	// add
disk[40] <= 32'b010000_00000_10111_0000000000000000; 	// li
disk[41] <= 32'b010010_10110_10111_0000000000000000; 	// sw
disk[42] <= 32'b010001_00101_01101_0000000000101111; 	// la
disk[43] <= 32'b000000_01101_01010_11000_00000_000000; 	// add
disk[44] <= 32'b010000_00000_11001_0000000000000000; 	// li
disk[45] <= 32'b010010_11000_11001_0000000000000000; 	// sw
disk[46] <= 32'b010001_00101_01110_0000000000111001; 	// la
disk[47] <= 32'b000000_01110_01010_11010_00000_000000; 	// add
disk[48] <= 32'b010000_00000_11011_0000000000000000; 	// li
disk[49] <= 32'b010010_11010_11011_0000000000000000; 	// sw
disk[50] <= 32'b010001_00101_01111_0000000001000011; 	// la
disk[51] <= 32'b000000_01111_01010_11100_00000_000000; 	// add
disk[52] <= 32'b010000_00000_11101_0000000000000000; 	// li
disk[53] <= 32'b010010_11100_11101_0000000000000000; 	// sw
disk[54] <= 32'b000001_01010_10100_0000000000000001; 	// addi
disk[55] <= 32'b010010_11110_10100_1111111111111111; 	// sw
disk[56] <= 32'b001111_11110_01010_1111111111111111; 	// lw
disk[57] <= 32'b111100_00000000000000000000100010; 	// j
disk[58] <= 32'b001111_00101_10000_0000000000100011; 	// lw
disk[59] <= 32'b010010_11110_10000_1111111111111110; 	// sw
disk[60] <= 32'b010000_00000_10101_0000000000000000; 	// li
disk[61] <= 32'b010010_11110_10101_1111111111111111; 	// sw
disk[62] <= 32'b001111_11110_01010_1111111111111111; 	// lw
disk[63] <= 32'b001111_11110_10001_1111111111111110; 	// lw
disk[64] <= 32'b001111_00101_10010_0000000000100100; 	// lw
disk[65] <= 32'b000000_10001_10010_10110_00000_001110; 	// lt
disk[66] <= 32'b010101_10110_00000_0000000001011000; 	// jf
disk[67] <= 32'b001110_10001_00110_0000000000000000; 	// mov
disk[68] <= 32'b010110_00110_10111_0000000000000000; 	// ldk
disk[69] <= 32'b010010_11110_10111_0000000000000000; 	// sw
disk[70] <= 32'b001111_11110_10011_0000000000000000; 	// lw
disk[71] <= 32'b001101_10011_11000_0000000000011010; 	// srli
disk[72] <= 32'b001111_00101_01010_0000000001001110; 	// lw
disk[73] <= 32'b000000_11000_01010_11001_00000_001100; 	// eq
disk[74] <= 32'b010101_11001_00000_0000000001010100; 	// jf
disk[75] <= 32'b001111_11110_01011_1111111111111111; 	// lw
disk[76] <= 32'b000001_01011_11010_0000000000000001; 	// addi
disk[77] <= 32'b000000_01100_01011_11011_00000_000000; 	// add
disk[78] <= 32'b010010_11011_11010_0000000000000000; 	// sw
disk[79] <= 32'b000000_01101_01011_11100_00000_000000; 	// add
disk[80] <= 32'b010010_11100_10001_0000000000000000; 	// sw
disk[81] <= 32'b000001_01011_11101_0000000000000001; 	// addi
disk[82] <= 32'b010010_11110_11101_1111111111111111; 	// sw
disk[83] <= 32'b001111_11110_01011_1111111111111111; 	// lw
disk[84] <= 32'b000001_10001_10100_0000000000000001; 	// addi
disk[85] <= 32'b010010_11110_10100_1111111111111110; 	// sw
disk[86] <= 32'b001111_11110_10001_1111111111111110; 	// lw
disk[87] <= 32'b111100_00000000000000000000111111; 	// j
disk[88] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[89] <= 32'b000001_11110_11110_0000000000000100; 	// addi
disk[90] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[91] <= 32'b010010_11110_10100_0000000000000000; 	// sw
disk[92] <= 32'b001111_11110_01010_0000000000000000; 	// lw
disk[93] <= 32'b001110_01010_00110_0000000000000000; 	// mov
disk[94] <= 32'b010110_00110_10101_0000000000000000; 	// ldk
disk[95] <= 32'b010010_11110_10101_1111111111111111; 	// sw
disk[96] <= 32'b001111_11110_01011_1111111111111111; 	// lw
disk[97] <= 32'b001101_01011_10110_0000000000011010; 	// srli
disk[98] <= 32'b001111_00101_01100_0000000001001111; 	// lw
disk[99] <= 32'b000000_10110_01100_10111_00000_001101; 	// ne
disk[100] <= 32'b010101_10111_00000_0000000001101101; 	// jf
disk[101] <= 32'b000001_01010_11000_0000000000000001; 	// addi
disk[102] <= 32'b010010_11110_11000_0000000000000000; 	// sw
disk[103] <= 32'b001111_11110_01010_0000000000000000; 	// lw
disk[104] <= 32'b001110_01010_00110_0000000000000000; 	// mov
disk[105] <= 32'b010110_00110_11001_0000000000000000; 	// ldk
disk[106] <= 32'b010010_11110_11001_1111111111111111; 	// sw
disk[107] <= 32'b001111_11110_01011_1111111111111111; 	// lw
disk[108] <= 32'b111100_00000000000000000001100000; 	// j
disk[109] <= 32'b001110_01010_00001_0000000000000000; 	// mov
disk[110] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[111] <= 32'b000001_11110_11110_0000000000000101; 	// addi
disk[112] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[113] <= 32'b010010_11110_10100_1111111111111110; 	// sw
disk[114] <= 32'b001111_11110_01010_1111111111111110; 	// lw
disk[115] <= 32'b010000_00000_10110_0000000000100000; 	// li
disk[116] <= 32'b000000_01010_10110_10101_00000_001110; 	// lt
disk[117] <= 32'b010101_10101_00000_0000000001111110; 	// jf
disk[118] <= 32'b010001_00101_01011_0000000000000000; 	// la
disk[119] <= 32'b000000_01011_01010_10111_00000_000000; 	// add
disk[120] <= 32'b010000_00000_11000_0000000000000000; 	// li
disk[121] <= 32'b010010_10111_11000_0000000000000000; 	// sw
disk[122] <= 32'b000001_01010_11001_0000000000000001; 	// addi
disk[123] <= 32'b010010_11110_11001_1111111111111110; 	// sw
disk[124] <= 32'b001111_11110_01010_1111111111111110; 	// lw
disk[125] <= 32'b111100_00000000000000000001110010; 	// j
disk[126] <= 32'b010010_11110_11111_1111111111111101; 	// sw
disk[127] <= 32'b111110_00000000000000000001011001; 	// jal
disk[128] <= 32'b000010_11110_11110_0000000000000100; 	// subi
disk[129] <= 32'b001111_11110_11111_1111111111111101; 	// lw
disk[130] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[131] <= 32'b010010_11110_01010_0000000000000000; 	// sw
disk[132] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[133] <= 32'b000001_01011_11010_0000000000000001; 	// addi
disk[134] <= 32'b010010_00101_11010_0000000000100011; 	// sw
disk[135] <= 32'b001111_00101_01100_0000000000100000; 	// lw
disk[136] <= 32'b000000_01011_01100_11011_00000_000011; 	// div
disk[137] <= 32'b010010_11110_11011_1111111111111111; 	// sw
disk[138] <= 32'b000000_01011_01100_11100_00000_000100; 	// mod
disk[139] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[140] <= 32'b000000_11100_10100_11101_00000_010000; 	// gt
disk[141] <= 32'b010101_11101_00000_0000000010010010; 	// jf
disk[142] <= 32'b001111_11110_01101_1111111111111111; 	// lw
disk[143] <= 32'b000001_01101_10101_0000000000000001; 	// addi
disk[144] <= 32'b010010_11110_10101_1111111111111111; 	// sw
disk[145] <= 32'b001111_11110_01101_1111111111111111; 	// lw
disk[146] <= 32'b010000_00000_10110_0000000000000000; 	// li
disk[147] <= 32'b010010_11110_10110_1111111111111110; 	// sw
disk[148] <= 32'b001111_11110_01110_1111111111111110; 	// lw
disk[149] <= 32'b000000_01110_01101_10111_00000_001110; 	// lt
disk[150] <= 32'b010101_10111_00000_0000000010011111; 	// jf
disk[151] <= 32'b010001_00101_01111_0000000000000000; 	// la
disk[152] <= 32'b000000_01111_01110_11000_00000_000000; 	// add
disk[153] <= 32'b010000_00000_11001_0000000000000001; 	// li
disk[154] <= 32'b010010_11000_11001_0000000000000000; 	// sw
disk[155] <= 32'b000001_01110_11010_0000000000000001; 	// addi
disk[156] <= 32'b010010_11110_11010_1111111111111110; 	// sw
disk[157] <= 32'b001111_11110_01110_1111111111111110; 	// lw
disk[158] <= 32'b111100_00000000000000000010010100; 	// j
disk[159] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[160] <= 32'b000001_11110_11110_0000000000000110; 	// addi
disk[161] <= 32'b010010_11110_00110_1111111111111101; 	// sw
disk[162] <= 32'b001111_11110_01010_1111111111111101; 	// lw
disk[163] <= 32'b001111_00101_01011_0000000000100000; 	// lw
disk[164] <= 32'b000000_01010_01011_10100_00000_000011; 	// div
disk[165] <= 32'b010010_11110_10100_1111111111111111; 	// sw
disk[166] <= 32'b000000_01010_01011_10101_00000_000100; 	// mod
disk[167] <= 32'b010000_00000_10111_0000000000000000; 	// li
disk[168] <= 32'b000000_10101_10111_10110_00000_010000; 	// gt
disk[169] <= 32'b010101_10110_00000_0000000010101110; 	// jf
disk[170] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[171] <= 32'b000001_01100_11000_0000000000000001; 	// addi
disk[172] <= 32'b010010_11110_11000_1111111111111111; 	// sw
disk[173] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[174] <= 32'b010000_00000_11001_0000000000000000; 	// li
disk[175] <= 32'b010010_11110_11001_1111111111111110; 	// sw
disk[176] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[177] <= 32'b010000_00000_11011_0000000000100000; 	// li
disk[178] <= 32'b000000_01101_11011_11010_00000_001110; 	// lt
disk[179] <= 32'b010101_11010_00000_0000000011001111; 	// jf
disk[180] <= 32'b010001_00101_01110_0000000000000000; 	// la
disk[181] <= 32'b000000_01110_01101_11100_00000_000000; 	// add
disk[182] <= 32'b001111_11100_11100_0000000000000000; 	// lw
disk[183] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[184] <= 32'b000000_11100_10100_11101_00000_001100; 	// eq
disk[185] <= 32'b010101_11101_00000_0000000011001011; 	// jf
disk[186] <= 32'b010010_11110_01101_0000000000000000; 	// sw
disk[187] <= 32'b010000_00000_10110_0000000000000000; 	// li
disk[188] <= 32'b000000_01100_10110_10101_00000_001101; 	// ne
disk[189] <= 32'b010101_10101_00000_0000000011001000; 	// jf
disk[190] <= 32'b000000_01110_01101_10111_00000_000000; 	// add
disk[191] <= 32'b010000_00000_11000_0000000000000001; 	// li
disk[192] <= 32'b010010_10111_11000_0000000000000000; 	// sw
disk[193] <= 32'b000010_01100_11001_0000000000000001; 	// subi
disk[194] <= 32'b010010_11110_11001_1111111111111111; 	// sw
disk[195] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[196] <= 32'b000001_01101_11010_0000000000000001; 	// addi
disk[197] <= 32'b010010_11110_11010_1111111111111110; 	// sw
disk[198] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[199] <= 32'b111100_00000000000000000010111011; 	// j
disk[200] <= 32'b001111_11110_01111_0000000000000000; 	// lw
disk[201] <= 32'b001110_01111_00001_0000000000000000; 	// mov
disk[202] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[203] <= 32'b000001_01101_11011_0000000000000001; 	// addi
disk[204] <= 32'b010010_11110_11011_1111111111111110; 	// sw
disk[205] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[206] <= 32'b111100_00000000000000000010110000; 	// j
disk[207] <= 32'b001111_00101_10000_0000000000100001; 	// lw
disk[208] <= 32'b001110_10000_00001_0000000000000000; 	// mov
disk[209] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[210] <= 32'b000001_11110_11110_0000000000000101; 	// addi
disk[211] <= 32'b010010_11110_00110_1111111111111110; 	// sw
disk[212] <= 32'b001111_11110_01010_1111111111111110; 	// lw
disk[213] <= 32'b010010_11110_01010_0000000000000000; 	// sw
disk[214] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[215] <= 32'b001110_01011_00110_0000000000000000; 	// mov
disk[216] <= 32'b010110_00110_10100_0000000000000000; 	// ldk
disk[217] <= 32'b010010_11110_10100_1111111111111111; 	// sw
disk[218] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[219] <= 32'b001101_01100_10101_0000000000011010; 	// srli
disk[220] <= 32'b001111_00101_01101_0000000001001101; 	// lw
disk[221] <= 32'b000000_10101_01101_10110_00000_001101; 	// ne
disk[222] <= 32'b010101_10110_00000_0000000011100111; 	// jf
disk[223] <= 32'b000001_01011_10111_0000000000000001; 	// addi
disk[224] <= 32'b010010_11110_10111_0000000000000000; 	// sw
disk[225] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[226] <= 32'b001110_01011_00110_0000000000000000; 	// mov
disk[227] <= 32'b010110_00110_11000_0000000000000000; 	// ldk
disk[228] <= 32'b010010_11110_11000_1111111111111111; 	// sw
disk[229] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[230] <= 32'b111100_00000000000000000011011010; 	// j
disk[231] <= 32'b000000_01011_01010_11001_00000_000001; 	// sub
disk[232] <= 32'b001110_11001_00001_0000000000000000; 	// mov
disk[233] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[234] <= 32'b000001_11110_11110_0000000000001001; 	// addi
disk[235] <= 32'b010010_11110_00110_1111111111111010; 	// sw
disk[236] <= 32'b010010_11110_00111_1111111111111011; 	// sw
disk[237] <= 32'b001111_11110_01010_1111111111111010; 	// lw
disk[238] <= 32'b010010_11110_01010_1111111111111100; 	// sw
disk[239] <= 32'b001110_01010_00110_0000000000000000; 	// mov
disk[240] <= 32'b010010_11110_11111_1111111111111001; 	// sw
disk[241] <= 32'b111110_00000000000000000011010010; 	// jal
disk[242] <= 32'b000010_11110_11110_0000000000000101; 	// subi
disk[243] <= 32'b001111_11110_11111_1111111111111001; 	// lw
disk[244] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[245] <= 32'b010010_11110_01010_0000000000000000; 	// sw
disk[246] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[247] <= 32'b001110_01011_00110_0000000000000000; 	// mov
disk[248] <= 32'b010010_11110_11111_1111111111111001; 	// sw
disk[249] <= 32'b111110_00000000000000000010100000; 	// jal
disk[250] <= 32'b000010_11110_11110_0000000000000110; 	// subi
disk[251] <= 32'b001111_11110_11111_1111111111111001; 	// lw
disk[252] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[253] <= 32'b010010_11110_01010_1111111111111111; 	// sw
disk[254] <= 32'b001111_00101_01011_0000000000100000; 	// lw
disk[255] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[256] <= 32'b000000_01011_01100_10100_00000_000010; 	// mul
disk[257] <= 32'b010010_11110_10100_1111111111111101; 	// sw
disk[258] <= 32'b001111_11110_01101_1111111111111100; 	// lw
disk[259] <= 32'b001110_01101_00110_0000000000000000; 	// mov
disk[260] <= 32'b010110_00110_10101_0000000000000000; 	// ldk
disk[261] <= 32'b010010_11110_10101_1111111111111110; 	// sw
disk[262] <= 32'b001111_11110_01110_1111111111111110; 	// lw
disk[263] <= 32'b001101_01110_10110_0000000000011010; 	// srli
disk[264] <= 32'b001111_00101_01111_0000000001001101; 	// lw
disk[265] <= 32'b000000_10110_01111_10111_00000_001101; 	// ne
disk[266] <= 32'b010101_10111_00000_0000000100011010; 	// jf
disk[267] <= 32'b001110_01110_00110_0000000000000000; 	// mov
disk[268] <= 32'b001111_11110_10000_1111111111111101; 	// lw
disk[269] <= 32'b001110_10000_00111_0000000000000000; 	// mov
disk[270] <= 32'b011001_00111_00110_0000000000000000; 	// sim
disk[271] <= 32'b000001_01101_11000_0000000000000001; 	// addi
disk[272] <= 32'b010010_11110_11000_1111111111111100; 	// sw
disk[273] <= 32'b001111_11110_01101_1111111111111100; 	// lw
disk[274] <= 32'b001110_01101_00110_0000000000000000; 	// mov
disk[275] <= 32'b010110_00110_11001_0000000000000000; 	// ldk
disk[276] <= 32'b010010_11110_11001_1111111111111110; 	// sw
disk[277] <= 32'b001111_11110_01110_1111111111111110; 	// lw
disk[278] <= 32'b000001_10000_11010_0000000000000001; 	// addi
disk[279] <= 32'b010010_11110_11010_1111111111111101; 	// sw
disk[280] <= 32'b001111_11110_10000_1111111111111101; 	// lw
disk[281] <= 32'b111100_00000000000000000100000110; 	// j
disk[282] <= 32'b001110_01110_00110_0000000000000000; 	// mov
disk[283] <= 32'b001110_10000_00111_0000000000000000; 	// mov
disk[284] <= 32'b011001_00111_00110_0000000000000000; 	// sim
disk[285] <= 32'b001111_11110_10001_1111111111111011; 	// lw
disk[286] <= 32'b001110_10001_00110_0000000000000000; 	// mov
disk[287] <= 32'b011110_00110_00000_0000000000000000; 	// mmuSelect
disk[288] <= 32'b000000_01011_01100_11011_00000_000010; 	// mul
disk[289] <= 32'b001110_11011_00110_0000000000000000; 	// mov
disk[290] <= 32'b011010_00000_00110_0000000000000000; 	// mmuLowerIM
disk[291] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[292] <= 32'b000001_11110_11110_0000000000000100; 	// addi
disk[293] <= 32'b010010_11110_00110_1111111111111111; 	// sw
disk[294] <= 32'b001111_11110_01010_1111111111111111; 	// lw
disk[295] <= 32'b010000_00000_10101_0000000000000000; 	// li
disk[296] <= 32'b000000_01010_10101_10100_00000_001100; 	// eq
disk[297] <= 32'b010101_10100_00000_0000000100101101; 	// jf
disk[298] <= 32'b010000_00000_10110_0000000000000001; 	// li
disk[299] <= 32'b001110_10110_00001_0000000000000000; 	// mov
disk[300] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[301] <= 32'b010000_00000_10111_0000000000000001; 	// li
disk[302] <= 32'b010010_11110_10111_0000000000000000; 	// sw
disk[303] <= 32'b010000_00000_11001_0000000000000000; 	// li
disk[304] <= 32'b000000_01010_11001_11000_00000_010000; 	// gt
disk[305] <= 32'b010101_11000_00000_0000000100111010; 	// jf
disk[306] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[307] <= 32'b000011_01011_11010_0000000000000010; 	// muli
disk[308] <= 32'b010010_11110_11010_0000000000000000; 	// sw
disk[309] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[310] <= 32'b000010_01010_11011_0000000000000001; 	// subi
disk[311] <= 32'b010010_11110_11011_1111111111111111; 	// sw
disk[312] <= 32'b001111_11110_01010_1111111111111111; 	// lw
disk[313] <= 32'b111100_00000000000000000100101111; 	// j
disk[314] <= 32'b001110_01011_00001_0000000000000000; 	// mov
disk[315] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
disk[316] <= 32'b001110_00000_00101_0000000000000000; 	// mov
disk[317] <= 32'b000001_11110_11110_0000000001011011; 	// addi
disk[318] <= 32'b001111_00101_01010_0000000001010000; 	// lw
disk[319] <= 32'b001110_01010_00110_0000000000000000; 	// mov
disk[320] <= 32'b100001_00000_00110_0000000000000000; 	// lcd
disk[321] <= 32'b111110_00000000000000000000000001; 	// jal
disk[322] <= 32'b000010_11110_11110_0000000000000010; 	// subi
disk[323] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[324] <= 32'b111110_00000000000000000001101111; 	// jal
disk[325] <= 32'b000010_11110_11110_0000000000000101; 	// subi
disk[326] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[327] <= 32'b111110_00000000000000000000011111; 	// jal
disk[328] <= 32'b000010_11110_11110_0000000000000101; 	// subi
disk[329] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[330] <= 32'b010000_00000_10100_0000000000000001; 	// li
disk[331] <= 32'b010101_10100_00000_0000000111010110; 	// jf
disk[332] <= 32'b010011_00000_10101_0000000000000000; 	// in
disk[333] <= 32'b010010_11110_10101_1111111111111110; 	// sw
disk[334] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[335] <= 32'b001110_01011_00110_0000000000000000; 	// mov
disk[336] <= 32'b010000_00000_00111_0000000000000000; 	// li
disk[337] <= 32'b010100_00000_00110_0000000000000000; 	// out
disk[338] <= 32'b001111_00101_01100_0000000001010110; 	// lw
disk[339] <= 32'b001111_00101_01101_0000000001010000; 	// lw
disk[340] <= 32'b000000_01100_01101_10110_00000_001100; 	// eq
disk[341] <= 32'b010101_10110_00000_0000000101100010; 	// jf
disk[342] <= 32'b010000_00000_11000_0000000000000011; 	// li
disk[343] <= 32'b000000_01011_11000_10111_00000_010000; 	// gt
disk[344] <= 32'b010101_10111_00000_0000000101011100; 	// jf
disk[345] <= 32'b010010_11110_01101_1111111111111110; 	// sw
disk[346] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[347] <= 32'b111100_00000000000000000101100001; 	// j
disk[348] <= 32'b010000_00000_11010_0000000000000001; 	// li
disk[349] <= 32'b000000_01011_11010_11001_00000_001110; 	// lt
disk[350] <= 32'b010101_11001_00000_0000000101100001; 	// jf
disk[351] <= 32'b010010_11110_01101_1111111111111110; 	// sw
disk[352] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[353] <= 32'b111100_00000000000000000111010000; 	// j
disk[354] <= 32'b001111_00101_01110_0000000001010001; 	// lw
disk[355] <= 32'b000000_01100_01110_11011_00000_001100; 	// eq
disk[356] <= 32'b010101_11011_00000_0000000101110001; 	// jf
disk[357] <= 32'b010000_00000_11101_0000000000000011; 	// li
disk[358] <= 32'b000000_01011_11101_11100_00000_010000; 	// gt
disk[359] <= 32'b010101_11100_00000_0000000101101011; 	// jf
disk[360] <= 32'b010010_11110_01101_1111111111111110; 	// sw
disk[361] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[362] <= 32'b111100_00000000000000000101110000; 	// j
disk[363] <= 32'b010000_00000_10101_0000000000000001; 	// li
disk[364] <= 32'b000000_01011_10101_10100_00000_001110; 	// lt
disk[365] <= 32'b010101_10100_00000_0000000101110000; 	// jf
disk[366] <= 32'b010010_11110_01101_1111111111111110; 	// sw
disk[367] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[368] <= 32'b111100_00000000000000000111010000; 	// j
disk[369] <= 32'b001111_00101_01111_0000000001010010; 	// lw
disk[370] <= 32'b000000_01100_01111_10110_00000_001100; 	// eq
disk[371] <= 32'b010101_10110_00000_0000000110101011; 	// jf
disk[372] <= 32'b010000_00000_11000_0000000000000001; 	// li
disk[373] <= 32'b000000_01011_11000_10111_00000_001100; 	// eq
disk[374] <= 32'b010101_10111_00000_0000000110011101; 	// jf
disk[375] <= 32'b001111_00101_10000_0000000001010100; 	// lw
disk[376] <= 32'b010010_11110_10000_1111111111111110; 	// sw
disk[377] <= 32'b001111_11110_01011_1111111111111110; 	// lw
disk[378] <= 32'b010000_00000_11001_0000000000000000; 	// li
disk[379] <= 32'b010010_11110_11001_1111111111111111; 	// sw
disk[380] <= 32'b010000_00000_11010_0000000000000000; 	// li
disk[381] <= 32'b010010_11110_11010_0000000000000000; 	// sw
disk[382] <= 32'b001111_11110_10001_1111111111111111; 	// lw
disk[383] <= 32'b001111_00101_10010_0000000000100010; 	// lw
disk[384] <= 32'b000000_10001_10010_11011_00000_001110; 	// lt
disk[385] <= 32'b010101_11011_00000_0000000110011001; 	// jf
disk[386] <= 32'b010001_00101_10011_0000000000100101; 	// la
disk[387] <= 32'b000000_10011_10001_11100_00000_000000; 	// add
disk[388] <= 32'b001111_11100_11100_0000000000000000; 	// lw
disk[389] <= 32'b010000_00000_10100_0000000000000000; 	// li
disk[390] <= 32'b000000_11100_10100_11101_00000_001101; 	// ne
disk[391] <= 32'b010101_11101_00000_0000000110010100; 	// jf
disk[392] <= 32'b001111_11110_01010_0000000000000000; 	// lw
disk[393] <= 32'b001110_01010_00110_0000000000000000; 	// mov
disk[394] <= 32'b010000_00000_00111_0000000000000001; 	// li
disk[395] <= 32'b010100_00000_00110_0000000000000001; 	// out
disk[396] <= 32'b001110_10001_00110_0000000000000000; 	// mov
disk[397] <= 32'b111110_00000000000000000100100100; 	// jal
disk[398] <= 32'b000010_11110_11110_0000000000000100; 	// subi
disk[399] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[400] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[401] <= 32'b000000_01011_01010_10101_00000_000000; 	// add
disk[402] <= 32'b010010_11110_10101_0000000000000000; 	// sw
disk[403] <= 32'b001111_11110_01011_0000000000000000; 	// lw
disk[404] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[405] <= 32'b000001_01100_10110_0000000000000001; 	// addi
disk[406] <= 32'b010010_11110_10110_1111111111111111; 	// sw
disk[407] <= 32'b001111_11110_01100_1111111111111111; 	// lw
disk[408] <= 32'b111100_00000000000000000101111110; 	// j
disk[409] <= 32'b001110_01011_00110_0000000000000000; 	// mov
disk[410] <= 32'b010000_00000_00111_0000000000000010; 	// li
disk[411] <= 32'b010100_00000_00110_0000000000000010; 	// out
disk[412] <= 32'b111100_00000000000000000110101010; 	// j
disk[413] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[414] <= 32'b010000_00000_11000_0000000000000011; 	// li
disk[415] <= 32'b000000_01101_11000_10111_00000_010000; 	// gt
disk[416] <= 32'b010101_10111_00000_0000000110100101; 	// jf
disk[417] <= 32'b001111_00101_01110_0000000001010000; 	// lw
disk[418] <= 32'b010010_11110_01110_1111111111111110; 	// sw
disk[419] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[420] <= 32'b111100_00000000000000000110101010; 	// j
disk[421] <= 32'b010000_00000_11010_0000000000000001; 	// li
disk[422] <= 32'b000000_01101_11010_11001_00000_001110; 	// lt
disk[423] <= 32'b010101_11001_00000_0000000110101010; 	// jf
disk[424] <= 32'b010010_11110_01110_1111111111111110; 	// sw
disk[425] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[426] <= 32'b111100_00000000000000000111010000; 	// j
disk[427] <= 32'b001111_00101_01111_0000000001010110; 	// lw
disk[428] <= 32'b001111_00101_10000_0000000001010011; 	// lw
disk[429] <= 32'b000000_01111_10000_11011_00000_001100; 	// eq
disk[430] <= 32'b010101_11011_00000_0000000110111011; 	// jf
disk[431] <= 32'b010000_00000_11101_0000000000000000; 	// li
disk[432] <= 32'b000000_01101_11101_11100_00000_010000; 	// gt
disk[433] <= 32'b010101_11100_00000_0000000110111000; 	// jf
disk[434] <= 32'b001111_00101_10001_0000000001010101; 	// lw
disk[435] <= 32'b001110_10001_00110_0000000000000000; 	// mov
disk[436] <= 32'b100001_00000_00110_0000000000000000; 	// lcd
disk[437] <= 32'b001110_01101_00110_0000000000000000; 	// mov
disk[438] <= 32'b011110_00110_00000_0000000000000000; 	// mmuSelect
disk[439] <= 32'b100000_00000000000000000000000000; 	// exec
disk[440] <= 32'b010010_11110_01110_1111111111111110; 	// sw
disk[441] <= 32'b001111_11110_01101_1111111111111110; 	// lw
disk[442] <= 32'b111100_00000000000000000111010000; 	// j
disk[443] <= 32'b001111_00101_10010_0000000001010100; 	// lw
disk[444] <= 32'b000000_01111_10010_10100_00000_001100; 	// eq
disk[445] <= 32'b010101_10100_00000_0000000111010000; 	// jf
disk[446] <= 32'b010000_00000_10110_0000000000000001; 	// li
disk[447] <= 32'b000000_01101_10110_10101_00000_010000; 	// gt
disk[448] <= 32'b010101_10101_00000_0000000111001110; 	// jf
disk[449] <= 32'b000010_01101_10111_0000000000000001; 	// subi
disk[450] <= 32'b010001_00101_10011_0000000000101111; 	// la
disk[451] <= 32'b000000_10011_10111_11000_00000_000000; 	// add
disk[452] <= 32'b001111_11000_11000_0000000000000000; 	// lw
disk[453] <= 32'b001110_11000_00110_0000000000000000; 	// mov
disk[454] <= 32'b000010_01101_11001_0000000000000001; 	// subi
disk[455] <= 32'b010001_00101_01010_0000000000100101; 	// la
disk[456] <= 32'b000000_01010_11001_11010_00000_000000; 	// add
disk[457] <= 32'b001111_11010_11010_0000000000000000; 	// lw
disk[458] <= 32'b001110_11010_00111_0000000000000000; 	// mov
disk[459] <= 32'b111110_00000000000000000011101010; 	// jal
disk[460] <= 32'b000010_11110_11110_0000000000001001; 	// subi
disk[461] <= 32'b001110_00001_01010_0000000000000000; 	// mov
disk[462] <= 32'b001111_00101_01011_0000000001010000; 	// lw
disk[463] <= 32'b010010_11110_01011_1111111111111110; 	// sw
disk[464] <= 32'b001111_11110_01100_1111111111111110; 	// lw
disk[465] <= 32'b010010_00101_01100_0000000001010110; 	// sw
disk[466] <= 32'b001111_00101_01101_0000000001010110; 	// lw
disk[467] <= 32'b001110_01101_00110_0000000000000000; 	// mov
disk[468] <= 32'b100001_00000_00110_0000000000000000; 	// lcd
disk[469] <= 32'b111100_00000000000000000101001010; 	// j
disk[470] <= 32'b111111_00000000000000000000000000; 	// halt
		
		// PROGRAMA 1
		disk[800] <= 32'b111101_00000000000000000000100001;		// Jump to Main
		disk[801] <= 32'b000001_11110_11110_0000000000000111; 	// addi
		disk[802] <= 32'b010010_11110_00110_1111111111111100; 	// sw
		disk[803] <= 32'b010000_00000_10100_0000000000000000; 	// li
		disk[804] <= 32'b010010_11110_10100_1111111111111111; 	// sw
		disk[805] <= 32'b010000_00000_10101_0000000000000001; 	// li
		disk[806] <= 32'b010010_11110_10101_0000000000000000; 	// sw
		disk[807] <= 32'b010000_00000_10110_0000000000000000; 	// li
		disk[808] <= 32'b010010_11110_10110_1111111111111101; 	// sw
		disk[809] <= 32'b001111_11110_01010_1111111111111101; 	// lw
		disk[810] <= 32'b001111_11110_01011_1111111111111100; 	// lw
		disk[811] <= 32'b000000_01010_01011_10111_00000_001111; 	// let
		disk[812] <= 32'b010101_10111_00000_0000000000011111; 	// jf
		disk[813] <= 32'b010000_00000_11001_0000000000000001; 	// li
		disk[814] <= 32'b000000_01010_11001_11000_00000_001111; 	// let
		disk[815] <= 32'b010101_11000_00000_0000000000010010; 	// jf
		disk[816] <= 32'b010010_11110_01010_1111111111111110; 	// sw
		disk[817] <= 32'b111100_00000000000000000000011011; 	// j
		disk[818] <= 32'b001111_11110_01100_1111111111111111; 	// lw
		disk[819] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[820] <= 32'b000000_01100_01101_11010_00000_000000; 	// add
		disk[821] <= 32'b010010_11110_11010_1111111111111110; 	// sw
		disk[822] <= 32'b010010_11110_01101_1111111111111111; 	// sw
		disk[823] <= 32'b001111_11110_01100_1111111111111111; 	// lw
		disk[824] <= 32'b001111_11110_01110_1111111111111110; 	// lw
		disk[825] <= 32'b010010_11110_01110_0000000000000000; 	// sw
		disk[826] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[827] <= 32'b000001_01010_11011_0000000000000001; 	// addi
		disk[828] <= 32'b010010_11110_11011_1111111111111101; 	// sw
		disk[829] <= 32'b001111_11110_01010_1111111111111101; 	// lw
		disk[830] <= 32'b111100_00000000000000000000001001; 	// j
		disk[831] <= 32'b001110_01110_00001_0000000000000000; 	// mov
		disk[832] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
		disk[833] <= 32'b000001_11110_11110_0000000000000010; 	// addi
		disk[834] <= 32'b010000_00000_10100_0000000000001011; 	// li
		disk[835] <= 32'b010010_11110_10100_0000000000000000; 	// sw
		disk[836] <= 32'b001111_11110_01010_0000000000000000; 	// lw
		disk[837] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[838] <= 32'b010010_11110_11111_1111111111111111; 	// sw
		disk[839] <= 32'b111110_00000000000000000000000001; 	// jal
		disk[840] <= 32'b000010_11110_11110_0000000000000111; 	// subi
		disk[841] <= 32'b001111_11110_11111_1111111111111111; 	// lw
		disk[842] <= 32'b001110_00001_01010_0000000000000000; 	// mov
		disk[843] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[844] <= 32'b010000_00000_00111_0000000000000000; 	// li
		disk[845] <= 32'b010100_00000_00110_0000000000000000; 	// out
		disk[846] <= 32'b000010_11110_11110_0000000000000010; 	// subi
		disk[847] <= 32'b011111_11111_00000_0000000000000000; 	// syscall

		// PROGRAMA 2
		disk[850] <= 32'b111101_00000000000000000000011111;		// Jump to Main
		disk[851] <= 32'b000001_11110_11110_0000000000000111; 	// addi
		disk[852] <= 32'b010010_11110_00110_1111111111111100; 	// sw
		disk[853] <= 32'b010010_11110_00111_1111111111111101; 	// sw
		disk[854] <= 32'b010000_00000_10100_0000000000000000; 	// li
		disk[855] <= 32'b010010_11110_10100_1111111111111110; 	// sw
		disk[856] <= 32'b010000_00000_10101_0000000000000000; 	// li
		disk[857] <= 32'b010010_11110_10101_0000000000000000; 	// sw
		disk[858] <= 32'b001111_11110_01010_1111111111111110; 	// lw
		disk[859] <= 32'b001111_11110_01011_1111111111111101; 	// lw
		disk[860] <= 32'b000000_01010_01011_10110_00000_001110; 	// lt
		disk[861] <= 32'b010101_10110_00000_0000000000011011; 	// jf
		disk[862] <= 32'b001111_11110_01100_1111111111111100; 	// lw
		disk[863] <= 32'b000000_01100_01010_10111_00000_000000; 	// add
		disk[864] <= 32'b001111_10111_10111_0000000000000000; 	// lw
		disk[865] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[866] <= 32'b000000_01101_10111_11000_00000_001110; 	// lt
		disk[867] <= 32'b010101_11000_00000_0000000000010111; 	// jf
		disk[868] <= 32'b000000_01100_01010_11001_00000_000000; 	// add
		disk[869] <= 32'b001111_11001_11001_0000000000000000; 	// lw
		disk[870] <= 32'b010010_11110_11001_0000000000000000; 	// sw
		disk[871] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[872] <= 32'b010010_11110_01010_1111111111111111; 	// sw
		disk[873] <= 32'b000001_01010_11010_0000000000000001; 	// addi
		disk[874] <= 32'b010010_11110_11010_1111111111111110; 	// sw
		disk[875] <= 32'b001111_11110_01010_1111111111111110; 	// lw
		disk[876] <= 32'b111100_00000000000000000000001000; 	// j
		disk[877] <= 32'b001110_01101_00110_0000000000000000; 	// mov
		disk[878] <= 32'b010000_00000_00111_0000000000000001; 	// li
		disk[879] <= 32'b010100_00000_00110_0000000000000001; 	// out
		disk[880] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
		disk[881] <= 32'b000001_11110_11110_0000000000000111; 	// addi
		disk[882] <= 32'b010001_11110_01010_1111111111111011; 	// la
		disk[883] <= 32'b010000_00000_10100_0000000000001100; 	// li
		disk[884] <= 32'b010010_01010_10100_0000000000000000; 	// sw
		disk[885] <= 32'b010000_00000_10101_0000000000101001; 	// li
		disk[886] <= 32'b010010_01010_10101_0000000000000001; 	// sw
		disk[887] <= 32'b010000_00000_10110_0000000000010111; 	// li
		disk[888] <= 32'b010010_01010_10110_0000000000000010; 	// sw
		disk[889] <= 32'b010000_00000_10111_0000000001100010; 	// li
		disk[890] <= 32'b010010_01010_10111_0000000000000011; 	// sw
		disk[891] <= 32'b010000_00000_11000_0000000000100001; 	// li
		disk[892] <= 32'b010010_01010_11000_0000000000000100; 	// sw
		disk[893] <= 32'b010000_00000_11001_0000000000010101; 	// li
		disk[894] <= 32'b010010_01010_11001_0000000000000101; 	// sw
		disk[895] <= 32'b010001_11110_00110_1111111111111011; 	// la
		disk[896] <= 32'b010000_00000_00111_0000000000000110; 	// li
		disk[897] <= 32'b010010_11110_11111_1111111111111010; 	// sw
		disk[898] <= 32'b111110_00000000000000000000000001; 	// jal
		disk[899] <= 32'b000010_11110_11110_0000000000000111; 	// subi
		disk[900] <= 32'b001111_11110_11111_1111111111111010; 	// lw
		disk[901] <= 32'b001110_00001_01010_0000000000000000; 	// mov
		disk[902] <= 32'b000010_11110_11110_0000000000000111; 	// subi
		disk[903] <= 32'b011111_11111_00000_0000000000000000; 	// syscall
		
		// PROGRAMA 3
		disk[950] <= 32'b111101_00000000000000000000010011;		// Jump to Main
		disk[951] <= 32'b000001_11110_11110_0000000000000100; 	// addi
		disk[952] <= 32'b010010_11110_00110_1111111111111111; 	// sw
		disk[953] <= 32'b010000_00000_10100_0000000000000001; 	// li
		disk[954] <= 32'b010010_11110_10100_0000000000000000; 	// sw
		disk[955] <= 32'b001111_11110_01010_1111111111111111; 	// lw
		disk[956] <= 32'b010000_00000_10110_0000000000000000; 	// li
		disk[957] <= 32'b000000_01010_10110_10101_00000_010000; 	// gt
		disk[958] <= 32'b010101_10101_00000_0000000000010001; 	// jf
		disk[959] <= 32'b001111_11110_01011_0000000000000000; 	// lw
		disk[960] <= 32'b000000_01011_01010_10111_00000_000010; 	// mul
		disk[961] <= 32'b010010_11110_10111_0000000000000000; 	// sw
		disk[962] <= 32'b001111_11110_01011_0000000000000000; 	// lw
		disk[963] <= 32'b000010_01010_11000_0000000000000001; 	// subi
		disk[964] <= 32'b010010_11110_11000_1111111111111111; 	// sw
		disk[965] <= 32'b001111_11110_01010_1111111111111111; 	// lw
		disk[966] <= 32'b111100_00000000000000000000000101; 	// j
		disk[967] <= 32'b001110_01011_00001_0000000000000000; 	// mov
		disk[968] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
		disk[969] <= 32'b000001_11110_11110_0000000000000010; 	// addi
		disk[970] <= 32'b010011_00000_10100_0000000000000000; 	// in
		disk[971] <= 32'b010010_11110_10100_0000000000000000; 	// sw
		disk[972] <= 32'b001111_11110_01010_0000000000000000; 	// lw
		disk[973] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[974] <= 32'b010010_11110_11111_1111111111111111; 	// sw
		disk[975] <= 32'b111110_00000000000000000000000001; 	// jal
		disk[976] <= 32'b000010_11110_11110_0000000000000100; 	// subi
		disk[977] <= 32'b001111_11110_11111_1111111111111111; 	// lw
		disk[978] <= 32'b001110_00001_01010_0000000000000000; 	// mov
		disk[979] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[980] <= 32'b010000_00000_00111_0000000000000010; 	// li
		disk[981] <= 32'b010100_00000_00110_0000000000000010; 	// out
		disk[982] <= 32'b000010_11110_11110_0000000000000010; 	// subi
		disk[983] <= 32'b011111_11111_00000_0000000000000000; 	// syscall
		
	end
endmodule
