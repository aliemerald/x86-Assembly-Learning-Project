section .data
    numbers db 11, 22, 33, 44, 55 ;random array of bytes
    len equ 5

section .text
extern io_print_dec, io_newline
global main
main:
    mov ebp, esp
    mov ebx, len ;loop counter = length of array
    mov esi, numbers ;esi pointer

print:
    cmp ebx, 0 ;check if loop counter reached 0
    je end ;if yes, jump to 'end' code
    mov al, [esi] ;move element being pointed to to al register
    call io_print_dec ;print current element of array
    call io_newline
    inc esi ;move pointer to next element
    dec ebx ;decrease loop counter
    jmp print ;loop back to 'print' label
    
end:
    xor eax, eax
    ret