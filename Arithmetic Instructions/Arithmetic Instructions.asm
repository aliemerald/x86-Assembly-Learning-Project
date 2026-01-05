section .data
    num1 dd 10
    num2 dd 2

section .text
extern io_print_dec, io_newline
global main
main:
    mov ebp, esp
    
    ;increment
    mov eax, [num1]
    inc eax
    call io_print_dec
    call io_newline
       
    ;decrement
    xor eax, eax ;reset eax to 0
    mov eax, [num1]
    dec eax
    call io_print_dec
    call io_newline
       
    ;add
    xor eax, eax
    mov eax, [num1]
    add eax, [num2]
    call io_print_dec
    call io_newline
    
    ;subtract
    xor eax, eax
    mov eax, [num1]
    sub eax, [num2]
    call io_print_dec
    call io_newline
    
    ;multiply
    xor eax, eax
    mov eax, [num1]
    mov ebx, [num2]
    mul ebx
    call io_print_dec
    call io_newline
    
    ;divide
    xor eax, eax
    mov eax, [num1]
    mov ebx, [num2]
    div ebx
    call io_print_dec
    
    xor eax, eax
    ret