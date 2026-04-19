; -----------------------------------------------------------------------------
; 05_stack_and_functions.asm - Modular Code and the ABI
; 
; Concept: Procedures (Functions), Stack Frames, and the Calling Convention.
; Use Case: Organizing code into reusable modules, passing arguments, and
;          understanding how C functions work under the hood.
; -----------------------------------------------------------------------------

section .data
    fmt_msg: db "The result of (A + B) is being calculated...", 0xA
    fmt_len: equ $ - fmt_msg

section .text
    global _start

; -----------------------------------------------------------------------------
; FUNCTION: add_two_numbers
; Purpose: Adds two 64-bit integers.
; 
; SYSTEM V AMD64 ABI (Linux Calling Convention):
; 1st Arg: rdi
; 2nd Arg: rsi
; Return Value: rax
; -----------------------------------------------------------------------------
add_two_numbers:
    ; Function Prologue: Setup stack frame (Industrial standard)
    push rbp            ; Save the caller's base pointer
    mov rbp, rsp        ; Set the base pointer to the current stack pointer

    ; Logic
    mov rax, rdi        ; Move 1st arg to rax
    add rax, rsi        ; Add 2nd arg to rax

    ; Function Epilogue: Clean up stack frame
    mov rsp, rbp        ; Restore stack pointer
    pop rbp             ; Restore caller's base pointer
    ret                 ; Return to the address stored on top of the stack

_start:
    ; 1. Print status message
    mov rax, 1
    mov rdi, 1
    mov rsi, fmt_msg
    mov rdx, fmt_len
    syscall

    ; 2. Call the function
    ; Passing arguments according to ABI: rdi=10, rsi=20
    mov rdi, 10
    mov rsi, 20
    call add_two_numbers

    ; The result (30) is now in rax.
    ; Industrial Note: Registers like rbx, rbp, r12-r15 are "callee-saved."
    ; If a function uses them, it MUST restore them before returning.

    ; Exit program (using rax as the exit code just for demonstration)
    mov rdi, rax        ; Exit code will be 30
    mov rax, 60
    syscall

    ; -------------------------------------------------------------------------
    ; UNDERSTANDING THE STACK
    ; PUSH: decrement rsp by 8, move value to [rsp]
    ; POP: move value from [rsp] to register, increment rsp by 8
    ; -------------------------------------------------------------------------
