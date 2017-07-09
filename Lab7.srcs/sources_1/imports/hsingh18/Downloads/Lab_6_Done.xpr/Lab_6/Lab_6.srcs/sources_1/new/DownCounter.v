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


module DownCounter(
    input CE,
    input LD,
    input [15:0] D,
    input clk,
    output TC,
    output [15:0] Q
    );
    
    wire CE_1;
    wire TC_0, TC_1;
    wire [15:0] holder1,holder2;
    
    SignChanger negChanger(.sign(1'b1),.b(D),.d(holder1));
    count16L counter (.clk(clk),.CE(CE),.LD(LD),.D(holder1),.TC(TC),.Q(holder2)); 
    SignChanger posChanger(.sign(1'b1),.b(holder2),.d(Q));
endmodule

