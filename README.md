# Coursera-nand2tetris

## Part 1

### Week1

**NAND** Gate:

| A    | B    | Output |
| :--- | ---- | ------ |
| 0    | 0    | 1      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 0      |

From NAND to build **NOT** Gate:

NOT Gate:

| In   | output |
| ---- | ------ |
| 0    | 1      |
| 1    | 0      |

- Since A=0 and B=0 will output 1 which implies in=0 and output=1.
- Since A=1 and B=1 will output 0 which implies in=1 and output=0.

From NAND and NOT to build **AND** Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 0      |
| 1    | 0    | 0      |
| 1    | 1    | 1      |

- Since all outputs of NAND gate are opposite to AND gate, the implementation should be first using results of NAND gate and then using NOT gate to get all opposite values of NAND gate. 

From NAND and NOT to build **OR** Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 1      |

- Differences between OR and NAND are a=b=0 and a=b=1. Thus, the implementation should be using NOT gate to get inverse value of  input A and input B, and then it should be using NAND to get values by result of NOT.

From NOT and AND to build **Xor** Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 0      |

- Xor gate = (a And Not(b)) Or (Not(a) And (b))

From NOT and AND and OR to build **Mux** Gate:

| a    | b    | sel  | OUTPUT |
| ---- | ---- | ---- | ------ |
| 0    | 0    | 0    | 0      |
| 0    | 1    | 0    | 0      |
| 1    | 0    | 0    | 1      |
| 1    | 1    | 0    | 1      |
| 0    | 0    | 1    | 0      |
| 0    | 1    | 1    | 1      |
| 1    | 0    | 1    | 0      |
| 1    | 1    | 1    | 1      |

- Mux gate has a sel to control its output. If sel == 1: out=a, else out=b.
- Mux =(a And Not(sel)) Or (b And sel)

From NOT and AND to build **DMux** Gate:

| in   | sel  | a    | b    |
| ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    |
| 0    | 1    | 0    | 0    |
| 1    | 0    | 1    | 0    |
| 1    | 1    | 0    | 1    |

- DMux gate has two outputs a and b.
- [a, b] = [in, 0] if sel == 0, [0, in] if sel == 1.
- First, we should get Not(sel) for output a, and then using And to produce two outputs (a, b).

From NOT to build **NOT16** Gate:

| in               | out              |
| ---------------- | ---------------- |
| 0000000000000000 | 1111111111111111 |
| 1111111111111111 | 0000000000000000 |
| 1010101010101010 | 0101010101010101 |
| 0011110011000011 | 1100001100111100 |
| 0001001000110100 | 1110110111001011 |

- Simple. We just need to Not all 16 for all in[0...15].

From AND to build **AND16** Gate:

| a                | b                | out              |
| ---------------- | ---------------- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 |
| 0000000000000000 | 1111111111111111 | 0000000000000000 |
| 1111111111111111 | 1111111111111111 | 1111111111111111 |
| 1010101010101010 | 0101010101010101 | 0000000000000000 |
| 0011110011000011 | 0000111111110000 | 0000110011000000 |
| 0001001000110100 | 1001100001110110 | 0001000000110100 |

- Simple. We just need to AND all 16 for all a[0...15] and b[0...15].

From OR to build **OR16** Gate:

| a                | b                | out              |
| ---------------- | ---------------- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 |
| 0000000000000000 | 1111111111111111 | 1111111111111111 |
| 1111111111111111 | 1111111111111111 | 1111111111111111 |
| 1010101010101010 | 0101010101010101 | 1111111111111111 |
| 0011110011000011 | 0000111111110000 | 0011111111110011 |
| 0001001000110100 | 1001100001110110 | 1001101001110110 |

- Simple, same as AND16.

From Muxto build **Mux16** Gate:

