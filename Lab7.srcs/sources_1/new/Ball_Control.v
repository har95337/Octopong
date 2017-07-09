`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2017 06:42:22 PM
// Design Name: 
// Module Name: Ball_Control
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


module Ball_Control(
    input clk,
    input btnL,
    input wait4,
//    input changeH,
//    input changeV,
    input hitPaddle,
    input hitLeft,
    input hitBot,
    input hitTop,
    input die,
    output DownRight,
    output DownLeft,
    output UpRight,
    output UpLeft,
    output FlashBall,
    output SpawnBall,
    output AliveBall,
    output idle,
    output LoadBall
    );
    
    wire [6:0] NS,PS;
    wire left,right;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(NS[0]), .Q(PS[0]));
    FDRE #(.INIT(1'b0)) Q123_FF [6:1] (.C({6{clk}}), .CE({6{1'b1}}), .D(NS[6:1]), .Q(PS[6:1]));
    
    FDRE #(.INIT(1'b0)) LEFTSYNCHRO (.C(clk), .CE(1'b1), .D(btnL), .Q(left));
    
    assign NS[0] = (PS[0] & ~left) | (PS[6] & wait4); // Init
    assign NS[1] = (PS[0] & left)  | (PS[1] & ~wait4); // SpawnBall
    assign NS[2] = (PS[1] & wait4) | (PS[2] & ~hitBot & ~hitPaddle & ~die) | (PS[3] & hitLeft) | (PS[4] & hitTop); // DownRight
    assign NS[3] = (PS[3] & ~hitLeft & ~hitBot) | (PS[2] & hitPaddle) | (PS[5] & hitTop); // DownLeft
    assign NS[4] = (PS[4] & ~hitTop & ~hitPaddle & ~die) | (PS[2] & hitBot) | (PS[5] & hitLeft); // UpRight
    assign NS[5] = (PS[5] & ~hitTop & ~hitLeft) | (PS[3] & hitBot) | (PS[4] & hitPaddle); // UpLeft
    assign NS[6] = ((PS[2] | PS[4]) & die) | (PS[6] & ~wait4); // Die
    
    assign idle = PS[0];
    assign DownRight = PS[2];
    assign DownLeft = PS[3];
    assign UpRight = PS[4];
    assign UpLeft = PS[5];
    assign SpawnBall = (PS[0] & left);
    assign AliveBall = PS[2] | PS[3] | PS[4] | PS[5];
    assign FlashBall = PS[1] | PS[6];
    assign LoadBall = (PS[6] & wait4);
endmodule
