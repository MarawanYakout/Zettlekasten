; -----------------------------------------------------------------------------
; 02_registers_and_moves.asm - Moving Data Around
; 
; Concept: General-Purpose Registers and the 'mov' instruction.
; Use Case: Understanding the CPU's "internal scratchpad" and how to 
;          manipulate data at various sizes (64, 32, 16, 8 bits).
; -----------------------------------------------------------------------------

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; THE 64-BIT REGISTERS (rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8-r15)
    ; -------------------------------------------------------------------------

    ; 1. Moving an immediate value (constant) into a register
    mov rax, 0x1122334455667788  ; rax = 64-bit constant

    ; 2. Register-to-Register move
    mov rbx, rax                 ; Copy rax into rbx

    ; -------------------------------------------------------------------------
    ; REGISTER SIZING: The "Partial Register" Rule
    ; Every 64-bit register contains smaller 32, 16, and 8-bit components.
    ; Industrial Note: In x86_64, writing to a 32-bit register (e.g., eax) 
    ; AUTOMATICALLY zeroes out the upper 32 bits of the 64-bit register (rax).
    ; -------------------------------------------------------------------------

    mov eax, 0xFFFFFFFF          ; Sets rax to 0x00000000FFFFFFFF
    
    mov ax, 0x1234               ; Sets the lower 16 bits of rax
    mov ah, 0xAB                 ; Sets the higher byte of ax (bits 8-15)
    mov al, 0xCD                 ; Sets the lowest byte of rax (bits 0-7)

    ; -------------------------------------------------------------------------
    ; ZEROING REGISTERS
    ; Optimization: Use XOR for zeroing. It's smaller and often faster than MOV.
    ; -------------------------------------------------------------------------
    xor rcx, rcx                 ; Set rcx to 0 (Industrial standard)

    ; -------------------------------------------------------------------------
    ; MOVZX and MOVSX (Moving with Extension)
    ; Use Case: Promoting a small value (8-bit) to a larger register (64-bit).
    ; -------------------------------------------------------------------------
    mov r8b, 0x7F                ; r8b is the 8-bit low byte of r8
    movzx r9, r8b                ; Zero-extend r8b into r9 (r9 = 0x00...007F)
    movsx r10, r8b               ; Sign-extend r8b into r10 (r10 = 0x00...007F)

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
