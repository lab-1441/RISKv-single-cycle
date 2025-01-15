`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/15 15:45:36
// Design Name: 
// Module Name: test_ALU
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


module test_ALU;

    wire [31:0] OUT;
    reg [31:0] IN1;
    reg [31:0] IN2;
    reg [2:0] s;
    
    ALU ALU1(.OUT(OUT), .IN1(IN1), .IN2(IN2), .s(s));
    
    initial begin
    IN1=32'b0; IN2=32'b0; s=3'b000;
    #10; IN1=32'd12; IN2=32'd16; s=3'b000;
    #10; IN1=32'd12; IN2=32'd16; s=3'b001;
    #10; IN1=32'b010; IN2=32'b011; s=3'b010;
    #10; s=3'b011;
    #10; IN1=32'd12; IN2=32'd16; s=3'b101;
    #10; $finish;
    end
    
endmodule
