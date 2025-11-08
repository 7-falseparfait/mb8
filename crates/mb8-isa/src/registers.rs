//! Register definitions for the MB8 VM.

/// List of registers supported by the MB8 VM.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Register {
    /// General-purpose register 0
    R0,
    /// General-purpose register 1
    R1,
    /// General-purpose register 2
    R2,
    /// General-purpose register 3
    R3,
    /// Stack pointer
    SP,
    /// Program counter
    PC,
    /// Flag register
    F,
}
