`timescale 1ns / 1ps
//Signed/unsigned 16-to-32 extender
module extender(IMM16,IMM32,sign);
input[15:0] IMM16;
input sign;
output[31:0] IMM32;

reg[31:0] IMM32=0;

always @ (sign,IMM16)
begin
   case(sign)
	1'b0:IMM32<={2'h00,IMM16};
	1'b1:
   if(IMM16[15])
      IMM32<={{16'hffff},IMM16};
   else
      IMM32<={{16'h0000},IMM16};
	endcase
end

endmodule
