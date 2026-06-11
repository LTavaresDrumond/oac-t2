module MuxRdIm (
    input [5:0] DadoLeitura2,       // DadoLeitura2
    input [32:0] Imediato,       // Imediato
    input  FonteUla,     // Controle de fonte da ULA
    output reg [5:0] saida        // Saída
);

    always @(*) begin
        if (FonteUla == 1'b0) begin
            saida = DadoLeitura2;
        end else begin
            saida = Imediato;
        end
    end

endmodule