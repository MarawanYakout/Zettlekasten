; -----------------------------------------------------------------------------
; 04_control_flow.asm - Decisions and Loops
; 
; Concept: Comparisons, Conditional Jumps, and Branching.
; Use Case: Implementing if/else statements, for/while loops, and
;          error handling logic.
; -----------------------------------------------------------------------------

section .data
    msg_even: db "The number is even.", 0xA
    len_even: equ $ - msg_even
    msg_odd:  db "The number is odd.", 0xA
    len_odd:  equ $ - msg_odd

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; IF/ELSE LOGIC
    ; Logic: if (num % 2 == 0) print even; else print odd;
    ; -------------------------------------------------------------------------
    mov rax, 7          ; Our test number
    mov rbx, 2
    xor rdx, rdx
    div rbx             ; rdx contains remainder (7 % 2 = 1)

    ; CMP (Compare): Subtracts operands and sets flags (doesn't store result)
    cmp rdx, 0
    
    ; JE (Jump if Equal): Jump to label if Zero Flag (ZF) is set.
    je .print_even

.print_odd:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_odd
    mov rdx, len_odd
    syscall
    jmp .loop_example   ; Unconditional jump to skip the 'even' block

.print_even:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_even
    mov rdx, len_even
    syscall

    ; -------------------------------------------------------------------------
    ; LOOPS
    ; Logic: for (int i = 5; i > 0; i--) { ... }
    ; -------------------------------------------------------------------------
.loop_example:
    mov rcx, 5          ; Loop counter (rcx is standard for this)

.loop_start:
    ; Do some work...
    push rcx            ; Save rcx because syscalls might overwrite it
    
    ; Industrial Note: In loops, keep logic lean to minimize branch mispredictions.
    
    pop rcx             ; Restore rcx
    dec rcx             ; Decrement counter
    jnz .loop_start     ; JNZ (Jump if Not Zero): Jump if rcx != 0

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
