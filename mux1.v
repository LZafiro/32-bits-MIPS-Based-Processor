///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 1. Used for select the write register of the
//register bank

module mux1(
	input [0:1] regtarg,
	input [0:4] in1,
	input [0:4] in2,
	output [0:4] out
);

function [0:4] mux;

	input [0:1] regtarg;
	
	input [0:4] in1;
	
	input [0:4] in2;

	case(regtarg)
		
		//rt
		2'b00: mux = in1;
		
		//rd
		2'b01: mux = in2;
		
		//for ra, jal instruction
		2'b10: mux = 5'd31;
		
		default: mux = 5'd0;
		
	endcase

endfunction 

assign out = mux(regtarg, in1, in2);

endmodule 