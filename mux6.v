//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 6. Used for select what king of branch is been made 

module mux6(
	input branchtype,
	input in1, 
	input in2,
	output out
);

function mux;

	input branchtype;
	
	input in1; 
	
	input in2;

	//jeq
	if(branchtype) mux = in1;
	
	//jne
	else mux = in2;

endfunction

assign out = mux(branchtype, in1, in2);

endmodule
