`timescale 1ns / 1ps
//Arithmetic and Logic Unit
module ALU(a,b,aluc,alu_out,zero,overflow);
input [31:0] a,b;
input [2:0] aluc;
output [31:0] alu_out;
output zero,overflow;

reg [31:0] alu_out=0;
reg zero=0,overflow=0;

always @ (a or b or aluc or alu_out)
begin
case(aluc)
3'b010:
begin
alu_out<=a+b;
overflow<=((a[31]==b[31])&&(a[31]!=alu_out[31]));
end
3'b110:
begin
alu_out<=a-b;
overflow<=((a[31]!=b[31])&&(a[31]!=alu_out[31]));
end
3'b000:
begin
alu_out<=a&b;
overflow<=0;
end
3'b001:
begin
alu_out<=a|b;
overflow<=0;
end
3'b011:
begin
alu_out<=a^b;
overflow<=0;
end
3'b100:
begin
alu_out<=a<<5'h10;
overflow<=0;
end
3'b111:
begin
alu_out<=0;
overflow<=0;
end
endcase

if(alu_out==32'h00000000)
zero<=1;
else
zero<=0;
end

endmodule
