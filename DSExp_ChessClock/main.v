`timescale 1ns / 1ps

module main(
    input btn_a,
    input btn_b,
    input scale,
    input clk_50m,
    output led,
    output led_a,
    output led_b,
    output [7:0] seg,
    output [3:0] row,
    output buzz
    //output [8:0] cnt_dis
    );

    wire buzz_bus;
    wire seg_bus;
    wire win_bus;
    wire clk_10;
    wire clk_763;

    div DIV(
        .clk_50m(clk_50m),
        .clk_10(clk_10),
        .clk_763(clk_763)
    );

    timer TIM(
        .btn_a(btn_a),
        .btn_b(btn_b),
        .scale(scale),
        .clk(clk_10),
        .cnt_dis(cnt_dis),
        .buzz_en(buzz_bus),
        .led(led),
        .led_a(led_a),
        .led_b(led_b),
        .seg_en(seg_bus),
        .win(win_bus)
    );

    seg_dis SEG(
        .en(seg_bus),
        .win(win_bus),
        .clk(clk_10),
        .seg(seg)
    );

    buzz BUZ(
        .en(buzz_bus),
        .clk_763(clk_763),
        .buzz(buzz)
    );

    assign row[3:0]=0001;

endmodule
