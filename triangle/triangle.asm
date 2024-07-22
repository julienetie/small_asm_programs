; LMU Triangle
; Sourced from MacOS asm: https://cs.lmu.edu/~ray/notes/nasmtutorial/#:~:text=of%20ten%20reals-,Another%20Example,-Here%E2%80%99s%20a%20macOS

            section .bss
maxlines: equ 8
dataSize: equ 44
output: resb        dataSize

            global  _start
            section .text
_start:
            mov rdx, output
            mov r8d, 1      ; Initial line length
            mov r9d, 0      ; Count of stars written on current line
line: 
            mov byte [rdx], '*' ; Write single star
            inc rdx             ; Advance pointer to next cell to write
            inc r9d             ; Count number os far on line
            cmp r9d,        r8d ; Compare current count to last limit
            jne line            ; If not greater, keep incrementing writes
lineDone:
            mov byte [rdx], 10       ; New line
            inc rdx
            inc r8d                  ; Increment line length 
            mov r9d,        0        ; reset count of stars 
            cmp r8d,        maxlines ; Checks if last line written is last line
            jng line                 ; If not jump to line 
done: 
            mov rax, 1        ; syswrite
            mov rdi, 1
            mov rsi, output   ; Address of string to output
            mov rdx, dataSize ; byte size
            syscall
            mov rax, 60       ; Exit...
            xor rdi, rdi
            syscall

