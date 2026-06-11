module GeradorImediato (
    input [31:0] Instrucao,
    output reg [31:0] Imediato
);

    always @(*) begin
        case (Instrucao[6:0])
				// tipo i
            7'b0000011, 7'b0010011: begin
                Imediato = { {20{Instrucao[31]}}, Instrucao[31:20] };
            end

            // tipo s
            7'b0100011: begin
                Imediato = { {20{Instrucao[31]}}, Instrucao[31:25], Instrucao[11:7] };
            end

            // tipo b
            7'b1100011: begin
                Imediato = { {20{Instrucao[31]}}, Instrucao[7], Instrucao[30:25], Instrucao[11:8], 1'b0 };
            end

            // tipo j
            7'b1101111: begin
                Imediato = { {12{Instrucao[31]}}, Instrucao[19:12], Instrucao[20], Instrucao[30:21], 1'b0 };
            end

            default: Imediato = 32'd0;
        endcase
    end

endmodule