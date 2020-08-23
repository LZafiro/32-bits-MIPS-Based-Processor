///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Combinational circuit for extending a 16bit signal to a 32 bit signal

module extender16bits(
	input [0:15] in,
	output [0:31] out
);

function [0:31] ext;

	input [0:15] in;
	
	if(in[0] == 0) ext = {16'd0, in};
	
	else if(in[0] == 1) ext = {16'd1, in};

endfunction

assign out = ext(in);

endmodule 