`timescale 1ns / 1ps
//Tnew counter
`define ADD 6'b000000
`define SUB 6'b000000
`define AND 6'b000000
`define JR 6'b000000
`define ORI 6'b001101
`define ADDI 6'b001000
`define BEQ 6'b000100
`define J 6'b000010
`define JAL 6'b000010
`define SW 6'b101011
`define LW 6'b100011
`define LUI 001111

`define ALU 2'b01
`define DM 2'b10
`define PC 2'b11
`define NW 2'b00
module res(OPD,res);

input[5:0] OPD;

output[1:0] res;
reg[1:0] res=0;

always @ (OPD)
begin
case(OPD)
	`ADD:res<=`ALU;
	`SUB:res<=`ALU;
	`AND:res<=`ALU;
	`ORI:res<=`ALU;
	`ADDI:res<=`ALU;
	`LUI:res<=`ALU;
	`LW:res<=`DM;
	`J:res<=`PC;
	`JAL:res<=`ALU;
	`JR:res<=`PC;
	default:res<=`NW;
endcase
end

endmodule
