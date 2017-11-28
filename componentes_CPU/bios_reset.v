module bios_reset(reset, addrin, addrout);
	input reset;									// reset
	input [25:0] addrin;							// in address
	
	output [25:0] addrout;						// out address
	
	assign addrout = reset ? {26 {1'b0}} : addrin;
endmodule