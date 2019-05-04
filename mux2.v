`timescale 1ns / 1ps
//32-bit 2-to-1 multiplexer
module mux2(A,B,Z,s);
input[31:0] A,B;
input s;
output[31:0] Z;
assign Z=(s==0)?A:B;
endmodule
