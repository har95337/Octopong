`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2017 07:19:13 PM
// Design Name: 
// Module Name: SignChanger
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


module SignChanger(
    input sign,
    input [15:0] b,
    output [15:0] d
    );
    wire [15:0] o;
    eight_bit_adder converter (.cin(1'b0), .a(~b) , .b({{15{1'b0}}, 1'b1}), .s(o));
    m2_1x8 chooser (.sel(sign),.in0(b),.in1(o),.o(d));
endmodule
