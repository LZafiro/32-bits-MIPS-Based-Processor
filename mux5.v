//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 4. Used for select the data that will be write
//on register bank

module mux5(
	input [0:2] regdatain,
	input [0:31] in1, 
	input [0:31] in2,
	input [0:31] in3,
	input [0:31] in4,
	input [0:31] in5,
	input [0:31] in6,
	output [0:31] out
);

function [0:31] mux;

	input [0:2] regdatain;
	
	input [0:31] in1; 
	
	input [0:31] in2;
	
	input [0:31] in3;
	
	input [0:31] in4;
	
	input [0:31] in5;

	input [0:31] in6;

	case(regdatain)
	
		//IO unit
		3'b000: mux = in1;
		
		//pc + 1
		3'b001: mux = in2;
		
		//rs data
		3'b010: mux = in3;
		
		//data mem out
		3'b011: mux = in4;
		
		//alu out
		3'b100: mux = in5;

		//16bit extender
		3'b101: mux = in6;
	
		default: mux = 32'b0;
	
	endcase

endfunction

assign out = mux(regdatain, in1, in2, in3, in4, in5, in6);

endmodule
