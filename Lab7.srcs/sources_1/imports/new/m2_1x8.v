`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2017 06:19:18 PM
// Design Name: 
// Module Name: m2_1x8
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


module m2_1x8(
    input [15:0] in0,
    input [15:0] in1,
    input sel,
    output [15:0] o
    );
    wire [15:0] selc;
    assign selc = {16{sel}};
    assign o = ((in0 & ~selc) | (in1 & selc));
endmodule
