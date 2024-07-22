section .data
    prompt     db  'Enter your name: ', 0
    prompt_len equ $ - prompt

    result_msg     db  'You entered: ', 0
    result_msg_len equ $ - result_msg

    newline     db  0xA
    newline_len equ $ - newline

section .bss
    name resb 100 ; Reserves 100 bytes for the name input

section .text
global  _start

_start: 
    ; Prompt for the name
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; Read the name
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 100
    syscall

    ; Print the results message
    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, result_msg_len
    syscall 

    ; Print the name 
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 100
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    ; Exit
    mov rax, 60
    mov rdi, rdi
    syscall

