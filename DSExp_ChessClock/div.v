`timescale 1ns / 1ps

module div(
    input clk_50m, //50,000,000Hz
    output reg clk_763, //736Hz for buzzer
    output reg clk_10 //10Hz for timer
    );

    reg[22:0] cnt = 0;
    parameter MAX  = 5000000; //Shoule be 5000000
    parameter HALF = 2500000; //Should be 2500000

    always@(posedge clk_50m)
        if(cnt < MAX) cnt<=cnt + 1'b1;
        else cnt<=1'b0;

    always@(posedge clk_50m)
        if(cnt < HALF) clk_10<=1'b0;
        else clk_10<=1'b1;

    always@(posedge clk_50m)
        if(cnt[16]) clk_763<=1'b0;
        else clk_763<=1;

endmodule
