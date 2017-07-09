`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2017 02:41:21 PM
// Design Name: 
// Module Name: TimeCounter
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


module TimeCounter(
    input CE,
    input LD,
    input [7:0] D,
    input clk,
    output TimeUp,
    output [7:0] Q
    );
    
    wire CE_1;
    wire TC_0, TC_1;
    
    
    count4L count4L_0 (.clk(clk), .CE(CE), .LD(LD), .D(D[3:0]), .TC(TC_0), .Q(Q[3:0]));
    assign CE_1 = TC_0 & CE;
    count4L count4L_1 (.clk(clk), .CE(CE_1), .LD(LD), .D(D[7:4]), .TC(TC_1), .Q(Q[7:4]));
    assign TimeUp = TC_0 & TC_1;
endmodule
