`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2017 03:29:42 PM
// Design Name: 
// Module Name: count4L
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


module count4L(
    input clk,
    input CE,
    input LD,
    input [3:0] D,
    output [3:0] Q,
    output TC
    );
    
    wire Q_0,Q_1,Q_2,Q_3;
    wire t0,t1,t2;
    wire o0,o1,o2,o3;
    
    FullAdder add0(.a(Q[0]),.b(1'b1),.cin(1'b0),.cout(t0),.s(Q_0));
    m4_1e count0 (.in({D[0],D[0],Q_0,Q[0]}), .sel({LD,CE}),.e(1'b1),.o(o0));
    FDRE #(.INIT(1'b0) ) ff_instance_1095 (.C(clk),.CE(1'b1), .D(o0), .Q(Q[0]));
    
    FullAdder add1(.a(Q[1]),.b(1'b0),.cin(t0),.cout(t1),.s(Q_1));
    m4_1e count1 (.in({D[1],D[1],Q_1,Q[1]}), .sel({LD,CE}),.e(1'b1),.o(o1));
    FDRE #(.INIT(1'b0) ) ff_instance_1096 (.C(clk),.CE(1'b1), .D(o1), .Q(Q[1]));
    
    FullAdder add2(.a(Q[2]),.b(1'b0),.cin(t1),.cout(t2),.s(Q_2));
    m4_1e count2 (.in({D[2],D[2],Q_2,Q[2]}), .sel({LD,CE}),.e(1'b1),.o(o2));
    FDRE #(.INIT(1'b0) ) ff_instance_1097 (.C(clk),.CE(1'b1), .D(o2), .Q(Q[2]));
    
    FullAdder add3(.a(Q[3]),.b(1'b0),.cin(t2),.s(Q_3));
    m4_1e count3 (.in({D[3],D[3],Q_3,Q[3]}), .sel({LD,CE}),.e(1'b1),.o(o3));
    FDRE #(.INIT(1'b0) ) ff_instance_10978(.C(clk),.CE(1'b1), .D(o3), .Q(Q[3]));
    
    
    
    assign TC = Q[3] & Q[2] & Q[1] & Q[0];
endmodule
