module MuxDataMem (
    input [31:0] ResultadoULA,    // Origem: ULA (Ex: add, sub)
    input [31:0] DadoLido,        // Origem: Memória de Dados (Ex: lw)
    input [31:0] PC4,             // Origem: Somador PC + 4 (Ex: jal, jalr)
    input [1:0]  MemPraReg,       // Sinal de controlo agora com 2 bits
    output reg [31:0] saida       // Corrigido para 32 bits
);

    always @(*) begin
        case (MemPraReg)
            2'b00: saida = ResultadoULA;
            2'b01: saida = DadoLido;
            2'b10: saida = PC4;           // Encaminha o endereço de retorno
            default: saida = 32'd0;
        endcase
    end

endmodule