`timescale 1ns / 1ps
//Data memory
module dm(clk,we,addr,din,dout,reset,PCin);
input we,clk,reset;
input[7:0] addr;
input[31:0] din,PCin;
output[31:0] dout;
integer i;

reg[31:0] ram[0:1023];
always @ (posedge clk,negedge reset)
begin
	if(reset==0)
		for(i=0;i<1024;i=i+1)
			ram[i]<=0;
	else if(we==1)
	begin
		ram[addr]<=din;
		$display("%d@%h: *%h <= %h", $time, PCin, addr, din);
	end
end
assign dout=ram[addr];

endmodule
