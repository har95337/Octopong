`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2017 09:17:40 PM
// Design Name: 
// Module Name: Ball
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


module Ball(
    input clk,
    input btnL,
    input [15:0] H,
    input [15:0] V,
    input frameEnd,
    input [15:0] paddleTop,
    input [15:0] paddleBot,
    output [3:0] vgaRed,
    output dead,
    output alive,
    output LoadBall
    );
    
    wire wait4,die,DownRight,DownLeft,UpRight,UpLeft,FlashBall;
    
    wire hitTop,hitBot,hitLeft,hitPaddle;
    
    wire idle;
    wire [15:0] xpos,ypos;
    
    wire SpawnBall,AliveBall;
    wire [3:0] random;
    wire second;
    wire [7:0] rnd;
    
    wire [3:0] red;
    
    wire [15:0] flashOut;
    
    
    
    Ball_Control ball (.clk(clk),
    .btnL(btnL),
    //.changeH(changeH),
    .wait4(wait4), 
   // .changeV(changeV),
    .hitBot(hitBot),
    .hitTop(hitTop),
    .hitLeft(hitLeft),
    .hitPaddle(hitPaddle),
    .die(die),
    .idle(idle),
    .LoadBall(LoadBall),
    .DownRight(DownRight),.DownLeft(DownLeft),.UpRight(UpRight),.UpLeft(UpLeft),.FlashBall(FlashBall),.SpawnBall(SpawnBall),.AliveBall(AliveBall));
    
    Turkey_Counter xchanger (.clk(clk),.CE(AliveBall & frameEnd),.up((DownRight | UpRight) & (~DownLeft | ~UpLeft)),.LD(idle),.D(16'd0), .out(xpos));
    
    Turkey_Counter ychanger (.clk(clk),.CE(AliveBall & frameEnd),.up((DownRight | DownLeft) & (~UpRight | ~UpLeft)),.LD(idle),.D(16'd0), .out(ypos));
    
    LFSR random1(.clk(clk),.out(rnd));
    
    count16L flash (.clk(clk),.CE(frameEnd & FlashBall),.LD(~FlashBall),.D(16'd0),.Q(flashOut));

    assign wait4 = (flashOut == 16'd240);
    
    assign second = flashOut[4];
    
    count4L randomstuff (.clk(clk),.CE(1'b0), .LD(btnL & idle), .D(rnd[3:0]), .Q(random));
    
    assign vgaRed = {4{ ((H > (16'd56 + xpos) & H < (16'd72 + xpos)) & ( (V > ( ypos + ((random[2:0] * 16'd64) + 16'd8)) & V < ( ypos + 16'd16 + ((random[2:0] * 16'd64) + 16'd8)) ) )) & (second | AliveBall) & ~idle }}; 

//    assign red = {4{ (((H > xpos) & (H < 16'd16 + xpos)) & ((V > ypos + (random * 16'd64) + 16'd8) & (V > ypos + 16'd16 + (random * 16'd64) + 16'd8)) & (second | AliveBall) & ~idle)}};
    
    assign hitBot = ((16'd16 + ypos + ((random[2:0] * 16'd64) + 16'd8)) >= 16'd472);
    assign hitTop = ((ypos + ((random[2:0] * 16'd64) + 16'd8)) <= 16'd7);
    assign hitPaddle = ((16'd72 + xpos) == 16'd601) & (ypos + 16'd16 + ((random[2:0] * 16'd64) + 16'd8) > paddleTop) & (ypos + ((random[2:0] * 16'd64) + 16'd8) < paddleBot);
    assign hitLeft = ((16'd56 + xpos) == 16'd8);
    assign die = (16'd72 + xpos) >= 16'd632;
    
    assign dead = die | idle;
    assign LoadBall = LoadBall;
    assign alive = AliveBall;
endmodule
