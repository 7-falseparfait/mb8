use mb8_isa::{encode::encode_program, opcodes::Opcode};

mod mem;
mod ops;
mod registers;
mod vm;

const DEFAULT_PROGRAM: &[Opcode] = &[Opcode::Nop, Opcode::Halt];

fn main() {
    let mut vm = vm::VirtualMachine::new();

    vm.load_memory(&encode_program(DEFAULT_PROGRAM));
    vm.run();
}
