start:
    LDI R0 0x10
    LDI R1 1
loop:
    ADD R0 R1
    JNZ loop
    HALT
