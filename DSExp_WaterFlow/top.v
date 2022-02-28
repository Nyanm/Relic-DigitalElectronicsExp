`timescale 1ns / 1ps

module top(
    input clk,
    input sel,
    output [11:0] led
    );

    wire clk_trans;

    fre_div FRE_DIV(
        .clk_in(clk),
        .clk_out(clk_trans)
    );

    running_led RUN_LED(
        .clk(clk_trans),
        .m(sel),
        .led_o(led)
    );

endmodule
