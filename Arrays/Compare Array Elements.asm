section .data
    numbers dd 10, 10, 30, 40, 50  ; a random array of doublewords (4 bytes each)
    equal db 'equal', 0
    inequal db 'not equal', 0

section .text
extern io_print_dec, io_newline, io_print_string
global main

main:
    mov ebp, esp
    mov esi, numbers ;move the base address of numbers into esi (our pointer)
    mov eax, [esi] ;read the first element (index 0) into eax
    call io_print_dec ;print the first element
    call io_newline
    mov edi, esi ;copy base address to edi
    add esi, 4 ;move to the second element (index 1)
    mov eax, [esi] ;move the second element into eax
    call io_print_dec ;print the second element
    call io_newline
    mov eax, [edi]
    mov ebx, [esi]
    cmp eax, ebx ;compare first and second elements of array
    je same ;if equal, jump to 'same' code
    mov eax, inequal ;else print 'inequal' string
    call io_print_string
    xor eax, eax
    ret
same:
    mov eax, equal
    call io_print_string ;print 'equal' string
    xor eax, eax
    ret