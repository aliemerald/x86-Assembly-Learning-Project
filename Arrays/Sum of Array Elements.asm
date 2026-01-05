section .data
    numbers db 11, 22, 33, 44, 55 ;random array of bytes

section .text
extern io_print_dec, io_newline
global main
main:
    mov ebp, esp
    mov bl, 0 ;will store sum, starts at 0
    mov eax, 5 ;loop counter, starts at 5 - length of array
    mov ecx, numbers ;point to effective address of 'numbers'
    call sum
    xor eax, eax
    ret      
    
sum:
    add bl, [ecx] ;add element of array currently being pointed to
    inc ecx ;point to next element of array
    dec eax ;decrease loop counter by 1
    jz end ;if loop counter = 0, jump to 'end' label code
    call sum ;else call sum procedure recursively
    ret
    
end:
    mov al, bl ;move total to accumulator
    call io_print_dec ;print sum
    xor eax, eax
    ret   