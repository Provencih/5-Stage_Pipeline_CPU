`timescale 1ns / 1ps
//Program counter
module pc(e,clk,reset,d,q);
input clk,reset,e;
input[31:0] d;
output[31:0] q;
reg[31:0] q=0;
always @ (posedge clk or negedge reset)
if(reset==0)
	q<=32'h00003000;
else if(e!=1)
	q<=d;

endmodule
