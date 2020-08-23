///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of a memory designed for the instructions. This memory can only be acessed,
//it can't be written

module instructionMemory(
	input reset,
	input [0:31] address,
	output reg [0:31] instruction 
);

//Internal memory for saving all instructions
reg [0:31] memory[20];

always @(address)

begin

	if(reset)
	
	begin
	
		$readmemb("instructions.mem", memory);
	
	end
	
	instruction <= memory[address];
	
end

endmodule 