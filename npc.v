`timescale 1ns / 1ps
//Next program counter¡®s value
module npc(PCADD4,Offset,Address,NPCCtrl,bjNPC,V1,V2,PCSel);
input[31:0] PCADD4,V1,V2;
input[15:0] Offset;
input[25:0] Address;
input[1:0] NPCCtrl;

output[31:0] bjNPC;
output PCSel;

reg[31:0] NPCtemp=0,bjNPC=0;
reg PCSel=0;

always @ (PCADD4,Offset,Address,NPCCtrl,V1,V2)
begin
   NPCtemp=PCADD4;
   case(NPCCtrl)
	2'b01:
	begin
	   bjNPC<={NPCtemp[31:28],Address,2'b00};
		PCSel<=1;
	end
	2'b10:
	if(V1-V2==0)
	begin
		if(Offset[15])
		begin
		   bjNPC<=({16'hffff,Offset}<<2)+NPCtemp;
			PCSel<=1;
		end
		else
		begin
		   bjNPC<=({16'h0000,Offset}<<2)+NPCtemp;
			PCSel<=1;
		end
	end
	else
	begin
		bjNPC<=NPCtemp;
	   PCSel<=0;
	end
	2'b00:
	begin
		bjNPC<=NPCtemp;
	   PCSel<=0;
	end
	2'b11:
	begin
		bjNPC<=V1;
		PCSel<=1;
	end
	endcase
end

endmodule
