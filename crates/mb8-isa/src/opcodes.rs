//! Opcodes for the MB8 ISA.
//! This module defines the opcodes used by the MB8 ISA.

/// Full list of MB8 opcodes used in VM.
#[derive(Debug)]
pub enum Opcode {
    /// No operation. Instruction does nothing.
    Nop,
    /// Halt the VM.
    Halt,
}
