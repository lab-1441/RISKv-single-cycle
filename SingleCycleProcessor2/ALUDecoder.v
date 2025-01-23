`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/20 17:48:04
// Design Name: 
// Module Name: ALUDecoder
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


module ALUDecoder(
ALUOp, funct3,funct7,
ALUControl
    );
    input [1:0] ALUOp;
    input [2:0] funct3;
    input [6:0] funct7;
    output reg [2:0] ALUControl;
    
    
    parameter r  = 2'b10;
    parameter I  = 2'b10;
    parameter s  = 2'b00;
    parameter b  = 2'b01;
    
    
    always @(ALUOp,funct3,funct7)begin
    case(ALUOp)
        r,I: ALUControl = (funct3 == 111) ? 010 : (funct3 == 110) ? 011 : (funct3 == 100) ? 110 : (funct3 == 010)? 101 : (funct3 == 000) ? ((funct7[5] == 1)? 001:000): 000;
        s: ALUControl = 000;
        b: ALUControl = 001;
    endcase    
    end
endmodule
