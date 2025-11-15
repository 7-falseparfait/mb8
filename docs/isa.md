# Instruction Set

## System instructions

### NOP

**Syntax**:
```asm
NOP
```

**Args**: None

**Encoding**:
```
0000 0000 0000 0000
```

**Hex**: `0x0000`

**Flags**: None

**Description**: No operation

### HALT

**Syntax**:
```asm
HALT [X]
```

**Args**:
- **X** - exit_code (optional)

**Encoding**:
```
0000 0000 XXXX XXXX
```

**Hex**: `0x01XX`

**Flags**: None

**Description**: Stop the execution of the program
