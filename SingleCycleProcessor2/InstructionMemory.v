`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/22 11:03:01
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(PC,Instr);
input [31:0] PC;
output [31:0] Instr;
reg [31:0] mem [0:7];

initial begin
    $readmemb("mem2.mem", mem); // Load from  file
end    
    
    assign Instr = mem[PC[7:0]];
endmodule
