section .text
extern io_get_dec, io_print_dec
global main
main:
    mov ebp, esp
    call io_get_dec ;read input number
    mov ebx, eax ;store in register ebx
    call factorial ;call factorial procedure
    
    xor eax, eax
    ret
    
factorial:
    cmp ebx, 1 ;compare value of ebx to 1
    je end ;if value in ebx = 1, jump to 'end' label code
    dec ebx ;decrease ebx by 1
    mul ebx ;multiply value in ebx to value in eax, result also in eax
    call factorial ;call factorial procedure recursively
    ret

end:
    call io_print_dec ;print factorial result in eax
    xor eax, eax
    ret
