`timescale 1ns / 1ps

module running_led(
    input clk,
    input m,
    output reg[11:0] led_o
    );

    reg[3:0] state_prs = 0;
    reg[3:0] state_ftr;

    //State transtion
    always@(m,state_prs)
        if(m&(state_prs==6)|(state_prs==9))
            state_ftr = 0;
        else
            state_ftr = state_prs + 1;
            
    always@(negedge clk) state_prs<=state_ftr;

    always@(m,state_prs)
        if(m)
            case(state_prs)
                0: led_o=12'b000000000000;
                1: led_o=12'b000001100000;
                2: led_o=12'b000011110000;
                3: led_o=12'b000111111000;
                4: led_o=12'b001111111100;
                5: led_o=12'b011111111110;
                6: led_o=12'b111111111111;
                default: led_o=12'bxxxxxxxxxxxx;
            endcase
        else
            case(state_prs)
                0: led_o=12'b100000000001;
                1: led_o=12'b010000000010;
                2: led_o=12'b001000000100;
                3: led_o=12'b000100001000;
                4: led_o=12'b000010010000;
                5: led_o=12'b000001100000;
                6: led_o=12'b000010010000;
                7: led_o=12'b000100001000;
                8: led_o=12'b001000000100;
                9: led_o=12'b010000000010;
                default: led_o=12'bxxxxxxxxxxxx;
            endcase

endmodule
    