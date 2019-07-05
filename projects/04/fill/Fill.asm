// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RESTART)
@SCREEN     // 0: A = 16384, M := RAM[16384]
D=A         // 1: D = RAM[16384]
@R0         // 2: A = 0, M := RAM[0]
M=D         // 3: RAM[0] := RAM[16384]

(KEYBOARD)
@KBD        // 4: A = 24576, M := RAM[24576]
D=M         // 5: D = RAM[24676]
@BLACK      // 6: A = 12, M := RAM[12]
D;JGT       // 7: if any keys are pressed
@WHITE      // 8: A = 16, M := RAM[16]
D;JEQ       // 9: else jump to white

@KEBCHECH   // 10: A = 4, M: RAM[4]
0;JMP       // 11: jump to KEB

(BLACK)
@R1         // 12: A = 1, M := RAM[1]
M=-1        // 13: M := -1 = 11111111111111
@CHANGE     // 14: A = 20, M := RAM[20]
0;JMP       // 15: jump to change

(WHITE)
@R1         // 16: A = 1, M := RAM[1]
M=0         // 17: M := 0
@CHANGE     // 18: A = 20, M := RAM[20]
0;JMP       // 19: jump to change

(CHANGE)
@R1         // 20: A = 1, M := RAM[1]
D=M         // 21: contains black or white

@R0         // 22: A = 0, M := RAM[0] 
A=M         // 23: get addr of screen to fill
M=D         // 24: fill it

@R0         // 25: A = 0, M := RAM[0]
D=M+1       // 26: go to next pixel
@KBD        // 27: A = 24576, M := RAM[24576]
D=A-D       // 28: KED - SCREEN = A

@R0         // 29: A = 0, M := RAM[0]
M=M+1       // 30: go to next pixel
A=M         // 31: A = next pixel

@CHANGE     // 32: A = 20, M := RAM[20]
D;JGT       // 33: if D == 0, black screen

@RESTART    // 34: A = 0, M := RAM[0]
0;JMP       // 35: infinite loop