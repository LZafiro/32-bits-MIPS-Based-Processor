///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 3. Used for select when a branch will be made

module mux3(
	input ctrl,
	input [0:31] in1,
	input [0:31] in2,
	output [0:31] out
);

function [0:31] mux;
	
	input ctrl;
	
	input [0:31] in1;
	
	input [0:31] in2;
	
	//when a branch will be made
	if(ctrl) mux = in1;
	
	//PC + 1
	else mux = in2;
	
endfunction 

assign out = mux(ctrl, in1, in2);

endmodule 