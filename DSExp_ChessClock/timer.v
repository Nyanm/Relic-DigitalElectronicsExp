`timescale 1ns / 1ps

module timer(
    input btn_a,
    input btn_b,
    input clk,
    input scale,
    output reg buzz_en,
    output led,
    output reg seg_en,
    output win,
    output led_a,
    output led_b,
    output [8:0] cnt_dis
    );

    reg led_en;
    reg is_b;
    reg [8:0] cnt;

    always@(posedge btn_a or posedge btn_b or posedge clk)
    begin
        //Butten A has been pushed--Set A
        if(btn_a)
        begin
            buzz_en <= 0;
            led_en <= 0;
            cnt <= 0;
            seg_en <= 0;
            is_b <= 0;
        end
        //Butten B has been pushed--Set B
        else if (btn_b) begin
            buzz_en <= 0;
            led_en <= 0;
            cnt <= 0;
            seg_en <= 0;
            is_b <= 1;
        end
        //No butten has been pushed--time goes on
        else begin
            cnt <= cnt + 1;
            //Scale on (timeout at 30s)
            if(scale)
            begin
                if(cnt==250)led_en <= 1;
                else if(cnt==252)led_en <= 0;
                else if(cnt==300)
                begin
                    led_en <= 1;
                    buzz_en <= 1;
                    seg_en <= 1;
                end
            end
            //Scale off (timeout at 10s)
            else begin
                if(cnt==50)led_en <= 1;
                else if(cnt==52)led_en <= 0;
                else if(cnt==100)
                begin
                    led_en <= 1;
                    buzz_en <= 1;
                    seg_en <= 1;
                end
            end
        end
    end

    assign led = led_en & cnt[1];  //LED flashing at a frequency of 2.5Hz
    assign win = is_b;  //Segment displayer choose signal
    assign led_a = ~is_b;
    assign led_b = is_b;
    assign cnt_dis = cnt;

endmodule
