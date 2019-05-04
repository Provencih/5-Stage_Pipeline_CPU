`timescale 1ns / 1ps
//Hazard Detection Unit
`define ADD 6'b000000
`define SUB 6'b000000
`define AND 6'b000000
`define JR 6'b000000
`define ORI 6'b001101
`define ADDI 6'b001000
`define BEQ 6'b000100
`define J 6'b000010
`define JAL 6'b000011
`define SW 6'b101011
`define LW 6'b100011
`define LUI 001111

`define ALU 2'b01
`define DM 2'b10
`define PC 2'b11
`define NW 2'b00

module HDU(opD,A1D,A2D,A1E,A2E,A3E,A3M,A3W,Stall,FCMP1D,FCMP2D,FALUAE,FALUBE,res0,res_E,res_M,res_W);

input[5:0] opD;
input[4:0] A1D,A2D,A1E,A2E,A3E,A3M,A3W;
input[1:0] res0,res_E,res_M,res_W;
//input clk;

output Stall;
output[1:0] FCMP1D,FCMP2D,FALUAE,FALUBE;

reg add=0,sub=0,And=0,ori=0,addi=0,beq=0,j=0,sw=0,lw=0,lui=0,jr=0,jal=0;
reg Tuse_rs0=0,Tuse_rs1=0,Tuse_rt0=0,Tuse_rt1=0,Tuse_rt2=0;
reg Stall_rs0_E1=0,Stall_rs0_E2=0,/*Stall_rs0_E3,*/Stall_rs0_M1=0,Stall_rs1_E2=0,Stall_rs=0;
reg Stall_rt0_E1=0,Stall_rt0_E2=0,/*Stall_rt0_E3,*/Stall_rt0_M1=0,Stall_rt1_E2=0,Stall_rt=0;
reg Stall=0;
reg[1:0] FCMP1D=0,FCMP2D=0,FALUAE=0,FALUBE=0;

always @ (opD,A1D,A2D,A1E,A2E,A3E,A3M,A3W,res0,res_E,res_M,res_W)
begin
   case(opD)
	`ADD:
	begin
	   add<=1;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`SUB:
	begin
		add<=0;
		sub<=1;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`ORI:
	begin
	   add<=0;
		sub<=0;
		ori<=1;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`ADDI:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=1;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`BEQ:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=1;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`J:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=1;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`LW:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=1;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`SW:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=1;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`LUI:
	begin
	   add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=1;
		And<=0;
		jr<=0;
		jal<=0;
	end
	`AND:
	begin
		add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=1;
		jr<=0;
		jal<=0;
	end
	`JR:
	begin
		add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=1;
		jal<=0;
	end
	`JAL:
	begin
		add<=0;
		sub<=0;
		ori<=0;
		addi<=0;
		beq<=0;
		j<=0;
		lw<=0;
		sw<=0;
		lui<=0;
		And<=0;
		jr<=0;
		jal<=1;
	end	
	endcase
	
	
	/*case(opM)
	`ADD:res_M<=ALU;
	`SUB:res_M<=ALU;
	`ORI:res_M<=ALU;
	`ADDI:res_M<=ALU;
	`LUI:res_M<=ALU;
	`LW:res_M<=DM;
	`J:res_M<=PC;
	default:res_M<=NW;
	endcase
	
	case(opW)
	`ADD:res_W<=ALU;
	`SUB:res_W<=ALU;
	`ORI:res_W<=ALU;
	`ADDI:res_W<=ALU;
	`LUI:res_W<=ALU;
	`LW:res_W<=DM;
	`J:res_W<=PC;
	default:res_W<=NW;
	endcase*/
	
	
	Tuse_rs0=beq|jr;
	Tuse_rs1=add|sub|ori|addi|lw|sw|And;
	
	Tuse_rt0=beq;
	Tuse_rt1=add|sub|And;
	Tuse_rt2=sw;
	
	Stall_rs0_E1=Tuse_rs0&(res_E==2'b01)&(A1D==A3E)&(A1D!=0);
	Stall_rs0_E2=Tuse_rs0&(res_E==2'b10)&(A1D==A3E)&(A1D!=0);
	//Stall_rs0_E3=Tuse_rs0&(res0==2'b01)&(A1D==A3E)&(A1D!=0);
	Stall_rs0_M1=Tuse_rs0&(res_M==2'b10)&(A1D==A3M)&(A1D!=0);
	Stall_rs1_E2=Tuse_rs1&(res_E==2'b10)&(A1D==A3E)&(A1D!=0);
	
	Stall_rs=Stall_rs0_E1|Stall_rs0_E2|Stall_rs0_M1|Stall_rs1_E2;//|Stall_rs0_E3;
	
	Stall_rt0_E1=Tuse_rt0&(res_E==2'b01)&(A2D==A3E)&(A2D!=0);
	Stall_rt0_E2=Tuse_rt0&(res_E==2'b10)&(A2D==A3E)&(A2D!=0);
	//Stall_rt0_E3=Tuse_rt0&(res0==2'b01)&(A1D==A3E)&(A1D!=0);
	Stall_rt0_M1=Tuse_rt0&(res_M==2'b10)&(A2D==A3M)&(A2D!=0);
	Stall_rt1_E2=Tuse_rt1&(res_E==2'b10)&(A2D==A3E)&(A2D!=0);
	
	Stall_rt=Stall_rt0_E1|Stall_rt0_E2|Stall_rt0_M1|Stall_rt1_E2;//|Stall_rt0_E3;
	
	Stall=Stall_rs|Stall_rt;
	
	//FCMP1D=((A1==A3M)&(res_M==`ALU))?2'b11:(((A1==A3W)&(res_W==`ALU))?2'b10:(((A1==A3W)&(res_W==`DM))?2'b01:0));
	//FCMP2D=((A2==A3M)&(res_M==`ALU))?2'b11:(((A2==A3W)&(res_W==`ALU))?2'b10:(((A2==A3W)&(res_W==`DM))?2'b01:0));
	//FALUAE=((A1E==A3M)&(res_M==`ALU))?2'b11:(((A1E==A3W)&(res_W==`ALU))?2'b10:(((A1E==A3W)&(res_W==`DM))?2'b01:0));
	//FALUBE=((A2E==A3M)&(res_M==`ALU))?2'b11:(((A2E==A3W)&(res_W==`ALU))?2'b10:(((A2E==A3W)&(res_W==`DM))?2'b01:0));
	
	FCMP1D=((A1D==A3M)&(res_M==`ALU)&(A1D!=0)&(A3M!=0))?2'b11:((A1D==A3W)&(res_W==`ALU)&(A1D!=0)&(A3W!=0))?2'b10:((A1D==A3W)&(res_W==`DM)&(A1D!=0)&(A3W!=0))?2'b01:0;
	FCMP2D=((A2D==A3M)&(res_M==`ALU)&(A1D!=0)&(A3M!=0))?2'b11:((A2D==A3W)&(res_W==`ALU)&(A1D!=0)&(A3W!=0))?2'b10:((A2D==A3W)&(res_W==`DM)&(A1D!=0)&(A3W!=0))?2'b01:0;
	
	FALUAE=((A1E==A3M)&(res_M==`ALU)&(A1E!=0)&(A3M!=0))?2'b11:((A1E==A3W)&(res_W==`ALU)&(A1E!=0)&(A3W!=0))?2'b10:((A1E==A3W)&(res_W==`DM)&(A1E!=0)&(A3W!=0))?2'b01:0;
	
	FALUBE=((A2E==A3M)&(res_M==`ALU)&(A2E!=0)&(A3M!=0))?2'b11:
			 ((A2E==A3W)&(res_W==`ALU)&(A2E!=0)&(A3W!=0))?2'b10:
			 ((A2E==A3W)&(res_W==`DM)&(A2E!=0)&(A3W!=0))?2'b01:
			 0;
end
endmodule
