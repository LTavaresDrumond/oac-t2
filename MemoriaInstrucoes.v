module MemoriaInstrucoes (
    input [31:0] Endereco,
    output reg [31:0] Instrucao
);

    // Declaração de uma memória de 256 palavras de 32 bits (1024 bytes)
    // O atributo abaixo orienta o Quartus a carregar o arquivo MIF
    (* ram_init_file = "UnicicloInst.mif" *) reg [31:0] memoria [0:255];

    always @(*) begin
        // O RISC-V endereça a memória por byte (PC soma 4 em 4),
        // mas nosso array salva palavras (32 bits).
        // Ignorar os 2 bits menos significativos ([31:2]) equivale a dividir o endereço por 4.
        Instrucao = memoria[Endereco[31:2]];
    end

endmodule