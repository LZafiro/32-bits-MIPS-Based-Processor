///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of a memory designed for the register bank. 32 register, 30->zero, 31->ra

module registerBank(
	input clock,
	input reset,
	input regwrite,
	input [0:4] rsAddr,
	input [0:4] rtAddr,
	input [0:4] rdAddr,
	input [0:31] writeData,
	output reg [0:31] rsData,
	output reg [0:31] rtData
);

//Internal memory for the register bank
reg [0:31] memory[32];

always @(posedge clock)

begin

	if(reset)
	
	begin
	
		$readmemb("registers.mem", memory);
	
	end
	
	if(regwrite)
	
	begin
	
		memory[rdAddr] <= writeData;
	
	end
	
end

always @(*)

begin

	rsData <= memory[rsAddr];
	
	rtData <= memory[rtAddr];

end

endmodule 