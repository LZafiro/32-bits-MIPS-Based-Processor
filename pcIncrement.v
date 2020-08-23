///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the adder that will increment the program counter for the next 
//instruction -> combinational circuit (32Bit)

module pcIncrement(
	input [0:31]actualPC,
	output [0:31]newPC
);

function [0:31]adder;
	
	input [0:31]in;
	
	adder = in + 32'd1;
	
endfunction

assign newPC = adder(actualPC);

endmodule 