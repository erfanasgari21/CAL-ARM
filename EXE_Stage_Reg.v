module EXE_Stage_Reg(
    input clk, rst,
    input [31:0] pcIn,
    output reg[31:0] pc
);
    always @(posedge clk) begin
        if(rst)
            pc = 32'b0;
        else
            pc = pcIn;
    end
endmodule