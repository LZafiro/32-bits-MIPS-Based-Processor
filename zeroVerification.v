///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Circuit tha generates the zero signal based in the ALU result. Used for branch control signal

module zeroVerification(
	input [0:31] aluOut,
	output zero
);

function verification;

	input [0:31] aluOut;

	if(aluOut == 0) verification = 1;
	
	else verification = 0;

endfunction

assign zero = verification(aluOut);

endmodule 