`timescale 1ns / 1ps
//Pipeline register
module regM(clk,res_Min,A3Min,V2Min,MemtoRegin,MemWritein,aluoutin,RegWritein,
                res_Mout,A3Mout,V2Mout,MemtoRegout,MemWriteout,aluoutout,RegWriteout,PCin,PCout);

input clk;
input[1:0] res_Min;
input[4:0] A3Min;
input[31:0] V2Min,aluoutin,PCin;
input MemtoRegin,MemWritein,RegWritein;

output[1:0] res_Mout;
output[4:0] A3Mout;
output[31:0] V2Mout,aluoutout,PCout;
output MemtoRegout,MemWriteout,RegWriteout;

reg[1:0] res_Mout=0;
reg[4:0] A3Mout=0;
reg[31:0] V2Mout=0,aluoutout=0,PCout=0;
reg MemtoRegout=0,MemWriteout=0,RegWriteout=0;

always @ (posedge clk)
begin
   res_Mout<=res_Min;
	A3Mout<=A3Min;
	V2Mout<=V2Min;
	aluoutout<=aluoutin;
	MemtoRegout<=MemtoRegin;
	MemWriteout<=MemWritein;
	RegWriteout<=RegWritein;
	PCout<=PCin;
end

endmodule
