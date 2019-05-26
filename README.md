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

- ​	Since all outputs of NAND gate are opposite to AND gate, the implementation should be first using results of NAND gate and then using NOT gate to get all opposite values of NAND gate. 

