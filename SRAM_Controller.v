module SRAM_Controller (
    input clk,
    input rst,
    
    input wrEn,
    input rdEn,
    input[31:0] address,
    input[31:0] writeData,

    output[31:0] readData,
    output ready,

    inout[15:0]     SRAM_DQ,
    output[17:0]    SRAM_ADDR,
    output          SRAM_UB_N,
    output          SRAM_LB_N,
    output          SRAM_WE_N,
    output          SRAM_CE_N,
    output          SRAM_OE_N
);

endmodule