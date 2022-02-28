`timescale 1ns / 1ps

module seg_dis(
    input en,
    input win,
    input clk,
    output [7:0] seg
    );

    reg [7:0] seg_reg;

    always@(posedge clk)
    begin
        if(en)
        begin
            if(win)
            seg_reg <= 8'b01110111;
            else
            seg_reg <= 8'b01111100;
        end
        else
        seg_reg <= 8'b00000000;
    end

    assign seg = seg_reg;

endmodule
