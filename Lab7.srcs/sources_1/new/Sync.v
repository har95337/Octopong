`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 02:37:39 PM
// Design Name: 
// Module Name: Sync
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


module VGA_Controller(
    input clk,
    output [15:0] H,
    output [15:0] V,
    output HSync,
    output VSync, // Frame Signal
    output [3:0] vgaBlue,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output frameEnd
    );
    wire long, tall, activeRegion;
    
    wire H_Holder, V_Holder;
    wire [3:0] blue,red,green;
    
    FDRE #(.INIT(1'b1) ) ff_instance_1095 (.C(clk),.CE(1'b1), .D(H_Holder), .Q(HSync));
    FDRE #(.INIT(1'b1) ) ff_instance_1096 (.C(clk),.CE(1'b1), .D(V_Holder), .Q(VSync));
    FDRE #(.INIT(1'b0) ) ff_instance_1097 [3:0] (.C(clk),.CE(1'b1), .D(blue), .Q(vgaBlue));
//    FDRE #(.INIT(1'b0) ) ff_instance_1098 [3:0] (.C(clk),.CE(1'b1), .D(red), .Q(vgaRed));
//    FDRE #(.INIT(1'b0) ) ff_instance_1099 [3:0] (.C(clk),.CE(1'b1), .D(green), .Q(vgaGreen));
    //wire [15:0] Q,V;
    assign long = (H == 16'd799);
    
    count16L Horz ( .clk(clk), .CE(1'b1), .D({16{1'b0}}), .LD(long), .Q(H));
    
    assign tall = (V == 16'd524) & long;
    
    count16L Vert (.clk(clk),.CE(long),.LD(tall),.D({16{1'b0}}),.Q(V));
    
    assign H_Holder = (H < 16'd655) | (H > 16'd750);
    
    assign V_Holder = (V < 16'd489) | (V > 16'd490);
    
    assign blue = {4{((V <= 16'd7) | ((V >= 16'd472)) | (H <= 16'd7) |((H >= 16'd632))) & activeRegion}};
    //assign green = {4{1'b0}};
    //assign red = {4{1'b0}};
    assign activeRegion = (H < 16'd640 & V < 16'd480);
    
    assign frameEnd = (H == 799) & (V == 524);
endmodule
