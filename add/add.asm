SECTION .bss
    integer1 resb 8
    integer2 resb 8

SECTION .data
    msg1 db "Enter the first number: ", 0
    msg1_len equ $ - msg1
    msg2 db "Enter the second number: ", 0
    msg2_len equ $ - msg2
    newline db 10
    newline_len equ $ - newline

SECTION .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msg1_len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, integer1
    mov rdx, 8
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2_len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, integer2
    mov rdx, 8
    syscall

    mov rax, [integer1]
    add rax, [integer2]

    mov rax, 60
    xor rdi, rdi
    syscall

; @todo Fix