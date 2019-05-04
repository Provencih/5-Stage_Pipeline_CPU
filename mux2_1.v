`timescale 1ns / 1ps
//1-bit 2-to-1 multiplexer
module mux2_1(A,B,Z,s);
input A,B;
input s;
output Z;
assign Z=(s==0)?A:B;
endmodule
