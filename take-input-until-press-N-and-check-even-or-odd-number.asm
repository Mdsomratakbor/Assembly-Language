.MODEL SMALL
.STACK 100H
.DATA
    input db 0
    even_msg db 0DH, 0AH, 'The number is even$'
    odd_msg db 0DH, 0AH, 'The number is odd$'
    msg db 'Enter the character: $' 
    nl db 0dh, 0ah, '$'

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
input_loop:
mov dx, offset msg
    mov ah, 09h
    int 21h
     
 mov ah, 1
    int 21h 
      
    cmp al, 'N'
    je exit
    cmp al, 'n'
    je exit
    cmp al, '0'
    jl input_loop
    mov input, al
    and al, 1
    jz even
    jmp odd
even:
    mov dx, offset even_msg
    mov ah, 09h
    int 21h          
     lea dx, nl
    mov ah,9
    int 21h
    jmp input_loop
odd:
    mov dx, offset odd_msg
    mov ah, 9h
    int 21h     
     lea dx, nl
    mov ah,9
    int 21h
    jmp input_loop
exit:
    mov ah, 4ch
    int 21h  
    
    MAIN ENDP
END MAIN