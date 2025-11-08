use mb8_isa::{opcodes::Opcode, registers::Register};

use crate::registers::Registers;

const MEMORY_SIZE: usize = 65536;

/// MB8 Virtual Machine
#[derive(Debug)]
pub struct VirtualMachine {
    mem: Box<[u8; MEMORY_SIZE]>,
    registers: Registers,
    halted: bool,
}

impl VirtualMachine {
    pub fn new() -> Self {
        Self {
            #[allow(clippy::unwrap_used)]
            mem: vec![0; MEMORY_SIZE].into_boxed_slice().try_into().unwrap(),
            registers: Registers::default(),
            halted: false,
        }
    }

    /// Load memory into the virtual machine.
    pub fn load_memory(&mut self, data: &[u8]) {
        for (i, &byte) in data.iter().enumerate() {
            self.mem[i] = byte;
        }
    }

    /// Execute a single instruction.
    pub fn execute(&mut self, instruction: &Opcode) {
        match instruction {
            Opcode::Nop => {}
            Opcode::Halt => {
                self.halted = true;
            }
        }
    }

    /// Execute a program.
    pub fn run(&mut self) {
        while !self.halted {
            let pc = self.registers.read(Register::PC);
            self.registers.write(Register::PC, pc.saturating_add(2));

            let Some(op) = self.mem.get(pc as usize) else {
                continue;
            };
            let Some(args) = self.mem.get(pc as usize + 1) else {
                continue;
            };
            let binary_opcode = [op, args];

            let opcode = match binary_opcode[0] {
                0x00 => Opcode::Nop,
                0xF0 => Opcode::Halt,
                _ => panic!("Unknown opcode"),
            };

            self.execute(&opcode);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_opcode_nop() {
        let mut vm = VirtualMachine::new();
        vm.execute(&Opcode::Nop);
    }
}
