# MIPS Based Processor in Verilog HDL (Monocycle - Non Pipelined - 32Bits)

Project of a 32Bit MIPS Based Processor designed for supporting a Opertional System codded in C- (C Minus, a reduced version C) and compiled using a proper compiler, for running in a FPGA board (Altera DE2-115).

* The Compiler project can be find [here](https://github.com/LZafiro/cMinus-Compiler).

The project was developed for some laboratories of the undergraduate course in Computer Engineering at the Federal University of São Paulo.

# Features

The developed Processor follows the following specifications:

1. [General Definitions](#general-definitions);
2. [DataPath](#datapath);
3. [Instruction Set](#instruction-set);
4. [Control Signals](#control-signals);
5. [Credits](#credits)

## General Definitions

The processor uses the 32Bits Harvard Architecture (separare Data and Instruction Memories). It also has 32 registers in the register bank, with register 30 being zero and 31 being ra (for jal instruction). 

There are three types of instructions: type R, I and J. The formats of the instructions types are the following:

* R type:

    |OpCode(6 Bits)|rs(5 Bits)|rt(5 Bits)|rd(5 Bits)|Shamt(11 Bits)|
    |--------------|----------|----------|----------|--------------|

* I type:

    |OpCode(6 Bits)|rs(5 Bits)|rt(5 Bits)|Immidiate(16 Bits)|
    |--------------|----------|----------|------------------|

* J type:

    |OpCode(6 Bits)|Immidiate(26 Bits)|
    |--------------|------------------|

### DataPath

The full system is composed of a CPU, a IO unit and a control unit. The IO unit is generic, it can be modified for different external interfaces, it is implemented a IO unit for simulations into Quartus Software and a IO unit for the Altera DE2-115 FPGA board (where the system will be tested).

![Full System Datapath](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/System_Datapath.png)

Oppening the CPU unit into details:

![MIPS Based Processor Datapath](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/Processor_Datapath.png)

### Instruction Set

The processor have 28 instructions. Follows the instruction set:

|OpCode|Type|Instruction|Assembly|Description|
|------|----|-----------|--------|-----------|
|000000|R|Sum|add|R[rd]<-R[rs] + R[rt]|
|000001|I|Sum Immidiate|addi|R[rt]<-R[rs] + I|
|000010|R|Subtraction|sub|R[rd]<-R[rs] - R[rt]|
|000011|R|Multiplication|mul|R[rd]<-R[rs] * R[rt]|
|000100|R|Division|div|R[rd]<-R[rs] / R[rt]|
|000101|R|Reminder of division|mod|R[rd]<-R[rs] % R[rt]|
|000110|R|And|and|R[rd]<-R[rs] & R[rt]|
|000111|R|Or|or|R[rd]<-R[rs] \| R[rt]|
|001000|R|Not|not|R[rd]<- !R[rs]|
|001001|R|Xor|xor|R[rd]<-R[rs] xor R[rt]|
|001010|R|Set Less Then|slt|R[rs] < R[rt] ? R[rd]<-1 : R[rd]<-0|
|001011|R|Set Greather Then|sgt|R[rs] > R[rt] ? R[rd]<-1 : R[rd]<-0|
|001100|R|Set Less and Equal Then|slet|R[rs] <= R[rt] ? R[rd]<-1 : R[rd]<-0|
|001101|R|Set Greather and Equal Then|sget|R[rs] >= R[rt] ? R[rd]<-1 : R[rd]<-0|
|001110|R|Left Shift|lsh|R[rd]<-R[rs] << Shamt|
|001111|R|Right Shift|rsh|R[rd]<-R[rs] >> Shamt|
|010000|I|Move|mov|R[rt]<-R[rs]|
|010001|I|Load Immidiate|li|R[rt]<- I|
|010010|I|Branch if Equal|beq|R[rs] == R[rt] ? PC<- A : PC<- PC + 1|
|010011|I|Branch if Not Equal|bne|R[rs] != R[rt] ? PC<- A : PC<- PC + 1|
|010100|J|Jump|j|PC<- A|
|010101|I|Input|in|R[rt]<- Input|
|010110|I|Output|out|Output<- R[rs]|
|010111|I|Load|load|R[rt]<- M[R[rs] + I]|
|011000|I|Store|store|M[R[rs] + I]<- R[rt]|
|011001|I|Jump to Register|jr|PC<- R[rs]|
|011010|J|Jump and Link|jal|R[ra]<- PC + 1 and PC<- A|
|011011|J|Halt|halt|------|

### Control Signals

This are the signals produced by the Control Unit based on each instruction OpCode.

|Instruction|pcctrl|regtarg|regwrite|branch|aluop|regdatain|outctrl|inctrl|aluctrl|jump|memwrite|branchtype|
|-----------|------|-------|--------|------|-----|---------|-------|------|-------|----|--------|----------|
|**add**|1|01|1|0|00|100|0|0|0000|01|0|x|
|**addi**|1|00|1|0|01|100|0|0|0000|01|0|x|
|**sub**|1|01|1|0|00|100|0|0|0001|01|0|x|
|**mul**|1|01|1|0|00|100|0|0|0010|01|0|x|
|**div**|1|01|1|0|00|100|0|0|0011|01|0|x|
|**mod**|1|01|1|0|00|100|0|0|0100|01|0|x|
|**and**|1|01|1|0|00|100|0|0|0101|01|0|x|
|**or**|1|01|1|0|00|100|0|0|0110|01|0|x|
|**not**|1|01|1|0|xx|100|0|0|0111|01|0|x|
|**xor**|1|01|1|0|00|100|0|0|1000|01|0|x|
|**slt**|1|01|1|0|00|100|0|0|1001|01|0|x|
|**sgt**|1|01|1|0|00|100|0|0|1010|01|0|x|
|**slet**|1|01|1|0|00|100|0|0|1011|01|0|x|
|**sget**|1|01|1|0|00|100|0|0|1100|01|0|x|
|**lsh**|1|01|1|0|10|100|0|0|1101|01|0|x|
|**rsh**|1|01|1|0|10|100|0|0|1110|01|0|x|
|**mov**|1|00|1|0|xx|010|0|0|xxxx|01|0|x|
|**li**|1|00|1|0|xx|101|0|0|xxxx|01|0|x|
|**beq**|1|xx|0|1|00|xxx|0|0|0001|01|0|1|
|**bne**|1|xx|0|1|00|xxx|0|0|0001|01|0|0|
|**j**|1|xx|0|0|xx|xxx|0|0|xxxx|00|0|x|
|**in**|0|00|1|0|xx|000|0|1|xxxx|01|0|x|
|**out**|0|xx|0|0|xx|xxx|1|0|xxxx|01|0|x|
|**load**|1|00|1|0|01|011|0|0|0000|01|0|x|
|**store**|1|xx|0|0|01|xxx|0|0|0000|01|1|x|
|**jr**|1|xx|0|0|xx|xxx|0|0|xxxx|10|0|x|
|**jal**|1|10|1|0|xx|001|0|0|xxxx|00|0|x|
|**halt**|0|xx|0|0|xx|xxx|0|0|xxxx|01|0|x|

# Some Tests

It was implemented a few algorithms to check the funcionality of the processor and the system.

* Factorial:

```
Assembly:

0: jal 5
1: load r3, 5(r30)
2: out r3

5: in r1
6: li r0 1
7: li r3 1 
8: beq r0 r1 12
9: addi r0 r0 1
10: mul t3, t3, t0
11: j 8
12: store r3 5(r30)
13: jr ra

Binary:

0: 011010_00000000000000000000000101
1: 0010111_11110_00011_0000000000000101
2: 010110_00011_00000_0000000000000000


5: 010101_00000_00001_0000000000000000
6: 010001_00000_00000_0000000000000001
7: 010001_00000_00011_0000000000000001
8: 010010_00000_00001_0000000000001100
9: 000001_00000_00000_0000000000000001
10: 000011_00000_00011_00011_00000000000
11: 010100_00000000000000000000001000
12: 011000_11110_00011_0000000000000101
13: 011001_11111_00000_0000000000000000
```
Following two simulations of the algorithm execution. We are using a Clock period of 20ns (50MHz). The FPGA Board Altera DE2-115 have a 50MHz internal clock. As the system is working with no errors in the simulation, using it on the board musn't cause problems (only with possible board defects). But for guarentee will be implemented a clock divisor to slow the inputclock for the system uploaded on the FPGA.

The first simulation we are calculating the factorial for a input of 7 (7! = 5040):

![Factorial Simulation 1](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/Factorial_Simulation1.png)

The second simulation we are calculating the factorial for a input of 5 (5! = 120):

![Factorial Simulation 2](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/Factorial_Simulation2.png)

* Fibonacci Sequence:

```
Assembly:

0: jal 5
1: load r5, 5(r30)
2: out r5


5: li r0 1
6: li r1 0
7: li r2 1
8: in r3 
9: beq r0, r3 15
10: addi r0 r0 1
11: add r4 r1 r2
12: mov r1 r2
13: mov r2 r4
14: j 9
15: store r2 5(r30)
16: jr ra

Binary:

0: 011010_00000000000000000000000101
1: 0010111_11110_00101_0000000000000101
2: 010110_00101_00000_0000000000000000


5: 010001_00000_00000_0000000000000001
6: 010001_00000_00001_0000000000000000
7: 010001_00000_00010_0000000000000001
8: 010101_00000_00011_0000000000000000
9: 010010_00000_00011_0000000000001111
10: 000001_00000_00000_0000000000000001
11: 000000_00001_00010_00100_00000000000
12: 010000_00010_00001_0000000000000000
13: 010000_00100_00010_0000000000000000
14: 010100_00000000000000000000001001
15: 011000_11110_00010_0000000000000101
16: 011001_11111_00000_0000000000000000
```
The first simulation we are calculating the 30th term of Fibonacci Series (fibo(30) = 832040):

![Fibonacci Simulation 1](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/Fibo_Simulation1.png)

The second simulation we are calculating the 15th term of Fibonacci Series (fibo(15) = 610):

![Fibonacci Simulation 2](https://github.com/LZafiro/32-bits-MIPS-Based-Processor/blob/master/Images/Fibo_Simulation2.png)

# Credits

Developed by: Luiz Felipe Raveduti Zafiro
