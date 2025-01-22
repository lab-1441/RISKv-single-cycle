module ALU ( IN1, IN2, s, OUT, Zero);
output reg Zero;
output reg [31:0] OUT;
input wire [31:0] IN1;
input wire [31:0] IN2;
input wire [2:0] s;

always @ (IN1 or IN2 or s)
begin
    case (s)
        3'b000: OUT=IN1+IN2;
        3'b001:begin OUT=IN1-IN2; Zero = (IN1 == IN2)? 1:0;end
        3'b010: OUT= IN1 & IN2;
        3'b011: OUT= IN1 | IN2;
        3'b101:
            if (IN1<IN2)
                OUT=32'b1;
            else
                OUT=32'b0;
       default: OUT=32'b0;
        3'b110: OUT = (IN1 == IN2) ? 32'b0 : 32'b1; //xor
    endcase
end

endmodule