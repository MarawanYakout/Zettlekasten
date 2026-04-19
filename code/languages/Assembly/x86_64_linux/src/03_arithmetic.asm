; -----------------------------------------------------------------------------
; 03_arithmetic.asm - The CPU's Calculator
; 
; Concept: Basic arithmetic and the RFLAGS register.
; Use Case: Calculations, index manipulation, and condition checking 
;          based on math results (Zero, Carry, Overflow flags).
; -----------------------------------------------------------------------------

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; ADDITION AND SUBTRACTION
    ; -------------------------------------------------------------------------
    mov rax, 100
    add rax, 50         ; rax = 150
    sub rax, 25         ; rax = 125

    ; INC and DEC: Optimized for adding/subtracting 1
    inc rax             ; rax = 126
    dec rax             ; rax = 125

    ; -------------------------------------------------------------------------
    ; MULTIPLICATION (MUL / IMUL)
    ; Industrial Note: Unsigned MUL stores the 128-bit result across 
    ; RDX (High 64 bits) and RAX (Low 64 bits).
    ; -------------------------------------------------------------------------
    mov rax, 10
    mov rbx, 5
    mul rbx             ; rax = rax * rbx = 50. rdx = 0 (high bits).

    ; IMUL (Signed) - More flexible, supports 3 operands
    imul rbx, 4         ; rbx = rbx * 4 = 20

    ; -------------------------------------------------------------------------
    ; DIVISION (DIV / IDIV)
    ; Industrial Note: DIV expects the dividend to be in RDX:RAX.
    ; You MUST zero out RDX if dividing a 64-bit number in RAX.
    ; -------------------------------------------------------------------------
    mov rax, 100        ; Dividend (Low 64 bits)
    xor rdx, rdx        ; Clear rdx (High 64 bits)
    mov rbx, 3          ; Divisor
    div rbx             ; Result: rax = quotient (33), rdx = remainder (1)

    ; -------------------------------------------------------------------------
    ; FLAGS (RFLAGS)
    ; Arithmetic operations set bits in the RFLAGS register.
    ; Zero Flag (ZF): Set if result is 0.
    ; Carry Flag (CF): Set if unsigned overflow occurred.
    ; -------------------------------------------------------------------------
    mov rcx, 0
    sub rcx, 1          ; rcx becomes 0xFFFFFFFFFFFFFFFF, CF is set (Underflow)
    
    mov rdx, 5
    sub rdx, 5          ; Result is 0, ZF is set.

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
