module IF_Stage_Reg(
    input clk, rst, freeze, flush,
    input[31:0] pcIn, instructionIn,
    output reg[31:0] pc, instruction
);
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            pc = 32'b0;
            instruction = 32'b0;
        end 
        else begin
            pc = pcIn;
            instruction = instructionIn;
        end
    end
endmodule