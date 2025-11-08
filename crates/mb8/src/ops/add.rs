use mb8_isa::registers::Register;

use crate::vm::VirtualMachine;

const OVERFLOW_FLAG: u16 = 0x1;

impl VirtualMachine {
    pub fn add(&mut self, dst: Register, src: Register) {
        let a = u8::try_from(self.registers.read(dst)).unwrap_or_default();
        let b = u8::try_from(self.registers.read(src)).unwrap_or_default();
        let (result, overflow) = a.overflowing_add(b);
        self.registers.write(dst, u16::from(result));
        if overflow {
            self.registers.write(Register::F, OVERFLOW_FLAG);
        }
    }
}

#[cfg(test)]
mod tests {
    use mb8_isa::opcodes::Opcode;

    use super::*;

    #[test]
    fn test_opcode_add() {
        // VM adds two registers and stores the result in a third register
        let mut vm = VirtualMachine::new();
        vm.registers.write(Register::R0, 5);
        vm.registers.write(Register::R1, 3);
        vm.execute(&Opcode::Add {
            dst: Register::R0,
            src: Register::R1,
        });
        assert_eq!(vm.registers.read(Register::R0), 8);
    }

    #[test]
    fn test_opcode_add_overflow() {
        // VM handles addition overflow by wrapping around and setting the carry flag
        let mut vm = VirtualMachine::new();
        vm.registers.write(Register::R0, 255);
        vm.registers.write(Register::R1, 1);
        vm.execute(&Opcode::Add {
            dst: Register::R0,
            src: Register::R1,
        });
        assert_eq!(vm.registers.read(Register::R0), 0);
        assert_eq!(vm.registers.read(Register::F), 1);
    }
}
