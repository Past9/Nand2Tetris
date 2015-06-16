// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.


    @R2
    M=0

    @R0
    D=M
    @prodinc
    M=D         // prodinc = R0

    @R1
    D=M
    @counter
    M=-D        // counter = -R1

    @1
    D=A
    @inc
    M=D         // inc = 1


    @R1
    D=M
    @LOOP
    D;JGE       // if R1 >= 0 goto LOOP


    @prodinc
    M=-M        // prodinc = -prodinc

    //@counter    
    //M=-M        // counter = -counter

    @inc
    M=-M        // inc = -inc

(LOOP)

    @counter
    D=M
    @END
    D;JEQ       // if counter = 0 goto END
    
    @prodinc
    D=M
    @R2
    M=M+D      // increment R2 by prodinc each loop

    @inc
    D=M
    @counter    
    M=M+D       // increment counter by inc each loop

    @LOOP
    0;JMP       // loop



(END)
    @END
    0;JMP