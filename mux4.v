//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the multiplexer (mux) 4. Used for select if a jump will be made

module mux4(
	input [0:1] jump,
	input [0:31] in1, 
	input [0:31] in2,
	input [0:31] in3,
	output [0:31] out
);

function [0:31] mux;

	input [0:1] jump;
	
	input [0:31] in1; 
	
	input [0:31] in2;
	
	input [0:31] in3;

	case(jump)

		//jump
		2'b00: mux = in1;

		//mux 3
		2'b01: mux = in2;

		//jr
		2'b10: mux = in3;

		default: mux = 32'd0;

	endcase

endfunction

assign out = mux(jump, in1, in2, in3);

endmodule
