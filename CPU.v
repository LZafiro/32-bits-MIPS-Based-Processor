///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the CPU

module CPU(
	input clock,
	input reset,
	input enter,
	input pcctrl,
	input [0:1] regtarg,
	input regwrite,
	input branch,
	input [0:1] aluop,
	input [0:2] regdatain,
	input [0:3] aluctrl,
	input [0:1] jump,
	input memwrite,
	input branchtype,
	input [0:31] dataIn,
	output [0:31] dataOut,
	output [0:5] OpCode
);

//actual pc address
wire [0:31] address;

wire [0:31] instruction;

//mux out wires
wire [0:4] mux1w;
wire [0:31] mux2w, mux3w, mux4w, mux5w;
wire mux6w;

//next pc wire (pc increment out)
wire [0:31] newpc;

//signal extender out wire
wire [0:31] ext11, ext16, ext26;

//alu output
wire [0:32] aluout;

//zero wire
wire zero;

//register bank output wires
wire [0:31] rs, rt;

//data memory out wire
wire [0:31] memdataout;

programCounter pc(
	.clk(clock),
	.reset(reset),
	.pcCtrl(pcctrl | enter),
	.newAddr(mux4w),
	.Addr(address)
);

pcIncrement(
	.actualPC(address),
	.newPC(newpc)
);

instructionMemory(
	.reset(reset),
	.address(address),
	.instruction(instruction)
);

registerBank(
	.clock(clock),
	.reset(reset),
	.regwrite(regwrite),
	.rsAddr(instruction[6:10]),
	.rtAddr(instruction[11:15]),
	.rdAddr(mux1w),
	.writeData(mux5w),
	.rsData(rs),
	.rtData(rt)
);

ALU alu(
	.aluctrl(aluctrl),
	.in1(rs),
	.in2(mux2w),
	.out(aluout)
);

zeroVerification zeroverify(
	.aluOut(aluout),
	.zero(zero)
);

dataMemory datamem(
	.clock(clock),
	.reset(reset),
	.memwrite(memwrite),
	.address(aluout),
	.dataIn(rt),
	.dataOut(memdataout)
);

extender11bits exxt11(
	.in(instruction[21:31]),
	.out(ext11)
);

extender16bits exxt16(
	.in(instruction[16:31]),
	.out(ext16)
);

extender26bits exxt26(
	.in(instruction[6:31]),
	.out(ext26)
);

mux1 MUX1(
	.regtarg(regtarg),
	.in1(instruction[11:15]),
	.in2(instruction[16:20]),
	.out(mux1w)
);

mux2 MUX2(
	.aluop(aluop),
	.in1(rt),
	.in2(ext16),
	.in3(ext11),
	.out(mux2w)
);

mux3 MUX3(
	.ctrl(mux6w & branch), //and
	.in1(ext16),
	.in2(newpc),
	.out(mux3w)
);

mux4 MUX4(
	.jump(jump),
	.in1(ext26),
	.in2(mux3w),
	.in3(rs),
	.out(mux4w)
);

mux5 MUX5(
	.regdatain(regdatain),
	.in1(dataIn),
	.in2(newpc),
	.in3(rs),
	.in4(memdataout),
	.in5(aluout),
	.in6(ext16),
	.out(mux5w)
);

mux6 MUX6(
	.branchtype(branchtype),
	.in1(zero),
	.in2(~zero), //not zero
	.out(mux6w)
);

//Send opcode to control unit
assign OpCode = instruction[0:5];
assign dataOut = rs;

endmodule 