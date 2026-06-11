module ULA (
    input [3:0] ULACtrl,
    input [31:0] MuxRD2,
	 input [31:0] DadoLido1,
    
    output reg [31:0] ResultadoULA,
    output reg Zero 
);

    always @(*) begin
        case(ULACtrl)
            4'b0000: ResultadoULA = DadoLido1 & MuxRD2;  // AND 
            4'b0001: ResultadoULA = DadoLido1 | MuxRD2;  // OR  
            4'b0010: ResultadoULA = DadoLido1 + MuxRD2;  // ADD
            4'b0110: ResultadoULA = DadoLido1 - MuxRD2;  // SUB 
				
            4'b0111: ResultadoULA = (DadoLido1 < MuxRD2) ? 32'd1 : 32'd0;
            
            4'b0011: ResultadoULA = DadoLido1 ^ MuxRD2;  // XOR
            4'b1000: ResultadoULA = DadoLido1 << MuxRD2[4:0]; // SLL 
            4'b1001: ResultadoULA = DadoLido1 >> MuxRD2[4:0]; // SRL 
            
            default: ResultadoULA = 32'd0;
        endcase
        
    
        if (ResultadoULA == 32'd0)
            Zero = 1'b1;
        else
            Zero = 1'b0;
    end

endmodule