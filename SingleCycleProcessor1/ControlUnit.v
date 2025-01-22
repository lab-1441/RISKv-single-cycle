`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/19 22:47:04
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  사용하는 instruction을 제한하여 몇가지 instruction만 동작하도록 해야겠다.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    op,funct3,funct7,Zero,
    PCSrc,ResultSrc,MemWrite,ALUControl, ALUSrc,ImmSrc,RegWrite
    );
    input [6:0] op;
    input [2:0] funct3;
    input [6:0] funct7;
    input Zero;
    output reg PCSrc,MemWrite,ALUSrc,RegWrite;
    output reg [2:0] ALUControl,ImmSrc;
    output reg [1:0] ResultSrc;
    
    wire Jump,Branch,wirel;
    wire [1:0] ALUOp;
    
    
    
    MainDecoder maindecoder(.op(op),
 .Branch(Branch), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .ALUOp(ALUOp), .Jump(Jump));
    ALUDecoder aludecoder(.ALUOp(ALUOp), .funct3(funct3),.funct7(funct7),.ALUControl(ALUControl));
    assign wire1 = Zero & Branch;
    assign PCSrc = wire1 | Jump;
endmodule
