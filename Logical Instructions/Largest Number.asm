section .data
    equal db 'The numbers are equal', 0
    large db ' is larger', 0

section .text
extern io_get_dec, io_print_dec, io_newline, io_print_string
global main
main:
    mov ebp, esp
    call io_get_dec ;read first input
    mov ebx, eax ;store in ebx register
    call io_get_dec ;read second input
    cmp eax, ebx ;compare the two numbers
    je same ;if equal jump to 'same' label code
    jg larger ;if second number is larger jump to larger label
    mov eax, ebx ;number in ebx is larger, so move it back to eax
    call io_print_dec ;print larger number
    mov eax, large ;print large message
    call io_print_string
    xor eax, eax
    ret
   
same:
    mov eax, equal
    call io_print_string ;print equal message
    xor eax, eax
    ret

larger:
    call io_print_dec
    mov eax, large ;print larger number
    call io_print_string ;print large message
    xor eax, eax
    ret