| A                | B                | SEL  | OUT              |
| ---------------- | ---------------- | ---- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0    | 0000000000000000 |
| 0000000000000000 | 0000000000000000 | 1    | 0000000000000000 |
| 0000000000000000 | 0001001000110100 | 0    | 0000000000000000 |
| 0000000000000000 | 0001001000110100 | 1    | 0001001000110100 |
| 1001100001110110 | 0000000000000000 | 0    | 1001100001110110 |
| 1001100001110110 | 0000000000000000 | 1    | 0000000000000000 |
| 1010101010101010 | 0101010101010101 | 0    | 1010101010101010 |
| 1010101010101010 | 0101010101010101 | 1    | 0101010101010101 |

- ​	Simple, same as AND16 and OR16.

From OR to build **Or8Way** Gate:

| in       | out  |
| -------- | ---- |
| 00000000 | 0    |
| 11111111 | 1    |
| 00010000 | 1    |
| 00000001 | 1    |
| 00100110 | 1    |

- Simple, we only need to compare each elements and check if there is a "1" exists. 

From Mux16 to build **Mux4Way16** Gate:

| a                | b                | c                | d                | sel  | out              |
| ---------------- | ---------------- | ---------------- | ---------------- | ---- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 00   | 0000000000000000 |
| 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 01   | 0000000000000000 |
| 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 10   | 0000000000000000 |
| 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 11   | 0000000000000000 |
| 0001001000110100 | 1001100001110110 | 1010101010101010 | 0101010101010101 | 00   | 0001001000110100 |
| 0001001000110100 | 1001100001110110 | 1010101010101010 | 0101010101010101 | 01   | 1001100001110110 |
| 0001001000110100 | 1001100001110110 | 1010101010101010 | 0101010101010101 | 10   | 1010101010101010 |
| 0001001000110100 | 1001100001110110 | 1010101010101010 | 0101010101010101 | 11   | 0101010101010101 |

- Using 3 Mux16 gates compare with sel[0].
- And then using the results of previous Mux16 gates compare with sel[1].

From Mux16 to build **Mux8Way16** Gate:

- 7 Mux16 gates.

From DMux to build **DMux4Way** Gate:

| in   | sel  | a    | b    | c    | d    |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 00   | 0    | 0    | 0    | 0    |
| 0    | 01   | 0    | 0    | 0    | 0    |
| 0    | 10   | 0    | 0    | 0    | 0    |
| 0    | 11   | 0    | 0    | 0    | 0    |
| 1    | 00   | 1    | 0    | 0    | 0    |
| 1    | 01   | 0    | 1    | 0    | 0    |
| 1    | 10   | 0    | 0    | 1    | 0    |
| 1    | 11   | 0    | 0    | 0    | 1    |

- Using DMux gates to get results when sel[1].
- Using these two results to produces outputs.

From DMux to build **DMux8Way** Gate:

- Same as DMux4way.

### Week 2

From Xor and AND to build **HalfAdder** Gate:

| a    | b    | sum  | carry |
| ---- | ---- | ---- | ----- |
| 0    | 0    | 0    | 0     |
| 0    | 1    | 1    | 0     |
| 1    | 0    | 1    | 0     |
| 1    | 1    | 0    | 1     |

- Sum of HalfAdder = Xor(a, b)
- Carry of HalfAdder = And(a, b)

From HalfAdder and OR to build **FullAdder** Gate:

| a    | b    | c    | sum  | carry |
| ---- | ---- | ---- | ---- | ----- |
| 0    | 0    | 0    | 0    | 0     |
| 0    | 0    | 1    | 1    | 0     |
| 0    | 1    | 0    | 1    | 0     |
| 0    | 1    | 1    | 0    | 1     |
| 1    | 0    | 0    | 1    | 0     |
| 1    | 0    | 1    | 0    | 1     |
| 1    | 1    | 0    | 0    | 1     |
| 1    | 1    | 1    | 1    | 1     |

- FullAdder = OR (HalfAdder, HalfAdder)

From HalfAdder and FullAdder to build **Add16** Gate:

| A                | B                | OUT              |
| ---------------- | ---------------- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 |
| 0000000000000000 | 1111111111111111 | 1111111111111111 |
| 1111111111111111 | 1111111111111111 | 1111111111111110 |
| 1010101010101010 | 0101010101010101 | 1111111111111111 |
| 0011110011000011 | 0000111111110000 | 0100110010110011 |
| 0001001000110100 | 1001100001110110 | 1010101010101010 |

