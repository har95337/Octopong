`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2017 06:59:58 PM
// Design Name: 
// Module Name: eight_bit_adder
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



module eight_bit_adder(
    input cin,
//    input a0,a1,a2,a3,a4,a5,a6,a7,
//    input b0,b1,b2,b3,b4,b5,b6,b7,
//    output s0,s1,s2,s3,s4,s5,s6,s7
    input [15:0] a,
    input [15:0] b,
    output [15:0] s
    );
    wire t0,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,ground;
    FullAdder add1 (.a(a[0]), .b(b[0]), .cin(cin), .cout(t0), .s(s[0]),.e(1'b1));
    FullAdder add2 (.a(a[1]), .b(b[1]), .cin(t0), .cout(t2), .s(s[1]),.e(1'b1));
    FullAdder add3 (.a(a[2]), .b(b[2]), .cin(t2), .cout(t3), .s(s[2]),.e(1'b1));
    FullAdder add4 (.a(a[3]), .b(b[3]), .cin(t3), .cout(t4), .s(s[3]),.e(1'b1));
    FullAdder add5 (.a(a[4]), .b(b[4]), .cin(t4), .cout(t5), .s(s[4]),.e(1'b1));
    FullAdder add6 (.a(a[5]), .b(b[5]), .cin(t5), .cout(t6), .s(s[5]),.e(1'b1));
    FullAdder add7 (.a(a[6]), .b(b[6]), .cin(t6), .cout(t7), .s(s[6]),.e(1'b1));
    FullAdder add8 (.a(a[7]), .b(b[7]), .cin(t7), .cout(t8), .s(s[7]),.e(1'b1));
    FullAdder add9 (.a(a[8]), .b(b[8]), .cin(t8), .cout(t9), .s(s[8]),.e(1'b1));
    FullAdder add10 (.a(a[9]), .b(b[9]), .cin(t9), .cout(t10), .s(s[9]),.e(1'b1));
    FullAdder add11 (.a(a[10]), .b(b[10]), .cin(t10), .cout(t11), .s(s[10]),.e(1'b1));
    FullAdder add12 (.a(a[11]), .b(b[11]), .cin(t11), .cout(t12), .s(s[11]),.e(1'b1));
    FullAdder add13 (.a(a[12]), .b(b[12]), .cin(t12), .cout(t13), .s(s[12]),.e(1'b1));
    FullAdder add14 (.a(a[13]), .b(b[13]), .cin(t13), .cout(t14), .s(s[13]),.e(1'b1));
    FullAdder add15 (.a(a[14]), .b(b[14]), .cin(t14), .cout(t15), .s(s[14]),.e(1'b1));
    FullAdder add16 (.a(a[15]), .b(b[15]), .cin(t15), .cout(ground), .s(s[15]),.e(1'b1));
endmodule
