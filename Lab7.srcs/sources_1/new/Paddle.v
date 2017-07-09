`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2017 03:45:42 PM
// Design Name: 
// Module Name: Paddle
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


module Paddle(
    input [15:0] sw,
    input clk,
    input btnU,
    input btnD,
    input [15:0] H,
    input [15:0] V,
    input frameEnd,
    output [3:0] vgaGreen,
//    output [3:0] paddlePos
    output [15:0] paddleTop,
    output [15:0] paddleBot
    );
    wire [15:0] up_down;
    //wire length;
    //wire width;
    wire [3:0] green;
    wire LD;
    
    FDRE #(.INIT(1'b1) ) ff_instance_1095 (.C(clk),.CE(1'b1), .D(1'b0), .Q(LD));
    FDRE #(.INIT(1'b0) ) ff_instance_1099 [3:0] (.C(clk),.CE(1'b1), .D(green), .Q(vgaGreen));
    
    Turkey_Counter updown (.clk(clk),.up(~btnU & btnD),.CE(~(btnU & btnD) & ((btnU & (16'd230 +  up_down * 16'd2) > (16'd9)) ^ (btnD & ((16'd230 + up_down * 16'd2) + 16'd16 * sw[15:11]) < (16'd472))) & frameEnd),.out(up_down)); // .D(16'd230), .LD(LD),
    
    assign green = {4{((H > 16'd600 &  H < 16'd609) & (V > (16'd230 + up_down * 16'd2) & V < ((16'd230 + up_down * 16'd2) + 16'd16 * sw[15:11])) )}};
    
    assign paddleTop = (16'd230 + up_down * 16'd2);
    
    assign paddleBot = ((16'd230 + up_down * 16'd2) + 16'd16 * sw[15:11]);
endmodule
