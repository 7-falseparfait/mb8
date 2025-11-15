; ===============
; Draw a rectangle
; ===============
; Simple program that draws a rectangle on the screen.

#include "../asm/cpu.asm"
#include "../asm/ext.asm"

WIDTH = 64
HEIGHT = 32
X_DIRECTION_RIGHT = 0
X_DIRECTION_LEFT = 1
Y_DIRECTION_UP = 0
Y_DIRECTION_DOWN = 1
DIRECTION_MASK = 0b0000_0001
X_STEP_SIZE = 8
Y_STEP_SIZE = 1

start:
.init:
    LDI R0 1                    ; step
    LDI R1 0x8                  ; X
    LDI R2 0x8                  ; Y
    LDI R3 X_DIRECTION_RIGHT    ; X-Direction (1 - right, 2 - left)
    LDI R4 Y_DIRECTION_UP       ; Y-Direction (3 - up, 4 - down)
    LDI R7 0b1111_1111          ; Single pixel
    LDI_I 0x123                 ; Sprite data pointer
    ST R7                       ; Store sprite data pointer
.move:
    CALL x_move
    CALL y_move
    DRAW R1 R2 1
    JMP .move

x_move:
    CMPI R3 X_DIRECTION_LEFT
    JZ .left
    JMP .right
.after_move:
    MOV R5 R1
    LDI R7 X_STEP_SIZE
    ADD R5 R7
    CMPI R5 WIDTH
    JZ .change_direction
    CMPI R1 0
    JZ .change_direction
    RET
.right:
    ADD R1 R0
    JMP .after_move
.left:
    SUB R1 R0
    JMP .after_move
.change_direction:
    LDI R7 DIRECTION_MASK
    XOR R3 R7
    RET

y_move:
    CMPI R4 Y_DIRECTION_DOWN
    JZ .down
    JMP .up
.after_move:
    MOV R5 R2
    LDI R7 Y_STEP_SIZE
    ADD R5 R7
    CMPI R5 HEIGHT
    JZ .change_direction
    CMPI R2 0
    JZ .change_direction
    RET
.up:
    SUB R2 R0
    JMP .after_move
.down:
    ADD R2 R0
    JMP .after_move
.change_direction:
    LDI R7 DIRECTION_MASK
    XOR R4 R7
    RET
