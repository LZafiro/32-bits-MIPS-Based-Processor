///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 2. Used for select ALU's second operador

module mux2(
	input [0:1] aluop,
	input [0:31] in1,
	input [0:31] in2,
	input [0:31] in3,
	output [0:31] out
);

function [0:31] mux;

	input [0:1] aluop;
	
	input [0:31] in1;
	
	input [0:31] in2;
	
	input [0:31] in3;

	case(aluop)
		
		//rt data
		2'b00: mux = in1;
		
		//16bit extender
		2'b01: mux = in2;
		
		//11bit extender
		2'b10: mux = in3;
		
		default: mux = 5'd0;
		
	endcase

endfunction 

assign out = mux(aluop, in1, in2, in3);

endmodule 