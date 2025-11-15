#include "../asm/cpu.asm"
#include "../asm/ext.asm"

M_ADDR = 0x0100
B_ADDR = 0x0200
EIGHT_ADDR = 0x0300

Y = 13
X_SPACE = 7
SPRITE_HEIGHT = 5

#bank ram

#addr M_ADDR
M_LETTER:
    #d8 0b0100_0100
    #d8 0b0111_1100
    #d8 0b0101_0100
    #d8 0b0100_0100
    #d8 0b1110_1110
#addr B_ADDR
B_LETTER:
    #d8 0b0111_1100
    #d8 0b0100_0010
    #d8 0b0101_1100
    #d8 0b0100_0010
    #d8 0b0111_1100
#addr EIGHT_ADDR
EIGHT_LETTER:
    #d8 0b0001_1000
    #d8 0b0110_0110
    #d8 0b0011_1100
    #d8 0b0110_0110
    #d8 0b0001_1000

#bank rom

start:
.init:
    LDI R1 Y
    LDI R0 0 ; Start X
    CALL .draw
.step:
    CALL .draw
    DEC R0 1
    CALL .draw
    JMP .step
.draw:
    ; Draw M symbol
    MOV R3 R0
    LDI_I M_ADDR
    DRAW R3 R1 SPRITE_HEIGHT
    ; Draw B symbol
    INC R3 X_SPACE
    LDI_I B_ADDR
    DRAW R3 R1 SPRITE_HEIGHT
    ; Draw 8 symbol
    INC R3 X_SPACE
    LDI_I EIGHT_ADDR
    DRAW R3 R1 SPRITE_HEIGHT
    RET
