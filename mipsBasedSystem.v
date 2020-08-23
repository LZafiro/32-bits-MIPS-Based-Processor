///////////////////////////////////////////////////////////////////////////////////////////
//---------------------------- Processor: ZAFx32 (MIPS Based) ---------------------------//
//------------------------- Luiz Felipe Raveduti Zafiro - 120513 ------------------------//
//---------------------- Lab. Computer Architecture and Organization --------------------//
//------------- Computer Engineering - Federal University of São Paulo - Brazil----------// 
///////////////////////////////////////////////////////////////////////////////////////////

//Implementation of the full system

module mipsBasedSystem(
	input clock,
	input reset,
	input enter,
	input [0:31] dataIn,
	output [0:31] dataOut
);

wire [0:5] opcode; 

//Control signals wires
wire pcctrl, regwrite, branch, memwrite, branchtype;
wire [0:1] regtarg, aluop, jump;
wire [0:2] regdatain;
wire [0:3] aluctrl;

wire [0:31] tocpu, fromcpu;

CPU cpu(
	.clock(clock),
	.reset(reset),
	.enter(enter),
	.pcctrl(pcctrl),
	.regtarg(regtarg),
	.regwrite(regwrite),
	.branch(branch),
	.aluop(aluop),
	.regdatain(regdatain),
	.aluctrl(aluctrl),
	.jump(jump),
	.memwrite(memwrite),
	.branchtype(branchtype),
	.dataIn(tocpu),
	.dataOut(fromcpu),
	.OpCode(opcode)
);

controlUnit ctrlUnit(
	.opcode(opcode),
	.pcctrl(pcctrl),
	.regtarg(regtarg),
	.regwrite(regwrite),
	.branch(branch),
	.aluop(aluop),
	.regdatain(regdatain),
	.outctrl(outctrl),
	.inctrl(inctrl),
	.aluctrl(aluctrl),
	.jump(jump),
	.memwrite(memwrite),
	.branchtype(branchtype)
);

ioSimu io(
	.outctrl(outctrl),
	.inctrl(inctrl),
	.fromCPU(fromcpu),
	.externalIn(dataIn),
	.forCPU(tocpu),
	.externalOut(dataOut)
);

endmodule 