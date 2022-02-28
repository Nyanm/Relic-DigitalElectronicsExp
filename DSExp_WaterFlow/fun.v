`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/25 01:07:30
// Design Name: 
// Module Name: fun
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fun(
    input a,
    input b,
    input c,
    output reg y
    );
    
    wire N1;
    
    assign N1 = a | b;
    always@(N1 or c) y = N1 & ~ c;
    
endmodule
