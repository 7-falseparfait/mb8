#include "../../asm/cpu.asm"
#include "include.asm"

#bank rom

start:
    LDI_I NEXT_MOVE_ADDR
    LDI R0 DOWN_BRUSH
    STG R0 R0
    YIELD
.loop:
    LDI R0 MOVE_RIGHT
    STG R0 R0
    YIELD
    YIELD
    YIELD
    YIELD

    LDI R0 MOVE_DOWN
    STG R0 R0
    YIELD
    YIELD
    YIELD
    YIELD

    LDI R0 MOVE_LEFT
    STG R0 R0
    YIELD
    YIELD

    LDI R0 MOVE_UP
    STG R0 R0
    YIELD
    YIELD

    LDI R0 MOVE_LEFT
    STG R0 R0
    YIELD
    YIELD

    LDI R0 MOVE_DOWN
    STG R0 R0
    YIELD
    YIELD
    YIELD
    YIELD

    LDI R0 MOVE_RIGHT
    STG R0 R0
    YIELD
    YIELD
    YIELD
    YIELD
    YIELD
    YIELD

    LDI R0 MOVE_UP
    STG R0 R0
    YIELD
    YIELD

    LDI R0 MOVE_RIGHT
    STG R0 R0
    YIELD

    JMP .loop
