///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the IO unit. This one is used only for simulations

module ioSimu(
	input outctrl,
	input inctrl,
	input [0:31] fromCPU,
	input [0:31] externalIn,
	output reg [0:31] forCPU,
	output reg [0:31] externalOut
);

always @(*)

begin

	if(inctrl) forCPU <= externalIn;
	
	else if(outctrl) externalOut <= fromCPU;

end

endmodule 