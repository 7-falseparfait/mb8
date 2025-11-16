use crate::vm::{Role, VirtualMachine};

impl VirtualMachine {
    pub fn halt(&mut self) {
        if let Role::Judge = self.role {
            self.halted = true;
        } else {
            self.registers.clear();
            self.switch_context(Role::Judge);
        }
    }
}

#[cfg(test)]
mod tests {
    use mb8_isa::opcodes::Opcode;

    use super::*;

    #[test]
    fn test_opcode_halt() {
        // VM halts execution when HALT opcode is encountered
        let mut vm = VirtualMachine::default();
        assert!(!vm.halted);
        vm.execute(&Opcode::Halt);
        assert!(vm.halted);
    }
}
