; -----------------------------------------------------------------------------
; 08_system_calls_io.asm - Interacting with the User
; 
; Concept: Reading from stdin and Writing to stdout.
; Use Case: Building command-line tools, shell interactions, and handling
;          buffered input.
; -----------------------------------------------------------------------------

section .data
    prompt: db "Please enter your name: "
    p_len:  equ $ - prompt
    greet:  db "Hello, "
    g_len:  equ $ - greet

section .bss
    ; Reserve 64 bytes for the name
    name_buf: resb 64

section .text
    global _start

_start:
    ; 1. Print Prompt
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, prompt
    mov rdx, p_len
    syscall

    ; 2. Read Input
    ; Syscall: sys_read (0)
    ; Arguments: rax=0, rdi=0 (stdin), rsi=buf, rdx=size
    mov rax, 0          ; sys_read
    mov rdi, 0          ; stdin
    mov rsi, name_buf   ; buffer address
    mov rdx, 64         ; max bytes to read
    syscall
    
    ; After sys_read, rax contains the actual number of bytes read.
    ; This is crucial for dynamic data handling.
    mov r12, rax        ; Store name length for later

    ; 3. Print Greeting
    mov rax, 1
    mov rdi, 1
    mov rsi, greet
    mov rdx, g_len
    syscall

    ; 4. Print the name back
    ; Industrial Note: We use the length returned by sys_read in r12.
    mov rax, 1
    mov rdi, 1
    mov rsi, name_buf
    mov rdx, r12
    syscall

    ; Exit program
    mov rax, 60
    mov rdi, 0
    syscall
