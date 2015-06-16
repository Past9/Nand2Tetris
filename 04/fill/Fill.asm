// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

    @dark
    M=-1             // word to copy to darken screen

    @light
    M=0             // word to copy to lighten screen

    @cur_screen_state
    M=0             // current word applied to screen (assume it starts light)

    @should_screen_state
    D=0             // state screen should be in according to keyboard state.
                    // Assume light at start, but will be changed during loop
                    // anyway.



(IO_LOOP)

    @should_screen_state
    M=0             // start each loop assuming screen should be light

    @24576
    D=M             // keyboard state -> D
    @DECIDE_SCREEN_STATE
    D;JEQ           // if no keys pressed, jump to decision about whether to change
                    // screen state...

    @should_screen_state
    M=-1             // ...otherwise, screen should be dark

(DECIDE_SCREEN_STATE)
    @should_screen_state
    D=M
    @cur_screen_state
    D=D+M           // If we add cur_screen_state and should_screen_state and they
    D=D+1           // are different, the result should always come out to -1, so 
    @CHANGE_SCREEN  // we change the screen if that is the case.
    D;JEQ

    @IO_LOOP
    0;JMP



(CHANGE_SCREEN)
    
    @should_screen_state
    D=M
    @cur_screen_state
    M=D             // cur_screen_state = should_screen_state

    @16384
    D=A
    @i
    M=D             // i = starting screen memory address (16384)

(SCREEN_LOOP)

    @cur_screen_state
    D=M             // cur_screen_state -> D

    @i              
    A=M             // screen_address -> A
    M=D             // screen memory = cur_screen_state

    @i
    M=M+1           // i += 1
    D=M
    @24576
    D=D-A
    @IO_LOOP
    D;JEQ

    @SCREEN_LOOP
    0;JMP

    





