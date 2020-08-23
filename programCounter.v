///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of a 32Bit register (program counter), that will provide the address
//for the instruction

module programCounter(
	input clk,
	input reset,
	input pcCtrl,
	input [0:31]newAddr,
	output reg [0:31] Addr
); 

always@(negedge clk)
	
begin
	
	if(reset == 1)
		
		Addr <= 32'b0;
	
	else if(pcCtrl == 1)

		Addr <= newAddr;

end

endmodule 