- HalfAdder gets sum=out[0] and first carray
- Rest of FullAdder are adding each elements

From Add16 to build **Inc16** Gate:

| in               | out              |
| ---------------- | ---------------- |
| 0000000000000000 | 0000000000000001 |
| 1111111111111111 | 0000000000000000 |
| 0000000000000101 | 0000000000000110 |
| 1111111111111011 | 1111111111111100 |

- Previous Add16(a=in, b=true, out=out)
- true = 1

From Mux16, Not16, Add16, And16, Or16Way, Or16 to build ALU:

- Mux can be used as if statements.
- Created a helper function called Or16Way(in[16]) = out[16], which compares with in[0] or in[1] or ... or in[15].



### Week3

**DFF** Gate (Data Flip-flop):

- out(t) = in(t - 1)
- used for maintain state

From Mux and DFF to build **1-Bit Register**:

- if load(t - 1) then out(t) = in(t - 1)
- else out(t) = out(t - 1)
- DFF would have another output for Mux to read

From 1-Bit Register to build **16-Bit Register**:

- Simple. It is implemented as 16 Bits with same input and output.

From DMux8Way, 16-Bit Register and Mux8Way16 to build **RAM8**:

- RAM8 is memory of 8 registers. Each of them has 16 bit-wide.
- DMux8Way decodes load and address. Then it passes all 8 values into 8 different registers, which gives registers a sign that one of them is selected.
- Mux8Way16 encodes output values from registers. 

From DMux8Way, RAM8 and Mux8Way16 to build **RAM64**:

- It is very similar to RAM8, but there is a difference between them is RAM64 has a 6-bit address.
- To select the register from RAM64, the way we are doing is separate this address, say *xxxyyy*, into two parts. 
- First, xxx is used to select one of the RAM8 (a chip in memory bank). For instance, there are 8 RAM8s, which are a, b, c, ..., h. The xxx is used to select one of them. 0 -> a, 1 ->b and so on.
- Second, yyy is used to select one of the register within the selected RAM8.

From DMux8Way, RAM64 and Mux8Way16 to build **RAM512**:

- Same thing as RAM64 but a larger address (0 ~ 8), because of  2^9 = 512.

From DMux8Way, RAM512 and Mux8Way16 to build **RAM4K**:

- Still the same but a larger address (0 ~ 11), because of 2^12 = 4096.

From DMux4Way, RAM4K and Mux4Way16 to build **RAM16K**:

- There are 4 RAM4K to build this RAM.
- And we should use address[0..11] to select one of the RAM4K chips.
- Used address[12..13] to select one of the register within the selected RAM4K.

From Inc16, Mux16 and 16-Bit Register to build **PC**:

- 16-bit program counter includes a 16-bit register and combinational logic.
- We should use Inc16 anywhere, because PC must be increased by 1.
- Using Mux to determine if load/reset/inc == 1.



### Week4

**Mult**:

| RAM[0] | RAM[1] | RAM[2] |
| ------ | ------ | ------ |
| 0      | 0      | 0      |
| 1      | 0      | 0      |
| 0      | 2      | 0      |
| 3      | 1      | 1      |
| 2      | 4      | 8      |
| 6      | 7      | 42     |

- Multiplication is defined by sum of two numbers, which implemented by a loop. In hack language, it should be implemented jump features.

**Fill**:

| RAM[16384] | RAM[17648] | RAM[18349] | RAM[19444] | RAM[20771] | RAM[21031] | RAM[22596] | RAM[23754] | RAM[24575] |
| ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- |
| 0          | 0          | 0          | 0          | 0          | 0          | 0          | 0          | 0          |
| -1         | -1         | -1         | -1         | -1         | -1         | -1         | -1         | -1         |
| 0          | 0          | 0          | 0          | 0          | 0          | 0          | 0          | 0          |

- Fill is a program that runs an infinite loop that reads user inputs from keyboard.