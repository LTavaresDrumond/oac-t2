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

    localparam FUNADD = 10'b0000000000; // Altere para o funct7 + funct3 correto
    localparam FUNSUB = 10'b0100000000;
    localparam FUNAND = 10'b0000000111;
    localparam FUNOR  = 10'b0000000110;
    localparam FUNSLT = 10'b0000000010;

    always @(*) 
	 begin
		/* se 00 vamos para add vindos de lw ou sw
		 se 01 vamos pra sub vindo de branch
		 se 10 vamos pra verificar o funct7 + funct 3 ou seja funct10 */
        case (ULAOp)
            2'b00: ULACtrl = OPADD; 
            2'b01: ULACtrl = OPSUB; 
            
            2'b10: begin 
                case (Funct10)
                    FUNADD:  ULACtrl = OPADD;
                    FUNSUB:  ULACtrl = OPSUB;
                    FUNAND:  ULACtrl = OPAND;
                    FUNOR:   ULACtrl = OPOR;
                    FUNSLT:  ULACtrl = OPSLT;
                    default: ULACtrl = 4'b0000; 
                endcase
            end 
            
            default: ULACtrl = 4'b0000; 
        endcase 
    end

endmodule