`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/19 21:21:41
// Design Name: 
// Module Name: ImmExt
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


module ImmExt(
    Instr, ImmSrc,
    ImmExt
    );
    input [31:7] Instr;
    input [2:0] ImmSrc;
    output reg [31:0] ImmExt;
    
    always @(Instr,ImmSrc) begin
        case (ImmSrc)      
        3'b000: ImmExt <= {{20{Instr[31]}},Instr[31:20]};
        3'b001: ImmExt <= {{20{Instr[31]}},Instr[31:25],Instr[11:7]};
        3'b010: ImmExt <= {{19{Instr[31]}},Instr[31],Instr[7],Instr[30:25],Instr[11:8],1'b0};
        3'b011: ImmExt <= {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0};
        //lui 연산을 위한 immextension. 3'b100: addi의 msb가 0, 3'b101: addi의 msb가 1
        3'b100: ImmExt <= {Instr[31:12],12'b0};
        default: ImmExt <= 32'b0;
        endcase
    end
endmodule
