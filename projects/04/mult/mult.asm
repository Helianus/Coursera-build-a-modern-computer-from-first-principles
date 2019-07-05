// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2     // 0: A = 2, M := RAM[2] 
M=0     // 1: RAM[2] := 0

@R0     // 2: A = 0, M := RAM[0]
D=M     // 3: D := RAM[0]
@END    // 4: A = 23, M := RAM[23]
D;JEQ   // 5: if D == 0, goto 23

@R1     // 6: A = 1, M := RAM[1]
D=M     // 7: D := RAM[1]
@END    // 8: A = 23, M := RAM[23]
D;JEQ   // 9: if D == 0, goto 23

@0      // 10: A = 0, M := RAM[0]
D=M     // 11: D := RAM[0]
@i      // 12: A = 3, M := RAM[3]
M=D     // 13: RAM[3] := 0

(LOOP)
@R1     // 14: RAM[1] = 2nd num
D=M     // 15: D := RAM[1]

@R2     // 16: RAM[2] = sum
M=D+M   // 17: M := 2nd + 1st nums

@i      // 18: RAM[3] = 1st num
M=M-1   // 19: 1st num - 1
D=M     // 20: D := RAM[3] - 1

@LOOP   // 21: A = 14, M := RAM[14]
D;JGT   // 22: if D > 0, goto 14

(END)
@END    // 23: A = 23, M := RAM[23]
0,JMP   // Infinite loop