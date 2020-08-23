///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of a memory designed for the data. Is used for Load and Store instructions

module dataMemory(
	input clock,
	input reset,
	input memwrite,
	input [0:31] address,
	input [0:31] dataIn,
	output reg [0:31] dataOut
);

//Internal memory for the unit
reg [0:31] memory[20];

always @(posedge clock)

begin

	if(reset)
	
	begin
	
		$readmemb("data.mem", memory);
	
	end
	
	if(memwrite)
	
	begin
	
		memory[address] <= dataIn;
	
	end

end

always @(*)

begin

	dataOut <= memory[address];

end


endmodule 