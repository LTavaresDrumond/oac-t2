module MemoriaDados(
    input clk,                   
    input [31:0] Endereco,
    input [31:0] DadoEscrever,   
    input EscreverDados,         
    input LerDados,              
    
    output reg [31:0] DadoLido
);

    
    (* ram_init_file = "UnicicloData.mif" *) reg [31:0] memoria [0:255]; // alterar o índice [0:255] para [0:511] (2 KB) ou [0:1023] (4 KB).

    
    always @(*) begin
        if (LerDados)
            DadoLido = memoria[Endereco[31:2]];
        else
            DadoLido = 32'd0;
    end
    
    
    always @(posedge clk) begin
        if (EscreverDados)
            memoria[Endereco[31:2]] <= DadoEscrever;
    end
    
endmodule