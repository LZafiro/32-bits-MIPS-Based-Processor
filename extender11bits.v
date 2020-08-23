///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Combinational circuit for extending a 11bit signal to a 32 bit signal

module extender11bits(
	input [0:10] in,
	output [0:31] out
);

function [0:31] ext;

	input [0:10] in;
	
	if(in[0] == 0) ext = {21'd0, in};
	
	else if(in[0] == 1) ext = {21'd1, in};

endfunction

assign out = ext(in);

endmodule 