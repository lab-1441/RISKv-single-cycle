`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/19 22:42:24
// Design Name: 
// Module Name: PcTarget
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


module PcTarget(
    PC, ImmExt,
    PCTarget
    );
    input [31:0] PC, ImmExt;
    output [31:0]PCTarget;
    
    assign PCTarget = PC + ImmExt;
endmodule
