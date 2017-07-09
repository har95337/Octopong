`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 05:22:34 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
    input clkin,
    input btnL,
    input btnD,
    input btnU,
    input btnR,
    input [15:0] sw,
    output [3:0] an,
    output [3:0] vgaBlue,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [6:0] seg,
    output [15:0] led,
    output VSync,
    output HSync,
    output dp
    );
    wire clk, digsel;
    wire [15:0] H,V;
    wire frameEnd;
    wire [3:0] red;
    wire [3:0] red0;
    wire [3:0] red1;
    wire [3:0] red2;
    wire [3:0] red3;
    wire [3:0] red4;
    wire [3:0] red5;
    wire [3:0] red6;
    wire [3:0] red7;
    wire [7:0] dead;
    wire [15:0] paddleTop,paddleBot;
    wire [15:0] turkOut;
    lab7_clks not_so_slow (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));
    wire [7:0] balls;
    wire [7:0] LoadBall;
    wire [3:0] ring_out;
    wire [15:0] select_in;
    wire [3:0] hex7in;
    wire [15:0] timeCount,timeCount2;
    wire [7:0] alive;
    wire on;
    wire second;
    
    assign vgaRed = red0 | red1 | red2 | red3 | red4 | red5 | red6 | red7;
    
    VGA_Controller VGA (.clk(clk),.vgaBlue(vgaBlue),.HSync(HSync),.VSync(VSync), .H(H),.V(V),.frameEnd(frameEnd));
    Paddle paddleControl (.clk(clk), .vgaGreen(vgaGreen), .sw(sw), .btnU(btnU), .btnD(btnD), .H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot));
    
    EdgeDetector edger(.clk(clk),.btnC(btnL),.out(btn_L));
    
    
    Ball baller0(.clk(clk),.btnL(btn_L & dead[0]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red0) ,.dead(dead[0]), .LoadBall(LoadBall[0]) ,.alive(alive[0]));
    Ball baller1(.clk(clk),.btnL(btn_L & ~dead[0] & dead[1]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red1),.dead(dead[1]), .LoadBall(LoadBall[1]),.alive(alive[1]));
    Ball baller2(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & dead[2]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red2),.dead(dead[2]),  .LoadBall(LoadBall[2]),.alive(alive[2]));
    Ball baller3(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & ~dead[2] & dead[3]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red3),.dead(dead[3]),  .LoadBall(LoadBall[3]),.alive(alive[3]));
    Ball baller4(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & ~dead[2] & ~dead[3] & dead[4]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red4),.dead(dead[4]),  .LoadBall(LoadBall[4]),.alive(alive[4]));
    Ball baller5(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & ~dead[2] & ~dead[3] & ~dead[4] & dead[5]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red5),.dead(dead[5]),  .LoadBall(LoadBall[5]),.alive(alive[5]));
    Ball baller6(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & ~dead[2] & ~dead[3] & ~dead[4] & ~dead[5] & dead[6]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red6),.dead(dead[6]),  .LoadBall(LoadBall[6]),.alive(alive[6]));
    Ball baller7(.clk(clk),.btnL(btn_L & ~dead[0] & ~dead[1] & ~dead[2] & ~dead[3] & ~dead[4] & ~dead[5] & ~dead[6] & dead[7]),.H(H),.V(V),.frameEnd(frameEnd),.paddleTop(paddleTop),.paddleBot(paddleBot),.vgaRed(red7),.dead(dead[7]),  .LoadBall(LoadBall[7]),.alive(alive[7]));
    
    assign on = (alive[7] & alive[6] & alive[5] & alive[4] & alive[3] & alive[2] & alive[1] & alive[0]);
    assign dp = 1'b1;
    
    assign an[0] = ~ring_out[0];
    assign an[1] = ~ring_out[1];
    assign an[2] = 1'b1;
    assign an[3] = ~ring_out[3];
    
    assign select_in = {turkOut[3:0],{4{1'b0}},timeCount[13:6]};
    
    count16L timer (.clk(clk),.CE(frameEnd & on),.D(16'd0), .LD(~on), .Q(timeCount));
    
    Turkey_Counter turkCounter(.clk(clk),.CE(((btn_L  & (turkOut <= 16'd7)) | (LoadBall[0] | LoadBall[1] | LoadBall[2] | LoadBall[3] | LoadBall[4] | LoadBall[5] | LoadBall[6] | LoadBall[7]))),.up(btn_L), .out(turkOut));
    
    RingCounter ringer(.clk(clk),.digsel(digsel),.o(ring_out));
    
    selector select (.sel(ring_out),.N(select_in),.H(hex7in));
    
    hex7seg display (.n(hex7in),.e(1'b1),.seg(seg));
endmodule
