`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 03:21:38 PM
// Design Name: 
// Module Name: EdgeDetector
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


module EdgeDetector(
    input btnC,
    input clk,
    output out
    );
    wire t0,t1;
    FDRE #(.INIT(1'b0) ) ff_instance_1095 (.C(clk),.CE(1'b1), .D(btnC), .Q(t1));
    FDRE #(.INIT(1'b0) ) ff_instance_1096 (.C(clk),.CE(1'b1), .D(t1), .Q(t0));
    
    assign out = ~t0 & t1;

endmodule
