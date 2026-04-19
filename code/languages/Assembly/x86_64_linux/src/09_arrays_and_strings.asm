; -----------------------------------------------------------------------------
; 09_arrays_and_strings.asm - Memory Blocks and Iteration
; 
; Concept: String Instructions and Loop-based Array Access.
; Use Case: String manipulation (copy, compare, search), image processing,
;          and efficient data parsing.
; -----------------------------------------------------------------------------

section .data
    source_str: db "Copy this string!", 0
    s_len:      equ $ - source_str
    
    array:      dq 1, 2, 3, 4, 5
    a_len:      equ 5

section .bss
    dest_str:   resb 64
    sum_res:    resq 1

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; 1. STRING COPY (The fast way)
    ; Instructions: MOVSB (Move String Byte)
    ; REP prefix: Repeat the instruction RCX times.
    ; -------------------------------------------------------------------------
    mov rsi, source_str     ; RSI is standard for Source Index
    mov rdi, dest_str       ; RDI is standard for Destination Index
    mov rcx, s_len          ; Count
    cld                     ; Clear Direction Flag (Process forward)
    rep movsb               ; While (rcx--) { *rdi++ = *rsi++; }

    ; -------------------------------------------------------------------------
    ; 2. ARRAY SUMMATION (The loop way)
    ; -------------------------------------------------------------------------
    xor rax, rax            ; Accumulator
    mov rbx, array          ; Base address
    mov rcx, a_len          ; Counter

.sum_loop:
    add rax, [rbx]          ; Add current element
    add rbx, 8              ; Move to next 64-bit quadword
    loop .sum_loop          ; LOOP instruction decrements RCX and jumps if > 0

    mov [sum_res], rax      ; Store result

    ; -------------------------------------------------------------------------
    ; 3. STRING LENGTH (The scan way)
    ; SCASB: Scan String Byte - Compares AL with [RDI]
    ; -------------------------------------------------------------------------
    mov rdi, source_str
    xor al, al              ; We look for null terminator (0)
    mov rcx, -1             ; Max possible count
    cld
    repne scasb             ; Scan while NOT equal to 0
    
    ; After this, RCX is -1 - (length + 1)
    ; To get length: length = (-2 - rcx)
    not rcx
    dec rcx                 ; rcx now contains the string length

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
