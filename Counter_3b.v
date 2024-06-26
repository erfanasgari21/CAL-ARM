module Counter_3b(
    input clk, rst,
    input cntEn, cntLd,
    input [2:0] p,
    output co
);
    reg [2:0] count;
    always @(posedge clk) begin
        if(rst)
            count <= 3'b0;
        else if(cntLd)
            count <= p;
        else if(cntEn)
            count <= count + 3'd1;
    end

    assign co= (count==3'b111) ? 1'b1 : 1'b0;

endmodule


