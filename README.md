# 5-Stage_Pipeline_CPU
A pipeline CPU supporting 12 basic MIPS instructions.  
  
Compared with single cycle and multi-cycle, the relational degree and the amount of considering point of designing pipeline leap due to its parallelism.  
  
The complexity of modern industrial design is very high, hence the development method based on model and abstract description must be adopted.  
  
This project was a training of systematic thinking.  
  
This is a very simple implementation, just some basic funtionality was implemented.  
* Instruction set: a subset of MIPS, including {add, sub, and, jr, ori, addi, beq, j, jal, sw, lw, lui}  
* 32-bit processor  
* 5-stage pipeline  
* Stalling and forwarding(to resolve the data hazard)  
* The comparison of branch instruction was advanced to ID stage(stage 2).  
* Branch delay slot  
      

Instructions are saved in im.v.  
Default testing instruction sequence:  
	32'h20100000; //       ADDI $16, $0, 0  
	32'h20110000; //       ADDI $17, $0, 0  
	32'h00009024; //       AND $18, $0, $0  
	32'h2008000a; //       ADDI $8, $0, 10  
	32'h12280006; // LABL1: BQE $17, $8, LABL2  
	32'h00000000; //       NOP  
	32'h02129021; //       ADDU $18, $16, $18  
	32'h22100001; //       ADDI $16, $16, 1  
	32'h22310001; //       ADDI $17, $17, 1  
	32'h0c000c04; //       JAL LABL1   
	32'h00000000; //       NOP  
	32'hac120040; // LABL2: SW $18, 0x00000040($0)  
	32'h8c100040; //       LW $16 0x00000040($0) 
