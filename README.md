# Introdução

O objetivo desse projeto consiste em desenvolver um computador que a arquitetura de Von Neumann ou alguma variação, sendo completamente modular,manufaturável, e com uma linguagem robusta o bastante para poder permitir a programação de jogos.

Ou seja
- Design Manufaturável e Modular
- Precisa ser capaz de rodar jogos e interagir com elementos gráficos (Desenhar em um monitor através de uma interface VGA)
- Ter uma plataforma de hardware que permita um sistema operacionale seja "compatível com a o HACK Computer de Elements of Computing system"

# Instruction Set

### In CPU Memory
Register 1 -> RAM Memory  (O_REG01)
// Register that symbolically has the value of the Memory[N] slot in the RAM Unit 
Register 2 -> VRAM Memory (O_REG02)
// Register that symbolically has the value of the Video Memory[N] slot in the VRAM Unit
Register 3 -> Cache Register 2 - ALU Operand 1 (x) (L_REG01)
// Cache Memory that can be stored inside the CPU
Register 4 -> Cache Register 3 - ALU Operand 2 (y) (L_REG02)
// Chache Memory that also are stored inside the CPU

// Registers who sole purpouse is to store addresses for the O_REG01 and O_REG02 and to be used in the WRITE_M Command
// When i say Binded i mean that when you change Registers 6 and 5 you will also change the values in Registers 1 and 2, (They are 'Virtual Registers')

Register 5  -> Address Cache/selector regiter (ADDR_REG01)
// This register is binded to O_REG01
Register 6  -> Address Cache/selector register (ADDR_REG02)
// This register is binded to O_REG02

Register 7 -> It's just the output of the ALU

Registers 3 and 4 are often used to cache ALU Outputs

### ALU Operations
being x and y a set of n bits that fed in the ALU by the control unit. the available operations 
suplied by the ALU are:


function op_code

#### Arithmetic Operations
1. x + y: 0 000
2. x - y: 0 001
3. y - x: 0 010
4. -x   : 0 011
5. -y   : 0 100
6. x + 1: 0 101
7. y + 1: 0 110
15. x + y + 1 :  0 111
#### Logic Operations

8. !x   : 1 000
9. !y   : 1 001
10. x & y: 1 010
11. x | y: 1 011

12. 0   : 1 100
13. 1   : 1 101
14. -1  : 1 110



### Micro Instructions

Register Binary Codes

NO REGISTER : 000
L_REG1      : 001
L_REG2      : 010
ADDR_REG1   : 011
ADDR_REG2   : 100
Vi_REG1     : 101 
Vi_REG2     : 110
ALU_OUT     : 111


Micro Instructions 

LD <DESTINATION_REGISTER>, <ORIGIN_REGISTER> 
LDV <DESTINATION_REGISTER>, <VALUE>

COMP <DESTINATION_REGISTER> = <REGISTER_1> <OP> <REGISTER_2>

JMP <JUMP_COMMAND> <INSTRUCTION_LINE>

NOP -> NO JUMP                                  : 00 
JLZ -> Jump if ALU Output less than zero        : 01 
JNZ -> Jump if ALU Output greater than zero     : 10 
JUN -> Unconditional Jump just jump to the line : 11

Complete list

Intruction type Code
00 SWP INSTRUCTION
01 LD INSTRUCTION
10 CMP INSTRUCTION
11 JMP INSTRUCTION

LD <DESTINATION_REGISTER>, <ORIGIN_REGISTER>      : 00 | d1 d2 d3 | o1 o2 o3 | 0000 00000 00000 00
LDV <DESTINATION_REGISTER>, <VALUE>               
: 01 d1 d2 d3 | v1 v2 v3 v4 | v5 v6 v7 v8 | v9 v10 v11 v12 | v13 v14 v15 v6 | 000

CMP <DESTINATION_REGISTER> = <REGISTER_1> <OP> <REGISTER_2> : 10 | d1 d2 d3 | x1 x2 x3 | y1 y2 y3 | c1 c2 c3 c4 | 0

JMP <JUMP_CODE>, <LINE> : 11 | j1 j2 | i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i 14 i 15 i16 | 0000 0

There are 4 possible Jump instructions
There are 14 possible Compute operations

With the Load and Swap commands we have a total of 20 micro instructions that comunicate directly with the CPU. 

**OBS: EM UMA WORD 0000 0000 0000 000(0)** ESSE ENTRE PARENTESES É O BIT MENOS SIGNIFICATIVO, E EM NOTAÇÃO DE ARRAY É ACESSADO ASSIM WORD[0] ou seja o bit menos significativo é o zero