///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of a ALU designed for the instructions defined for the processor developed

module ALU(
	input [0:3] aluctrl, //Check num of bits
	input [0:31] in1,
	input [0:31] in2,
	output [0:31] out
);

function [0:31] alu;

	input [0:3] aluctrl;

	input [0:31] in1;
	
	input [0:31] in2;
			
	case(aluctrl)
	
		//add
		4'b0000: alu = in1 + in2;
		
		//sub
		4'b0001: alu = in1 - in2;
		
		//mul
		4'b0010: alu = in1 * in2;
		
		//div
		4'b0011: alu = in1 / in2;
		
		//mod
		4'b0100: alu = in1 % in2;
		
		//and
		4'b0101: alu = in1 & in2;
		
		//or
		4'b0110: alu = in1 | in2;
		
		//not
		4'b0111: alu = ~in1;
		
		//xor
		4'b1000: alu = in1 ^ in2;
		
		//slt
		4'b1001:
		
		begin
		
			if(in1 < in2) alu = 1;
			
			else alu = 0;
		
		end
		
		//sgt
		4'b1010:
		
		begin
		
			if(in1 > in2) alu = 1;
			
			else alu = 0;
		
		end
		
		//slet
		4'b1011:
		
		begin
		
			if(in1 <= in2) alu = 1;
			
			else alu = 0;
		
		end
		
		//sget
		4'b1100:
		
		begin
		
			if(in1 >= in2) alu = 1;
			
			else alu = 0;
		
		end
		
		//lsh
		4'b1101: alu = in1 << in2;
		
		//rsh
		4'b1110: alu = in1 >> in2;
		
		default: alu = 0;
		
	endcase

endfunction 

assign out = alu(aluctrl, in1, in2);

endmodule 