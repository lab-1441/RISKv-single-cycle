module MainDecoder
(
 op,
 Branch,ResultSrc,MemWrite, ALUSrc,ImmSrc,RegWrite, ALUOp, Jump
);
    input [6:0]op;
    output reg Branch,MemWrite,ALUSrc,RegWrite,Jump;
    output reg [1:0] ALUOp,ResultSrc;
    output reg [2:0] ImmSrc;

    /*
    R type
    ex) add t1 t2 t3;
    사용 모듈: rf, alu
    
    */
    parameter r  = 7'b0110011;// 대표적인 instruction의 type opcode
    parameter I  = 7'b0010011;
    parameter lw = 7'b0000011;
    parameter s  = 7'b0100011;
    parameter b  = 7'b1100011;
    parameter u  = 7'b0110111;
    parameter j  = 7'b1101111;
    
    
    always @(op)begin
        case (op)
            r:begin
             RegWrite <= 1'b1;
             ImmSrc <= 3'b0xx;
             ALUSrc <= 1'b0;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b01;
             Branch <= 1'b0;
             ALUOp <= 2'b10;
             Jump <= 1'b0;
            end
            I: begin
             RegWrite <= 1'b1;
             ImmSrc <= 3'b000;
             ALUSrc <= 1'b1;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b01;
             Branch <= 1'b0;
             ALUOp <= 2'b10;
             Jump <= 1'b0;
            end
            lw: begin
             RegWrite <= 1'b1;
             ImmSrc <= 3'b000;
             ALUSrc <= 1'b1;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b10;
             Branch <= 1'b0;
             ALUOp <= 2'b00;
             Jump <= 1'b0;
            end
            s: begin
             RegWrite <= 1'b0;
             ImmSrc <= 3'b001;
             ALUSrc <= 1'b1;
             MemWrite <= 1'b1;
             ResultSrc <= 2'bxx;
             Branch <= 1'b0;
             ALUOp <= 2'b00;
             Jump <= 1'b0;
            end
            b: begin
             RegWrite <= 1'b0;
             ImmSrc <= 3'b010;
             ALUSrc <= 1'b1;
             MemWrite <= 1'b0;
             ResultSrc <= 2'bxx;
             Branch <= 1'b1;
             ALUOp <= 2'b00;
             Jump <= 1'b0;
            end
            // assembly 개발자는 lui의 특성을 고려하여 코드를 작성한다.(assembly 단계에서 1을 더한다.)
            // verilog에서는 이러한 lui의 특성을 고려할 필요 없다.
            //lui x1 constant = zero + Immext
            u: begin
             RegWrite <= 1'b1;
             ImmSrc <= 3'b100;
             ALUSrc <= 1'bx;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b11;
             Branch <= 1'b0;
             ALUOp <= 2'bxx;
             Jump <= 1'b0;
            end
            j: begin
             RegWrite <= 1'b1;
             ImmSrc <= 3'b011;
             ALUSrc <= 1'bx;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b10;
             Branch <= 1'b0;
             ALUOp <= 2'bxx;
             Jump <= 1'b1;
            end
            default: begin
             RegWrite <= 1'b0;
             ImmSrc <= 3'b000;
             ALUSrc <= 1'b0;
             MemWrite <= 1'b0;
             ResultSrc <= 2'b00;
             Branch <= 1'b0;
             ALUOp <= 2'b00;
             Jump <= 1'b0;
            end
        endcase
    end
    
endmodule