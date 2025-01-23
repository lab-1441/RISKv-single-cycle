`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/22 11:17:37
// Design Name: 
// Module Name: DataMem
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


module DataMem(ALUResult,WriteData,CLK,MemWrite,ReadData);
input [31:0] ALUResult,WriteData;
input CLK,MemWrite;
output [31:0] ReadData;

reg [31:0] mem [0:7];

    // Load memory content from an external file
initial begin
    $readmemb("mem1.mem", mem); // Load from  file
end
    
always @(negedge CLK) begin
    mem[ALUResult[7:0]] = MemWrite ? WriteData : mem[ALUResult[7:0]];
end
assign  ReadData = mem[ALUResult[7:0]];

endmodule
