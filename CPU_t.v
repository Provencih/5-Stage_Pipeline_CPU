`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:56:40 07/09/2018
// Design Name:   CPU
// Module Name:   D:/Major/CO/Experiment/Pipeline/6.4/CPU/CPU_t.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_t;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] pc;
	wire [31:0] inst;
	wire [31:0] alu_out,alu_c;
	wire [31:0] dm_out,npc,bjnpc,alua,alub,qad,qbd;
	wire pcsel,sta,regwritew;
	wire [1:0] npcctrl,fcmp1d,fcmp2d,faluae,falube;
	wire[5:0] opd;
	wire[4:0] a1d,a2d,a1e,a2e,a3e,a3m,a3w;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset), 
		.pc(pc), 
		.inst(inst), 
		.alu_out(alu_out), 
		.dm_out(dm_out), 
		.pcsel(pcsel), 
		.npcctrl(npcctrl),
		.sta(sta),
		.npc(npc),
		.bjnpc(bjnpc),
		.alua(alua),
		.alub(alub),
		.fcmp1d(fcmp1d),
		.fcmp2d(fcmp2d),
		.qad(qad),
		.qbd(qbd),
		.faluae(faluae),
		.falube(falube),
		.regwritew(regwritew),
		.opd(opd),
		.a1d(a1d),
		.a2d(a2d),
		.a1e(a1e),
		.a2e(a2e),
		.a3e(a3e),
		.a3m(a3m),
		.a3w(a3w),
		.alu_c(alu_c)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;  
		// Add stimulus here
		#10;
		reset=1;
	end
   initial begin
	   clk=0;
		forever 
		begin
		   #20 clk=~clk;
			//RESET=1;
		end
	end
endmodule

