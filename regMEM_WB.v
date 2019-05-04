`timescale 1ns / 1ps
//Pipeline register
module regW(clk,res_Win,A3Win,aluoutin,Datain,MemtoRegin,RegWritein,res_Wout,A3Wout,aluoutout,Dataout,MemtoRegout,RegWriteout,PCin,PCout);

input clk;

input[31:0] aluoutin,Datain,PCin;
input[1:0] res_Win;
input[4:0] A3Win;
input MemtoRegin,RegWritein;

output[31:0] aluoutout,Dataout,PCout;
output[1:0] res_Wout;
output[4:0] A3Wout;
output MemtoRegout,RegWriteout;

reg[31:0] aluoutout=0,Dataout=0,PCout=0;
reg[1:0] res_Wout=0;
reg[4:0] A3Wout=0;
reg MemtoRegout=0,RegWriteout=0;

always @ (posedge clk)
begin
   aluoutout<=aluoutin;
	Dataout<=Datain;
	res_Wout<=res_Win;
	A3Wout<=A3Win;
	MemtoRegout<=MemtoRegin;
	RegWriteout<=RegWritein;
	PCout<=PCin;
end

endmodule
