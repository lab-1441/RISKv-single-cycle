`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/22 11:30:19
// Design Name: 
// Module Name: Top
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


module Top(input CLK);

wire [31:0] PCNext, PC, PCPlus4,PCTarget;
wire PCSrc;

assign PCNext = PCSrc ? PCTarget:PCPlus4;
Pc pc(.PCNext(PCNext), .CLK(CLK), .PC(PC));
PCPlus4 pcplus4(.PC(PC), .PCPlus4(PCPlus4));


wire [31:0] Instr;

InstructionMemory instructionmemory(.PC(PC), .Instr(Instr));

wire Zero, MemWrite, ALUSrc,RegWrite;
wire [2:0] ALUControl,ImmSrc;
wire [1:0] ResultSrc;
wire [31:0] ImmExt, Result, Src1, RD2;
ControlUnit controlunit (
    .op(Instr[6:0]), .funct3(Instr[14:12]), .funct7(Instr[31:25]), .Zero(Zero),
    .PCSrc(PCSrc), .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUControl(ALUControl),  .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite));
ImmExt immext(.Instr(Instr), .ImmSrc(ImmSrc), .ImmExt(ImmExt));
RegisterFile registerfile (
.read_reg1(Instr[19:15]), .read_reg2(Instr[24:20]), .write_reg(Instr[11:7]), .write_data(Result), .write_enable(RegWrite), .CLK(CLK),
.RD1(Src1), .RD2(RD2)
);

wire [31:0] Src2, ALUResult;

assign Src2 = (ALUSrc) ? ImmExt: RD2;

ALU alu( .IN1(Src1), .IN2(Src2), .s(ALUControl), .OUT(ALUResult), .Zero(Zero));
PcTarget pctarget(.PC(PC), .ImmExt(ImmExt), .PCTarget(PCTarget));

wire [31:0] ReadData;
DataMem datamem(.ALUResult(ALUResult),.WriteData(RD2),.CLK(CLK),.MemWrite(MemWrite),.ReadData(ReadData));

assign Result = (ResultSrc[1]) ? (ResultSrc[0]? ImmExt:PCPlus4):(ResultSrc[0]? ReadData:ALUResult);
endmodule
