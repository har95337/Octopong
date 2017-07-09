`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2017 07:38:57 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input a,
    input b,
    input cin,
    input e,
    output cout,
    output s
    );
    
    wire [3:0] inputs1;
    wire [1:0] sel1;
    wire [3:0] inputs2;
    wire [1:0] sel2;
    
    assign inputs1 = {1'b1,cin,cin,1'b0};
    assign sel1 = {a,b};
    m4_1e mux1 ( .in(inputs1), .sel(sel1), .e(1'b1), .o(cout));
    
    assign inputs2 = {cin,~cin,~cin,cin};
    assign sel2 = {a,b};
    m4_1e mux2 ( .in(inputs2), .sel(sel2), .e(1'b1), .o(s));

endmodule
