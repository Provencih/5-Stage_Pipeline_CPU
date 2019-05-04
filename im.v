`timescale 1ns / 1ps
//Instruction memory
module im(addr,OP,FUNCT,A1,A2,RD,IMM,AD,out);
input[31:0] addr;
output[5:0] OP,FUNCT;
output[4:0] A1,A2,RD;
output[15:0] IMM;
output[25:0] AD;
output[31:0] out;

reg[5:0] OP=0,FUNCT=0;
reg[4:0] A1=0,A2=0,RD=0;
reg[15:0] IMM=0;
reg[25:0] AD=0;
reg[31:0] out=0;

always @ (addr)
begin
   case(addr)
	32'h00003000:out=32'h20100000; //       ADDI $16,$0,0
	32'h00003004:out=32'h20110000; //       ADDI $17,$0,0
	32'h00003008:out=32'h00009024; //       AND $18,$0,$0
	32'h0000300c:out=32'h2008000a; //       ADDI $8,$0,10
	32'h00003010:out=32'h12280006; //LABL1: BQE $17,$8,LABL2
	32'h00003014:out=32'h00000000; //       NOP
	32'h00003018:out=32'h02129021; //       ADDU $18,$16,$18
	32'h0000301c:out=32'h22100001; //       ADDI $16,$16,1
	32'h00003020:out=32'h22310001; //       ADDI $17,$17,1
	32'h00003024:out=32'h0c000c04; //       JAL LABL1 
	32'h00003028:out=32'h00000000; //       NOP
	32'h0000302c:out=32'hac120040; //LABL2: SW $18,0x00000040($0)
	32'h00003030:out=32'h8c100040; //       LW $16 0x00000040($0)
	
	//32'h0000006c:out=32'h02000008; //       jr $16
	//32'h0000002c:out=32'hac120041;
	//32'h00000030:out=32'h8c100041;
	default:out={32{1'b0}};
	endcase
	OP=out[31:26];
	FUNCT=out[5:0];
	A1=out[25:21];
	A2=out[20:16];
	RD=out[15:11];
	IMM=out[15:0];
	AD=out[25:0];
end

endmodule
