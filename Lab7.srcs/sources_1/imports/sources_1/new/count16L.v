`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2017 03:38:50 PM
// Design Name: 
// Module Name: count16L
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


module count16L(
    input clk,
    input CE,
    input LD,
    input [15:0] D,
    output TC,
    output [15:0] Q
    );
    
    wire CE_1,CE_2,CE_3;
    wire TC_0, TC_1, TC_2, TC_3;
    
    count4L count4L_0 (.clk(clk), .CE(CE), .LD(LD), .D(D[3:0]), .TC(TC_0), .Q(Q[3:0]));
    assign CE_1 = TC_0 & CE;
    
    count4L count4L_1 (.clk(clk), .CE(CE_1), .LD(LD), .D(D[7:4]), .TC(TC_1), .Q(Q[7:4]));
    assign CE_2 = TC_1 & CE_1;
    
    count4L count4L_2 (.clk(clk), .CE(CE_2), .LD(LD), .D(D[11:8]), .TC(TC_2), .Q(Q[11:8]));
    assign CE_3 = TC_2 & CE_2;
    
    count4L count4L_3 (.clk(clk), .CE(CE_3), .LD(LD), .D(D[15:12]), .TC(TC_3), .Q(Q[15:12]));    
    
    
    assign TC = TC_0 & TC_1 & TC_2 & TC_3; 
endmodule
