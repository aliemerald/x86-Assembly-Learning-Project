section .text
extern io_print_dec, io_get_dec
global main
main:
    mov ebp, esp
    call io_get_dec ;read input n
    mov ebx, 0 ;1st term of sequence
    mov ecx, 1 ;2nd term of sequence

repeat:
    sub eax, 2
    cmp eax, 0
    jle end
    add ebx, ecx ;next odd term of sequence
    add ecx, ebx ;next even term of sequence
    jmp repeat 

end:
    and eax, 1 ;check if input n was even or odd
    jz even ;jump to even end code if even
    mov eax, ebx ;move last odd term to accumulator
    call io_print_dec
    xor eax, eax
    ret

even:
    mov eax, ecx ;move last even term to accumulator
    call io_print_dec
    xor eax, eax
    ret    