`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2017 12:37:06 PM
// Design Name: 
// Module Name: count16_up_down
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


module count16_up_down(
    input up,
    input clk,
    input CE,
    input LD,
    input [15:0] D,
    output [15:0] out,
    output Z,
    output TC
    );
    
    wire CE2;
    wire TC_0, TC_1, Z_0, Z_1;
    
    Turkey_Counter count1 (.clk(clk),.up(up),.CE(CE), .D(D[15:8]) , .LD(LD), .Z(Z_0), .TC(TC_0), .out(out[15:8]));
    assign CE2 = (TC_0 & CE) | (Z_0 & CE);
    Turkey_Counter count2 (.clk(clk),.up(up),.CE(CE2), .D(D[7:0]) , .LD(LD), .Z(Z_1),.TC(TC_1),.out(out[7:0]));
    
    assign TC = TC_0 & TC_1;
    assign Z = Z_0 & Z_1;
endmodule
