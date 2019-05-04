`timescale 1ns / 1ps
//This is the top file.
module mips(clk,reset,pc,inst,alu_out,dm_out/*,pcsel,npcctrl*/,sta,npc/*,bjnpc,alua,alub,fcmp1d,fcmp2d,faluae,falube,qad,qbd,
opd,a1d,a2d,a1e,a2e,a3e,a3m,a3w,regwritew*/,alu_c);
input clk,reset;

output[31:0] pc,inst,alu_out,dm_out,npc/*,bjnpc,alua,alub,qad,qbd,*/,alu_c;
output sta;
//output pcsel,regwritew;
//output[1:0] npcctrl,fcmp1d,fcmp2d,faluae,falube;
//output[5:0] opd;
//output[4:0] a1d,a2d,a1e,a2e,a3e,a3m,a3w;

wire[31:0] bjNPC,NPC,PC,PCD,PCE,PCM,PCW,ZmuxALUSrc,ZmuxMemtoReg,pc,inst,out,alu_out,dm_out,qa,qb,qaD,qbD,qaE,qbE,qaE1,qbE1,qbM,IMM32D,IMM32E,add4,add4D,add44,add44E,aluout0,aluout,aluoutM,aluoutW,dout,doutW;
wire[4:0] A1,A2,RD,A1D,A2D,RDD,A3d,A3D,A1E,A2E,A3E,A3M,A3W;
wire[5:0] OP,OPD,OPE,FUNCT,FUNCTD;
wire[15:0] IMM16,IMM16D;
wire[25:0] AD,ADD;
wire[2:0] aluc,alucE;
wire[1:0] NPCCtrl,FCMP1D,FCMP2D,FALUAE,FALUBE,FALUAEE,FALUBEE,res0,res_E,res_M,res_W;
wire stall;
parameter reg31=5'b11111;

   

   pc u_pc(.e(stall),.clk(clk),.reset(reset),.d(NPC),.q(PC));
   PCADD4 ADD4(.PC(PC),.PCADD4(add4));
   mux2 MPC(.A(add4),.B(bjNPC),.Z(NPC),.s(PCSel));
   im u_im(.addr(PC),.OP(OP),.FUNCT(FUNCT),.A1(A1),.A2(A2),.RD(RD),.IMM(IMM16),.AD(AD),.out(out));

regD regD(.stall(stall),.clk(clk),.PCADD4in(add4),.OPin(OP),.FUNCTin(FUNCT),.A1in(A1),.A2in(A2),.RDin(RD),.IMMin(IMM16),.ADin(AD),
          .PCADD4out(add4D),.OPout(OPD),.FUNCTout(FUNCTD),.A1out(A1D),.A2out(A2D),.RDout(RDD),.IMMout(IMM16D),.ADout(ADD),.PCin(PC),.PCout(PCD));

   res res(.OPD(OPD),.res(res0));
	HDU HDU(.opD(OPD),.A1D(A1D),.A2D(A2D),.A1E(A1E),.A2E(A2E),.A3E(A3E),.A3M(A3M),.A3W(A3W),.Stall(stall),.FCMP1D(FCMP1D),.FCMP2D(FCMP2D),.FALUAE(FALUAE),.FALUBE(FALUBE),.res0(res0),.res_E(res_E),.res_M(res_M),.res_W(res_W));
	npc u_npc(.PCADD4(add4D),.Offset(IMM16D),.Address(ADD/*’‚¿ÔADD «D∂ŒAD*/),.NPCCtrl(NPCCtrl),.bjNPC(bjNPC),.V1(qaD),.V2(qbD),.PCSel(PCSel));
   ctrl u_ctrl(.e(stall),.op(OPD),.funct(FUNCTD),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.RegDst(RegDst),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.NPCCtrl(NPCCtrl),.ExtOp(ExtOp),.aluc(aluc),.MA3D(MA3D),.MALUOUT(MALUOUT));
   rf u_rf(.clk(clk),.we(RegWriteW),.ra(A1D),.rb(A2D),.rw(A3W),.rd(ZmuxMemtoReg),.qa(qa),.qb(qb),.reset(reset),.PCin(PCW));
	mux_2_5 u_muxRegDst(.A(A2D),.B(RDD),.Z(A3d),.s(RegDst));
   extender u_extender(.IMM16(IMM16D),.IMM32(IMM32D),.sign(ExtOp));
	PCADD4 ADD44(.PC(add4D),.PCADD4(add44));
	mux_2_5 MuxA3D(.A(A3d),.B(reg31),.Z(A3D),.s(MA3D));
	mux4 MFCMP1D(.A(qa),.B(doutW),.C(aluoutW),.D(aluoutM),.Z(qaD),.s(FCMP1D));
	mux4 MFCMP2D(.A(qb),.B(doutW),.C(aluoutW),.D(aluoutM),.Z(qbD),.s(FCMP2D));

regE regE(.clk(clk),.res_Ein(res0),.OPEin(OPD),.A1Ein(A1D),.A2Ein(A2D),.A3Ein(A3D),.V1Ein(qa),.V2Ein(qb),.IMMEin(IMM32D),.ALUSrcin(ALUSrc),.MemtoRegin(MemtoReg),.MemWritein(MemWrite),.alucin(aluc),.RegWritein(RegWrite),.FALUAEin(FALUAE),.FALUBEin(FALUBE),.add44in(add44),.MALUOUTin(MALUOUT),
			           .res_Eout(res_E),.OPEout(OPE),.A1Eout(A1E),.A2Eout(A2E),.A3Eout(A3E),.V1Eout(qaE),.V2Eout(qbE),.IMMEout(IMM32E),.ALUSrcout(ALUSrcE),.MemtoRegout(MemtoRegE),.MemWriteout(MemWriteE),.alucout(alucE),.RegWriteout(RegWriteE),.FALUAEout(FALUAEE),.FALUBEout(FALUBEE),.add44out(add44E),.MALUOUTout(MALUOUTE),.PCin(PCD),.PCout(PCE));

	mux4 MFALUAE(.A(qaE),.B(doutW),.C(aluoutW),.D(aluoutM),.Z(qaE1),.s(FALUAEE));
	mux4 MFALUBE(.A(qbE),.B(doutW),.C(aluoutW),.D(aluoutM),.Z(qbE1),.s(FALUBEE));
	mux2 u_muxALUSrc(.A(qbE1),.B(IMM32E),.Z(ZmuxALUSrc),.s(ALUSrcE));
	ALU u_ALU(.a(qaE1),.b(ZmuxALUSrc),.aluc(alucE),.alu_out(aluout0),.zero(),.overflow());
	mux2 MuxALUOUT(.A(aluout0),.B(add44E),.Z(aluout),.s(MALUOUTE));

regM regM(.clk(clk),.res_Min(res_E),.A3Min(A3E),.V2Min(qbE1),.MemtoRegin(MemtoRegE),.MemWritein(MemWriteE),.aluoutin(aluout),.RegWritein(RegWriteE),.res_Mout(res_M),.A3Mout(A3M),.V2Mout(qbM),.MemtoRegout(MemtoRegM),.MemWriteout(MemWriteM),.aluoutout(aluoutM),.RegWriteout(RegWriteM),.PCin(PCE),.PCout(PCM));

   dm u_dm(.clk(clk),.we(MemWriteM),.addr(aluoutM[7:0]),.din(qbM),.dout(dout),.reset(reset),.PCin(PCM));
   
regW regW(.clk(clk),.res_Win(res_M),.A3Win(A3M),.aluoutin(aluoutM),.Datain(dout),.MemtoRegin(MemtoRegM),.RegWritein(RegWriteM),.res_Wout(res_W),.A3Wout(A3W),.aluoutout(aluoutW),.Dataout(doutW),.MemtoRegout(MemtoRegW),.RegWriteout(RegWriteW),.PCin(PCM),.PCout(PCW));

   mux2 u_muxMemtoReg(.A(aluoutW),.B(doutW),.Z(ZmuxMemtoReg),.s(MemtoRegW));

assign pc=PC;
assign alu_out=aluout;
assign inst=out;
assign dm_out=dout;
assign sta=stall;
assign npc=NPC;
assign alu_c=alucE;

endmodule
