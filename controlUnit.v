///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the control unit, based on the instruction opcode

module controlUnit(
	input [0:5] opcode,
	output reg pcctrl,
	output reg [0:1] regtarg,
	output reg regwrite,
	output reg branch,
	output reg [0:1] aluop,
	output reg [0:2] regdatain,
	output reg outctrl,
	output reg inctrl,
	output reg [0:3] aluctrl,
	output reg [0:1] jump,
	output reg memwrite,
	output reg branchtype
);

always @(opcode)

begin
	
	case(opcode)
	
		//add
		6'b000000: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0000;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//addi
		6'b000001: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b00;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b01;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0000;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//sub
		6'b000010: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0001;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//mul
		6'b000011: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0010;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//div
		6'b000100: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0011;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//mod
		6'b000101: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0100;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//and
		6'b000110: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0101;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//or
		6'b000111: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0110;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//not
		6'b001000: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0111;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//xor
		6'b001001: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1000;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//slt
		6'b001010: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1001;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//sgt
		6'b001011: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1010;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//slet
		6'b001100: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1011;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//sget
		6'b001101: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b00;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1100;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//lsh
		6'b001110: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b10;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1101;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//rsh
		6'b001111: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b01;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b10;
			regdatain = 3'b100;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b1110;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//mov
		6'b010000: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b00;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'b010;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//li
		6'b010001: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b00;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'b101;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//beq
		6'b010010: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b1;
			aluop = 2'b00;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0001;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'b1;
		
		end
		
		//bne
		6'b010011: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b1;
			aluop = 2'b00;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0001;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'b0;
		
		end
		
		//j
		6'b010100: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b00;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//in
		6'b010101: 
		begin
			
			pcctrl = 1'b0;
			regtarg = 2'b00;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'b000;
			outctrl = 1'b0; 
			inctrl = 1'b1;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//out
		6'b010110: 
		begin
			
			pcctrl = 1'b0;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'bxxx;
			outctrl = 1'b1; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
	
		//load
		6'b010111: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b00;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'b01;
			regdatain = 3'b011;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0000;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//store
		6'b011000: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'b01;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'b0000;
			jump = 2'b01;
			memwrite = 1'b1;
			branchtype = 1'bx;
		
		end
		
		//jr
		6'b011001: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b10;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//jal
		6'b011010: 
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'b10;
			regwrite = 1'b1;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'b001;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b00;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		//halt
		6'b011011: 
		begin
			
			pcctrl = 1'b0;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
		default:
		begin
			
			pcctrl = 1'b1;
			regtarg = 2'bxx;
			regwrite = 1'b0;
			branch = 1'b0;
			aluop = 2'bxx;
			regdatain = 3'bxxx;
			outctrl = 1'b0; 
			inctrl = 1'b0;
			aluctrl = 4'bxxxx;
			jump = 2'b01;
			memwrite = 1'b0;
			branchtype = 1'bx;
		
		end
		
	endcase

end

endmodule




