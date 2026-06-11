module ProgramCounter (
    input clk,
    input [31:0] NovoPC,
    output reg [31:0] PC
);

    
    initial begin
        PC = 32'd0;
    end

    
    always @(posedge clk) begin
        PC <= NovoPC;
    end

endmodule