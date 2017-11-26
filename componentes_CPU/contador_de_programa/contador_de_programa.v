module contador_de_programa(clk, reset, addrin, addrout);
	input clk;										// clock
	input reset;									// reset
	input [25:0] addrin;							// in address
	
	output reg [25:0] addrout;					// out address
		
	always @ (posedge clk or posedge reset) begin
		addrout <= reset ? {26 {1'b0}} : addrin;
	end
endmodule
