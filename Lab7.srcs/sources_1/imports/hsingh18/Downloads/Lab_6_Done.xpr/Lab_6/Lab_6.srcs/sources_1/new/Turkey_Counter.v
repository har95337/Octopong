`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2017 05:44:00 PM
// Design Name: 
// Module Name: Turkey_Counter
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


module Turkey_Counter(
    input up,
    input clk,
    input CE,
    input LD,
    input [15:0] D,
    output [15:0] out,
    output Z,
    output TC
    );
    wire [15:0] carryUp,carryDown,addOut;
    
    count16L timeUp(.CE(CE & up), .clk(clk), .LD(LD), .D(D) ,.Q(carryUp));
    DownCounter timeDown(.CE(CE & ~up), .clk(clk), .LD(LD),.D(16'd0), .Q(carryDown));
    eight_bit_adder adder(.a(carryUp),.b(carryDown),.cin(1'b0),.s(out));
    
    assign Z = (~&out[15:0]);
    assign TC = (&out[15:0]);
 
endmodule
