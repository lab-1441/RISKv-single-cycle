`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/17 16:37:03
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
read_reg1, read_reg2,write_reg, write_data, write_enable, CLK,
RD1, RD2
    );
    input [4:0] read_reg1,read_reg2,write_reg; // Register file의 address
    input [31:0] write_data;     // RF에 새로 작성할 data
    input write_enable;       // Register write enabele signal
    input CLK;
    output reg [31:0] RD1, RD2;// output data1,2
    
    reg [31:0] rf[0:31];   // 32개의 32bit data
                           
    
    //읽기
    always @(read_reg1,read_reg2)begin
        RD1 <= rf[read_reg1];
        RD2 <= rf[read_reg2];
    end
    
    //쓰기
    always @(negedge CLK) begin
        rf[write_reg] <= (write_enable) ? write_data : rf[write_reg];     
    end
    
endmodule
