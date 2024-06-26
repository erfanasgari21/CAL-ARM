module Control_Unit(
    input[1:0] mode,
    input[3:0] opCode,
    input sIn,
    output[8:0] controlOut
);
    reg[3:0] exeCmd_ID;
    reg memReadEn_ID, memWriteEn_ID, writeBackEn, b, sOut;

    always @(mode or opCode or sIn) begin
        {exeCmd_ID, memReadEn_ID, memWriteEn_ID, writeBackEn, b, sOut} = 9'b0;
        case(mode)
            2'b00: begin
                sOut <= sIn;
                case(opCode)
                    4'b1101: {exeCmd_ID, writeBackEn} <= {4'b0001, 1'b1}; //MOVE
                    4'b1111: {exeCmd_ID, writeBackEn} <= {4'b1001, 1'b1}; //MVN
                    4'b0100: {exeCmd_ID, writeBackEn} <= {4'b0010, 1'b1}; //ADD
                    4'b0101: {exeCmd_ID, writeBackEn} <= {4'b0011, 1'b1}; //ADC
                    4'b0010: {exeCmd_ID, writeBackEn} <= {4'b0100, 1'b1}; //SUB
                    4'b0110: {exeCmd_ID, writeBackEn} <= {4'b0101, 1'b1}; //SBC
                    4'b0000: {exeCmd_ID, writeBackEn} <= {4'b0110, 1'b1}; //AND
                    4'b1100: {exeCmd_ID, writeBackEn} <= {4'b0111, 1'b1}; //ORR
                    4'b0001: {exeCmd_ID, writeBackEn} <= {4'b1000, 1'b1}; //EOR
                    4'b1010: exeCmd_ID <= 4'b0100;                        //CMP
                    4'b1000: exeCmd_ID <= 4'b0110;                        //TST
                endcase
            end

            2'b01: begin
                exeCmd_ID <= 4'b0010;
                sOut <= 1'b1;
                case(sIn)
                    1'b1: {memReadEn_ID, writeBackEn} <= {1'b1, 1'b1}; //LDR
                    1'b0: memWriteEn_ID <= 1'b1;                       //STR
                endcase
            end
            
            2'b10:
                b <= 1'b1;

        endcase
    end        
    assign controlOut = {exeCmd_ID, memReadEn_ID, memWriteEn_ID, writeBackEn, b, sOut};
endmodule
