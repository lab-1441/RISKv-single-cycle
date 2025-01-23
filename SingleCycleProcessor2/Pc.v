`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/19 22:33:57
// Design Name: 
// Module Name: Pc
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


module Pc(
    PCNext, CLK,
    PC
    );
    input [31:0] PCNext;
    input CLK;
    
    output reg [31:0] PC;
    
    always @(posedge CLK) begin
        PC <= PCNext;
    end
endmodule
