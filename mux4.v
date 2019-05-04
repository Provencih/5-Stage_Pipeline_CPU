`timescale 1ns / 1ps
//32-bit 4-to-1 multiplexer
module mux4(A,B,C,D,Z,s);

input[31:0] A,B,C,D;
input[1:0] s;

output[31:0] Z;

reg[31:0] Z=0;

always @ (A,B,C,D,s)
case(s)
2'b00:Z<=A;
2'b01:Z<=B;
2'b10:Z<=C;
2'b11:Z<=D;
endcase


endmodule

