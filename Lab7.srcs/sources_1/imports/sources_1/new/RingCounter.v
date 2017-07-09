`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 03:05:13 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input clk,
    input digsel,
    output [3:0] o
    );
    
    FDRE #(.INIT(1'b1)) ff_instance_1095 (.C(clk),.CE(digsel), .D(o[3]), .Q(o[0]));
    
    FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk),.CE(digsel), .D(o[0]), .Q(o[1]));
    
    FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk),.CE(digsel), .D(o[1]), .Q(o[2]));
    
    FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk),.CE(digsel), .D(o[2]), .Q(o[3]));

endmodule
