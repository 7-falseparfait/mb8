use mb8_isa::registers::Register;

use crate::vm::VirtualMachine;

impl VirtualMachine {
    pub fn mov(&mut self, dst: Register, src: Register) {
        let value = self.registers.read(src);
        self.registers.write(dst, value);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_opcode_mov() {
        // VM moves registers values from source register to destination register
        let mut vm = VirtualMachine::new();
        vm.registers.write(Register::R0, 42);
        vm.mov(Register::R1, Register::R0);
        assert_eq!(vm.registers.read(Register::R1), 42);
    }
}
