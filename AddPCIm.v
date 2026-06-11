module AddPCIm(
	input [31:0] PC,
	input [31:0] Imediato,
	
	output reg [31:0] NovoPC
);

	always @(*)
	begin
		NovoPC = PC + Imediato;
	end

endmodule