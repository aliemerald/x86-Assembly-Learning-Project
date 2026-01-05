section .data
    numbers dd 10, 2, 7, 3, 5 ;random array of doublewords
    len equ 5
    
section .text
extern io_print_dec
global main
main:
    mov ebp, esp
    mov ebx, len ;while loop counter, starts at 5 -> length of array
    mov ecx, 4 ;for loop counter, starts at 4 -> array length-1
    mov edx, numbers ;point to effective address of 'numbers' array

while:
    cmp ebx, 0
    je end ;check if while loop counter has reached 0, if so jump to 'end' code
    mov ecx, 4
    dec ebx ;decrease while loop counter by 1
       
for:
    cmp ecx, 0
    je while ;jump back to 'while' loop if for loop counter = 0
    cmp [edx], [edx+16] ;compare current element with next
    jg swap ;if current element larger, jump to 'swap' code
    inc edx ;point to next element in array
    dec ecx ;decrease for loop counter by 1    

swap:
    push edx ;push value of edx to stack because run out of registers
    mov dl, [esp+4] ;store current element in dl
    mov dh, [esp+4+1] ;store next element in dh
    mov [esp+4], dh ;move next element to current position
    mov [esp+4+1], dl ;move current element to next position
    mov edx, [esp+4] ;restore original value of edx as pointer
    add esp, 4 ;clear stack
    dec ecx ;decrease for loop counter by 1
    jmp for ;jump back to 'for' loop code
    
end:
    mov al, [numbers] ;print first element of sorted list to see if is smallest
    call io_print_dec  