module WB_Stage(
    input clk, rst,
    input [31:0] pcIn,
    output [31:0] pc
);
    assign pc = pcIn;
endmodule