`timescale 1ns / 1ps
//5-bit 2-to-1 multiplexer
module mux_2_5(A,B,Z,s);
input[4:0] A,B;
input s;
output[4:0] Z;
assign Z=(s==0)?A:B;
endmodule