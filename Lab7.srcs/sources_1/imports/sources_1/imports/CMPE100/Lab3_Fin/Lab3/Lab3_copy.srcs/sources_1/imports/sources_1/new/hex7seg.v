`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2017 07:46:44 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    input e,
    output [6:0] seg
    );
    
    //m8_1e a (.in({n[0],1'b0,~n[0],1'b0,1'b0,n[0],n[0],1'b0}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e b (.in({1'b0,1'b0,n[0],~n[0],1'b0,n[0],~n[0],1'b1}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e c (.in({1'b0,~n[0],1'b0,1'b0,1'b0,1'b0,~n[0],1'b1}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e d (.in({n[0],1'b0,~n[0],n[0],~n[0],n[0],1'b0,n[0]}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e e (.in({n[0],n[0],1'b1,n[0],n[0],1'b0,1'b0,1'b0}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e f (.in({n[0],1'b1,1'b0,n[0],1'b0,1'b0,n[0],1'b0}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    //m8_1e g (.in({1'b1,1'b0,1'b0,n[0],1'b0,1'b0,~n[0],1'b0}),.sel({n[3],n[2],n[1]}),.e(ble),.o(seg[0]));
    
    m8_1e a1 (.in({1'b0,n[0],n[0],1'b0,1'b0,~n[0],1'b0,n[0]}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[0]));
    m8_1e b2 (.in({1'b1,~n[0],n[0],1'b0,~n[0],n[0],1'b0,1'b0}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[1]));
    m8_1e c3 (.in({1'b1,~n[0],1'b0,1'b0,1'b0,1'b0,~n[0],1'b0}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[2]));
    m8_1e d4 (.in({n[0],1'b0,~n[0],n[0],n[0],~n[0],1'b0,n[0]}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[3]));
    m8_1e e5 (.in({1'b0,1'b0,1'b0,n[0],n[0],1'b1,n[0],n[0]}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[4]));
    m8_1e f6 (.in({1'b0,n[0],1'b0,1'b0,n[0],1'b0,1'b1,n[0]}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[5]));
    m8_1e g7 (.in({1'b0,~n[0],1'b0,1'b0,n[0],1'b0,1'b0,1'b1}),.sel({n[3],n[2],n[1]}),.e(e),.o(seg[6]));
endmodule
