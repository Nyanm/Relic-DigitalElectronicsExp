`timescale 1ns / 1ps

module fre_div(
    input clk_in, //50,000,000Hz
    output reg clk_out //10Hz
    );

    reg[22:0] cnt = 0;
    parameter MAX  = 5000000; //Shoule be 5000000
    parameter HALF = 2500000; //Should be 2500000

    always@(posedge clk_in)
        if(cnt < MAX) cnt<=cnt + 1'b1;
        else cnt<=1'b0;

    always@(posedge clk_in)
        if(cnt < HALF) clk_out<=1'b0;
        else clk_out<=1'b1;

endmodule
