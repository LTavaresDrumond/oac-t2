module ControleULA (
    input [9:0] Funct10,
    input [1:0] ULAOp,
    output reg [3:0] ULACtrl 
);

    // parametros
    localparam OPADD = 4'b0010;
    localparam OPSUB = 4'b0110;
    localparam OPAND = 4'b0000;
    localparam OPOR  = 4'b0001;
    localparam OPSLT = 4'b0111;
    localparam OPXOR = 4'b0011;
    localparam OPSLL = 4'b1000;
    localparam OPSRL = 4'b1001;

    localparam FUNADD = 10'b0000000000; // Altere para o funct7 + funct3 correto
    localparam FUNSUB = 10'b0100000000;
    localparam FUNAND = 10'b0000000111;
    localparam FUNOR  = 10'b0000000110;
    localparam FUNSLT = 10'b0000000010;
    localparam FUNXOR = 10'b0000000100;
    localparam FUNSLL = 10'b0000000001;
    localparam FUNSRL = 10'b0000000101;

    always @(*) 
	 begin
		/* se 00 vamos para add vindos de lw ou sw
		 se 01 vamos pra sub vindo de branch
		 se 10 vamos pra verificar o funct7 + funct 3 ou seja funct10 */
        case (ULAOp)
            2'b00: ULACtrl = OPADD;
            2'b01: ULACtrl = OPSUB; 
            
            2'b10: begin // Tipo R (Olha funct7 + funct3)
                case (Funct10)
                    FUNADD:  ULACtrl = OPADD;
                    FUNSUB:  ULACtrl = OPSUB;
                    FUNAND:  ULACtrl = OPAND;
                    FUNOR:   ULACtrl = OPOR;
                    FUNSLT:  ULACtrl = OPSLT;
                    FUNXOR:  ULACtrl = OPXOR;
                    FUNSLL:  ULACtrl = OPSLL;
                    FUNSRL:  ULACtrl = OPSRL;
                    default: ULACtrl = 4'b0000; 
                endcase
            end 

            2'b11: begin // Tipo I (Olha apenas o funct3)
                case (Funct10[2:0])
                    3'b000: ULACtrl = OPADD; // addi
                    3'b111: ULACtrl = OPAND; // andi
                    3'b110: ULACtrl = OPOR;  // ori
                    3'b100: ULACtrl = OPXOR; // xori
                    3'b010: ULACtrl = OPSLT; // slti
                    default: ULACtrl = 4'b0000;
                endcase
            end
            
            default: ULACtrl = 4'b0000; 
        endcase 
    end

endmodule