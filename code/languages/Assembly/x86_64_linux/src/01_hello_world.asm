; -----------------------------------------------------------------------------
; 01_hello_world.asm - The Entry Point of Every Journey
; 
; Concept: Basic Program Structure and System Calls (Syscalls)
; Use Case: Basic output, program termination, and understanding the 
;          interface between user-space code and the Linux Kernel.
; -----------------------------------------------------------------------------

; The .data section is used for declaring initialized data or constants.
; This data does not change during runtime and is stored in the data segment.
section .data
    ; message: a label for the memory address where the string starts.
    ; db (Define Byte): allocates 1 byte per character.
    ; 0xA: The ASCII newline character (\n).
    message: db "Hello, x86_64 Assembly!", 0xA
    
    ; equ (Equal): a constant that doesn't occupy memory. 
    ; $ is the current address, 'message' is the start address.
    ; subtract them to get the length. This is an industrial best practice
    ; to avoid hardcoding lengths.
    msg_len: equ $ - message

; The .text section is where the actual executable code resides.
section .text
    ; global _start: Tells the linker where the program begins.
    ; In C, the entry point is main(), but main() is actually called by _start.
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; STEP 1: Printing to Stdout
    ; Syscall: sys_write (1)
    ; Arguments: rax=1, rdi=fd (1=stdout), rsi=buf, rdx=count
    ; -------------------------------------------------------------------------
    
    mov rax, 1          ; System call number for sys_write
    mov rdi, 1          ; File descriptor 1 is standard output (stdout)
    mov rsi, message    ; Pointer to the string to print
    mov rdx, msg_len    ; Length of the string
    syscall             ; Invoke the kernel to perform the write

    ; -------------------------------------------------------------------------
    ; STEP 2: Graceful Termination
    ; Syscall: sys_exit (60)
    ; Arguments: rax=60, rdi=error_code (0=success)
    ; Industrial Note: Always exit explicitly. If you don't, the CPU will 
    ; continue executing whatever memory follows your code, causing a segfault.
    ; -------------------------------------------------------------------------

    mov rax, 60         ; System call number for sys_exit
    mov rdi, 0          ; Return 0 to the operating system
    syscall             ; Invoke the kernel to exit
