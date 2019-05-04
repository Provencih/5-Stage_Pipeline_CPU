`timescale 1ns / 1ps
//Pipeline register
module regD(stall,clk,PCADD4in,OPin,FUNCTin,A1in,A2in,RDin,IMMin,ADin,PCADD4out,OPout,FUNCTout,A1out,A2out,RDout,IMMout,ADout,PCin,PCout);

input[5:0] OPin,FUNCTin;
input[4:0] A1in,A2in,RDin;
input[15:0] IMMin;
input[25:0] ADin;
input[31:0] PCADD4in,PCin;
input clk,stall;

output[5:0] OPout,FUNCTout;
output[4:0] A1out,A2out,RDout;
output[15:0] IMMout;
output[25:0] ADout;
output[31:0] PCADD4out,PCout;

reg[5:0] OPout=0,FUNCTout=0;
reg[4:0] A1out=0,A2out=0,RDout=0;
reg[15:0] IMMout=0;
reg[25:0] ADout=0;
reg[31:0] PCADD4out=0,PCout=0;

always @ (posedge clk)   
if(stall==0)
begin
	OPout<=OPin;
	PCADD4out<=PCADD4in;
	FUNCTout<=FUNCTin;
	A1out<=A1in;
	A2out<=A2in;
	RDout<=RDin;
	IMMout<=IMMin;
	ADout<=ADin;
	PCout<=PCin;
end
else if(stall==1)
begin
end

endmodule
