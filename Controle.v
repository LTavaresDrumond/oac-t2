module Controle(
    input [31:0] Instrucao,
    
    output reg [1:0] ULAop,
    output reg EscreverReg,     
    output reg FonteULA,        
    output reg EscreveMemoria,  
    output reg MemoriaReg,      
    output reg LerMemoria,     
    output reg Branch          
);

    always @(*) begin
        
        ULAop          = 2'b00;
        EscreverReg    = 1'b0;
        FonteULA       = 1'b0;
        EscreveMemoria = 1'b0;
        MemoriaReg     = 1'b0;
        LerMemoria     = 1'b0;
        Branch         = 1'b0;

        case(Instrucao[6:0])
            
            // tipo r
            7'b0110011: begin
                EscreverReg    = 1'b1; 
                FonteULA       = 1'b0; 
                MemoriaReg     = 1'b0; 
                ULAop          = 2'b10; 
            end

            // pro lw
            7'b0000011: begin
                EscreverReg    = 1'b1; 
                FonteULA       = 1'b1; 
                LerMemoria     = 1'b1; 
                MemoriaReg     = 1'b1; 
                ULAop          = 2'b00; 
            end

            // pro sw
            7'b0100011: begin
                FonteULA       = 1'b1; 
                EscreveMemoria = 1'b1; 
                ULAop          = 2'b00; 
            end

            // tipo b 
            7'b1100011: begin
                Branch         = 1'b1; 
                FonteULA       = 1'b0; 
                ULAop          = 2'b01; 
            end

            // tipo i
            7'b0010011: begin
                EscreverReg    = 1'b1; 
                FonteULA       = 1'b1; 
                MemoriaReg     = 1'b0; 
                ULAop          = 2'b00; 
            end

            default: begin
                
            end
        endcase
    end

endmodule