`timescale 1ns / 1ps

module buzz(
    input en,
    input clk_763,
    output buzz
    );

    assign buzz = en & clk_763;
    
endmodule
