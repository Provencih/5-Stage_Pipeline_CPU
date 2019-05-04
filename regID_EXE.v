`timescale 1ns / 1ps
//Pipeline register
module regE(clk,res_Ein,OPEin,A1Ein,A2Ein,A3Ein,V1Ein,V2Ein,IMMEin,ALUSrcin,MemtoRegin,MemWritein,alucin,RegWritein,FALUAEin,FALUBEin,add44in,MALUOUTin,
                res_Eout,OPEout,A1Eout,A2Eout,A3Eout,V1Eout,V2Eout,IMMEout,ALUSrcout,MemtoRegout,MemWriteout,alucout,RegWriteout,FALUAEout,FALUBEout,add44out,MALUOUTout,PCin,PCout);

input clk;

input[31:0] V1Ein,V2Ein,IMMEin,add44in,PCin;
input[1:0] res_Ein,FALUAEin,FALUBEin;
input[4:0] A1Ein,A2Ein,A3Ein;
input ALUSrcin,MemtoRegin,MemWritein,RegWritein,MALUOUTin;
input[2:0] alucin;
input[5:0] OPEin;

output[31:0] V1Eout,V2Eout,IMMEout,add44out,PCout;
output[1:0] res_Eout,FALUAEout,FALUBEout;
output[4:0] A1Eout,A2Eout,A3Eout;
output ALUSrcout,MemtoRegout,MemWriteout,RegWriteout,MALUOUTout;
output[2:0] alucout;
output[5:0] OPEout;

reg[31:0] V1Eout=0,V2Eout=0,IMMEout=0,add44out=0,PCout=0;
reg[1:0] res_Eout=0,FALUAEout=0,FALUBEout=0;
reg[4:0] A1Eout=0,A2Eout=0,A3Eout=0;
reg ALUSrcout=0,MemtoRegout=0,MemWriteout=0,RegWriteout=0,MALUOUTout;
reg[2:0] alucout=0;
reg[5:0] OPEout=0;

always @ (posedge clk)
begin
   res_Eout<=res_Ein;
	OPEout<=OPEin;
	V1Eout<=V1Ein;
	V2Eout<=V2Ein;
	IMMEout<=IMMEin;
	A1Eout<=A1Ein;
	A2Eout<=A2Ein;
	A3Eout<=A3Ein;
	ALUSrcout<=ALUSrcin;
	MemtoRegout<=MemtoRegin;
	MemWriteout<=MemWritein;
	alucout<=alucin;
	RegWriteout<=RegWritein;
	FALUAEout<=FALUAEin;
	FALUBEout<=FALUBEin;
	add44out<=add44in;
	MALUOUTout<=MALUOUTin;
	PCout<=PCin;
end
	
endmodule
