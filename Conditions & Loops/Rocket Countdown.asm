section .data
    msg db 'Blast off!', 0

section .text
extern io_print_string, io_newline, io_print_dec
global main
main:
    mov ebp, esp
    mov ebx, 5

repeat:
    mov eax, ebx
    call io_print_dec
    call io_newline
    dec ebx
    cmp ebx, 0
    jg repeat ;if value in ebx is greater than 0, jump back to top of repeat label code
    
    ;when value in ebx is no longer greater than 0, continue
    mov eax, msg
    call io_print_string    
    xor eax, eax
    ret