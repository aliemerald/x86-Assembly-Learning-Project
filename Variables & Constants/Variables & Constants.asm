section .data
    var1 db 'variable 1', 0
    var2 db 'variable 2', 0
    const equ 20

section .text
extern io_print_string, io_newline, io_print_dec
global main
main:
    mov ebp, esp
    mov eax, var1
    call io_print_string
    call io_newline
    mov eax, var2
    call io_print_string
    call io_newline
    mov eax, const
    call io_print_dec
    call io_newline
    %define const 10
    call io_print_dec
    xor eax, eax
    ret