`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2017 02:43:02 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input clk,
    output [7:0] out
    );
    
    wire [7:0] rnd;
    wire first;
    
    assign first = rnd[0] ^ rnd[5] ^ rnd[6] ^ rnd[7];
    
     FDRE #(.INIT(1'b1) ) RND0 (.C(clk), .CE(1'b1), .D(first), .Q(rnd[0]));
     FDRE #(.INIT(1'b0) ) RND1 (.C(clk), .CE(1'b1), .D(rnd[0]), .Q(rnd[1]));
     FDRE #(.INIT(1'b0) ) RND2 (.C(clk), .CE(1'b1), .D(rnd[1]), .Q(rnd[2]));
     FDRE #(.INIT(1'b0) ) RND3 (.C(clk), .CE(1'b1), .D(rnd[2]), .Q(rnd[3]));
     FDRE #(.INIT(1'b0) ) RND4 (.C(clk), .CE(1'b1), .D(rnd[3]), .Q(rnd[4]));
     FDRE #(.INIT(1'b0) ) RND5 (.C(clk), .CE(1'b1), .D(rnd[4]), .Q(rnd[5]));
     FDRE #(.INIT(1'b0) ) RND6 (.C(clk), .CE(1'b1), .D(rnd[5]), .Q(rnd[6]));
     FDRE #(.INIT(1'b0) ) RND7 (.C(clk), .CE(1'b1), .D(rnd[6]), .Q(rnd[7]));
     
     assign out = rnd;
endmodule
