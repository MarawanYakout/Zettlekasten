; -----------------------------------------------------------------------------
; 06_memory_addressing.asm - Pointers and Indirect Access
; 
; Concept: Addressing Modes, Dereferencing, and the .bss section.
; Use Case: Accessing arrays, structures, and dynamically allocated memory
;          without hardcoding every address.
; -----------------------------------------------------------------------------

section .data
    ; data_val: A 64-bit integer initialized to 0x1234
    data_val: dq 0x1234
    
    ; array: 4 integers (64-bit each)
    array: dq 10, 20, 30, 40

; .bss section is for UNINITIALIZED data. 
; It doesn't take space in the binary file, only in RAM during execution.
section .bss
    ; resb: Reserve Bytes, resq: Reserve Quadwords (8 bytes)
    buffer: resq 1      ; Reserve space for one 64-bit value

section .text
    global _start

_start:
    ; -------------------------------------------------------------------------
    ; 1. SIMPLE DEREFERENCING
    ; [] brackets indicate we want the value at the address.
    ; -------------------------------------------------------------------------
    mov rax, [data_val]     ; rax = 0x1234
    
    ; Updating memory
    mov qword [buffer], rax ; Store rax into the uninitialized buffer

    ; -------------------------------------------------------------------------
    ; 2. COMPLEX ADDRESSING MODE
    ; Formula: [base + index * scale + displacement]
    ; scale must be 1, 2, 4, or 8.
    ; Use Case: Accessing array elements.
    ; -------------------------------------------------------------------------
    mov rbx, array          ; rbx = base address
    mov rcx, 2              ; rcx = index (we want the 3rd element: 30)
    
    ; Move array[2] into rax. 
    ; array[2] is at (base + 2 * 8) because each element is 8 bytes (dq).
    mov rax, [rbx + rcx * 8] ; rax = 30

    ; -------------------------------------------------------------------------
    ; 3. LEA (Load Effective Address)
    ; Industrial Note: LEA calculates the address but DOES NOT dereference it.
    ; It's often used for fast arithmetic (e.g., rax = rbx * 8 + 5)
    ; -------------------------------------------------------------------------
    lea rdx, [rbx + rcx * 8] ; rdx = address of array[2] (not the value 30)
    
    ; Fast math with LEA: rax = rdi * 4 + 1
    mov rdi, 10
    lea rax, [rdi * 4 + 1]   ; rax = 41

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
