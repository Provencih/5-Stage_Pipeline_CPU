`timescale 1ns / 1ps
//Generic registers
module rf(clk,we,ra,rb,rw,rd,qa,qb,reset,PCin);

input clk;
input we,reset;
input[4:0] ra,rb,rw;
input[31:0] rd,PCin;
output[31:0] qa,qb;
integer i;

//reg[31:0] qa,qb;
reg[31:0] register[0:31];

assign qa=(ra==0)?0:register[ra];//寄存器读,R0为0，否则读出其他寄存器的值
assign qb=(rb==0)?0:register[rb];

always @ (posedge clk, negedge reset)
begin
	if(!reset)
		for(i=0;i<32;i=i+1)
			register[i]<=0;
	else
	begin
		if((rw!=0)&&we)//R0不能写入
		begin
			register[rw]<=rd;
			$display("%d@%h: $%d <= %h", $time, PCin, rw, rd);
		end
	end
		
end
endmodule