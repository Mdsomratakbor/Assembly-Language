.model small
.stack 100h
.data
msg db 'Enter the number: $'
msg1 db 0dh, 0ah, 'Yes Divideable $'
msg2 db 0dh, 0ah, 'Not Divideable $'
number1 db ?
.code
     main proc
        mov ax, @data
        mov ds, ax
        
        ;Display a Message
        mov ah, 09h
        lea dx, msg
        int 21h
        
        ;Input a character
        mov ah, 01h
        int 21h ; al register
        sub al, 30h 
        
        mov number1, al 
        
        mov al, number1
        mov ah, 0h 
        xor dx, dx
        mov bl, 5
        div bl
        
        cmp ah, 0
        je  divisible
        
       
        
        mov ah, 09h
        lea dx, msg2
        int 21h
        jmp exit         
                 
        divisible:
            mov ah, 09h
            lea dx, msg1
            int 21h
         exit:
             mov ah, 4ch
             int 21h
             
             main endp
     end main
         