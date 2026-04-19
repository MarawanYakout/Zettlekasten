; -----------------------------------------------------------------------------
; 07_bitwise_operations.asm - Thinking in Bits
; 
; Concept: Logical Operations (AND, OR, XOR, NOT) and Bit Shifts.
; Use Case: Optimizing performance, bit masking, encryption/hashing, and
;          interfacing with hardware flags.
; -----------------------------------------------------------------------------

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; 1. XOR (Exclusive OR)
    ; Logic: 1 if bits are different.
    ; Industrial Note: As seen before, XORing a register with itself is the
    ; standard way to zero it out (smaller instruction than MOV).
    ; -------------------------------------------------------------------------
    xor rax, rax        ; rax = 0
    
    ; XOR Swap (No extra register needed)
    mov rax, 5
    mov rbx, 10
    xor rax, rbx
    xor rbx, rax
    xor rax, rbx        ; rax is now 10, rbx is 5.

    ; -------------------------------------------------------------------------
    ; 2. AND / OR (Masking)
    ; Use Case: Isolate or set specific bits.
    ; -------------------------------------------------------------------------
    mov rax, 0b1101     ; Binary 13
    and rax, 0b1011     ; Result: 0b1001 (9)
    
    ; Checking if a bit is set (TEST instruction)
    ; TEST is like AND but only sets flags, doesn't change the register.
    test rax, 1         ; Checks if the lowest bit is set
    jnz .bit_is_set

    ; -------------------------------------------------------------------------
    ; 3. SHIFTS (SHL / SHR)
    ; Use Case: Fast multiplication/division by powers of 2.
    ; -------------------------------------------------------------------------
    mov rax, 10
    shl rax, 1          ; rax = 10 * 2 = 20
    shl rax, 2          ; rax = 20 * 4 = 80
    
    mov rbx, 100
    shr rbx, 1          ; rbx = 100 / 2 = 50

    ; -------------------------------------------------------------------------
    ; 4. ROTATIONS (ROL / ROR)
    ; Unlike shifts, bits that fall off one end come back on the other.
    ; -------------------------------------------------------------------------
    mov rax, 0x8000000000000001
    rol rax, 1          ; rax becomes 0x0000000000000003

.bit_is_set:
    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
