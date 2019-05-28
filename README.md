# Coursera-build-a-modern-computer-from-first-principles

## Part 1

### Week1

NAND Gate:

| A    | B    | Output |
| :--- | ---- | ------ |
| 0    | 0    | 1      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 0      |

From NAND to build NOT Gate:

NOT Gate:

| In   | output |
| ---- | ------ |
| 0    | 1      |
| 1    | 0      |

- Since A=0 and B=0 will output 1 which implies in=0 and output=1.
- Since A=1 and B=1 will output 0 which implies in=1 and output=0.

From NAND and NOT to build AND Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 0      |
| 1    | 0    | 0      |
| 1    | 1    | 1      |

- Since all outputs of NAND gate are opposite to AND gate, the implementation should be first using results of NAND gate and then using NOT gate to get all opposite values of NAND gate. 

From NAND and NOT to build OR Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 1      |

- Differences between OR and NAND are a=b=0 and a=b=1. Thus, the implementation should be using NOT gate to get inverse value of  input A and input B, and then it should be using NAND to get values by result of NOT.

From NOT and AND to build XOR Gate:

| A    | B    | OUTPUT |
| ---- | ---- | ------ |
| 0    | 0    | 0      |
| 0    | 1    | 1      |
| 1    | 0    | 1      |
| 1    | 1    | 0      |

- Xor gate = (a And Not(b)) Or (Not(a) And (b))

From NOT and AND and OR to build MUX Gate:

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

From NOT and AND to build DMUX Gate:

| in   | sel  | a    | b    |
| ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    |
| 0    | 1    | 0    | 0    |
| 1    | 0    | 1    | 0    |
| 1    | 1    | 0    | 1    |

- DMux gate has two outputs a and b.
- [a, b] = [in, 0] if sel == 0, [0, in] if sel == 1.
- First, we should get Not(sel) for output a, and then using And to produce two outputs (a, b).

From NOT to build NOT16 Gate:

| in               | out              |
| ---------------- | ---------------- |
| 0000000000000000 | 1111111111111111 |
| 1111111111111111 | 0000000000000000 |
| 1010101010101010 | 0101010101010101 |
| 0011110011000011 | 1100001100111100 |
| 0001001000110100 | 1110110111001011 |

- Simple. We just need to Not all 16 for all in[0...15].

From AND to build AND16 Gate:

| a                | b                | out              |
| ---------------- | ---------------- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 |
| 0000000000000000 | 1111111111111111 | 0000000000000000 |
| 1111111111111111 | 1111111111111111 | 1111111111111111 |
| 1010101010101010 | 0101010101010101 | 0000000000000000 |
| 0011110011000011 | 0000111111110000 | 0000110011000000 |
| 0001001000110100 | 1001100001110110 | 0001000000110100 |

- Simple. We just need to AND all 16 for all a[0...15] and b[0...15].

From OR to build OR16 Gate:

| a                | b                | out              |
| ---------------- | ---------------- | ---------------- |
| 0000000000000000 | 0000000000000000 | 0000000000000000 |
| 0000000000000000 | 1111111111111111 | 1111111111111111 |
| 1111111111111111 | 1111111111111111 | 1111111111111111 |
| 1010101010101010 | 0101010101010101 | 1111111111111111 |
| 0011110011000011 | 0000111111110000 | 0011111111110011 |
| 0001001000110100 | 1001100001110110 | 1001101001110110 |

- Simple, same as AND16.

From MUX to build MUX16 Gate:

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

From Or to build OR8WAY Gate:

| in       | out  |
| -------- | ---- |
| 00000000 | 0    |
| 11111111 | 1    |
| 00010000 | 1    |
| 00000001 | 1    |
| 00100110 | 1    |

- Simple, we only need to compare each elements and check if there is a "1" exists. 

From MUX16 to build MUX4WAY16 Gate:

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

From MUX16 to build MUX8WAY16 Gate:

- 7 Mux16 gates.

From DMUX to build DMUX4WAY Gate:

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

From DMUX to build DMUX8WAY Gate:

- Same as DMux4way.