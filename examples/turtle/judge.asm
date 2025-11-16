#include "../../asm/cpu.asm"
#include "../../asm/ext.asm"
#include "include.asm"

#bank ram
#addr 0x000
SPRITE:
    #d 0b1000_0000

#bank rom

start:
.init:
    LDI R0 0                ; X
    LDI R1 0                ; Y
    LDI R2 NOT_DRAWING      ; Brush
    LDI R3 1                ; Step
    LDI R6 0                ; Bot id
    LDI_I NEXT_MOVE_ADDR
.move:
    YIELD R6
    LDG R4 R6

    CMPI R4 MOVE_SKIP
    JZ .move

    CMPI R4 MOVE_RIGHT
    JZ .move_right

    CMPI R4 MOVE_LEFT
    JZ .move_left

    CMPI R4 MOVE_UP
    JZ .move_up

    CMPI R4 MOVE_DOWN
    JZ .move_down

    CMPI R4 DOWN_BRUSH
    JZ .down_brush

    CMPI R4 UP_BRUSH
    JZ .up_brush

    CMPI R4 STOP
    JZ .stop

    HALT
.move_right:
    ADD R0 R3
    JMP .after_move

.move_left:
    SUB R0 R3
    JMP .after_move

.move_up:
    SUB R1 R3
    JMP .after_move

.move_down:
    ADD R1 R3
    JMP .after_move

.down_brush:
    LDI R2 DRAWING
    JMP .after_move

.up_brush:
    LDI R2 NOT_DRAWING
    JMP .after_move

.after_move:
    CMPI R2 DRAWING
    JNZ .move
    DRAW R0 R1 1
    JMP .move

.stop:
    JMP .stop
