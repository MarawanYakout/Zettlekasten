# x86_64 NASM Assembly Curriculum (Linux)

This directory contains a progressive series of assembly files designed to take you from the absolute basics to advanced concepts using industrial-grade coding standards.

## Prerequisites
To assemble and run these files, you need:
1.  **NASM (Netwide Assembler):** `sudo apt install nasm`
2.  **Binutils (for `ld` linker):** `sudo apt install binutils`

## Compilation Workflow

Every program in this series is compiled and linked using two commands:

1.  **Assemble:** Converts `.asm` (source) to `.o` (object file).
    ```bash
    nasm -f elf64 src/01_hello_world.asm -o 01.o
    ```
2.  **Link:** Converts `.o` to an executable.
    ```bash
    ld 01.o -o 01_hello
    ```
3.  **Run:**
    ```bash
    ./01_hello
    ```

## Curriculum Overview

| File | Primary Topic |
| :--- | :--- |
| `01_hello_world.asm` | Program structure and Syscalls |
| `02_registers_and_moves.asm` | Data movement and Register sizing |
| `03_arithmetic.asm` | Math operations and the RFLAGS register |
| `04_control_flow.asm` | Comparisons and Loops |
| `05_stack_and_functions.asm` | Calling conventions (ABI) and Functions |
| `06_memory_addressing.asm` | Pointers and complex addressing modes |
| `07_bitwise_operations.asm` | Logical gates and Bit shifts |
| `08_system_calls_io.asm` | Reading user input from stdin |
| `09_arrays_and_strings.asm` | Fast memory manipulation (MOVSB/SCASB) |
| `10_macros_and_advanced.asm` | Preprocessor directives and Macros |

## Debugging Tips
To see what's happening inside the CPU registers:
1.  Compile with debug symbols: `nasm -f elf64 -g src/01_hello_world.asm -o 01.o`
2.  Run with GDB: `gdb ./01_hello`
3.  Inside GDB, use:
    -   `layout asm`: View the assembly code.
    -   `layout regs`: View register values in real-time.
    -   `stepi`: Execute one instruction.
    -   `info registers`: Print current register states.

## Industrial Best Practices
- **Standard Syscalls:** We use the `syscall` instruction (the x86_64 standard) instead of `int 0x80` (the legacy 32-bit method).
- **ABI Compliance:** Functions follow the System V AMD64 ABI, making them compatible with C/C++ code.
- **Sectioning:** Code is organized into `.data`, `.bss`, and `.text` for memory efficiency and security (NX bits).
