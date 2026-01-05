section .data
    even db 'Your number is even', 0
    odd db 'Your number is odd', 0

section .text
extern io_print_string, io_newline, io_print_dec, io_get_dec
global main
main:
    mov ebp, esp
    call io_get_dec ;read input
    and al, 1 ;sets ax to 0 if even, 1 if odd
    jz isEven ;jumps to isEven code if ax is 0
    mov eax, odd
    call io_print_string    
    xor eax, eax
    ret
 
isEven:
    mov eax, even
    call io_print_string
    xor eax, eax
    ret
