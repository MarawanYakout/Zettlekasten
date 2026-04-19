; -----------------------------------------------------------------------------
; 10_macros_and_advanced.asm - Higher-Level Abstractions
; 
; Concept: Macros, Conditional Assembly, and Preprocessor Directives.
; Use Case: Reducing boilerplate code, creating domain-specific languages
;          within assembly, and cross-platform compatibility.
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; MACRO: print_string
; Parameters: %1 = address of string, %2 = length of string
; -----------------------------------------------------------------------------
%macro print_string 2
    push rax            ; Save registers to avoid side effects
    push rdi
    push rsi
    push rdx

    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, %1         ; %1 refers to the first argument
    mov rdx, %2         ; %2 refers to the second argument
    syscall

    pop rdx
    pop rsi
    pop rdi
    pop rax
%endmacro

; -----------------------------------------------------------------------------
; MACRO: exit_program
; Parameter: %1 = exit code
; -----------------------------------------------------------------------------
%macro exit_program 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .data
    msg1: db "Using macros makes code cleaner.", 0xA
    len1: equ $ - msg1
    msg2: db "Assembly is powerful!", 0xA
    len2: equ $ - msg2

section .text
    global _start

_start:
    ; Instead of manually setting up 4 registers for each syscall,
    ; we now use our industrial-grade macros.
    
    print_string msg1, len1
    print_string msg2, len2

    ; Advanced: Conditional Assembly
    ; This code is only included if DEBUG is defined (e.g., via nasm -DDEBUG)
    %ifdef DEBUG
        print_string msg2, len2 ; Double print for debug
    %endif

    exit_program 0
