.MODEL SMALL
.STACK 100H
.DATA
    num db 0
    fib1 db 0
    fib2 db 1
    temp db 0

.CODE

    MAIN PROC
         
         MOV AX, @DATA
         MOV DS, AX 
         
    mov ah, 1H
    int 21h
    
    sub al, 30H
    mov num, al

    mov dl, 2H
    mov al, fib1
    add al, 30H
    mov ah, 2H
    int 21h
    mov al, fib2
    add al, 30H
    int 21h
    mov dx, 10H
    mov ah, 2H
    int 21h

next:
    cmp dl, num
    je exit
    inc dl
    mov al, fib1
    add al, fib2
    mov temp, al
    mov al, fib2
    mov fib1, al
    mov al, temp
    mov fib2, al
    mov al, fib2
    add al, 30H
    
    int 21h
    mov dx, 10H
    int 21h  
    
    jmp next

exit:
    mov ah, 4ch
    int 21h 
         
        
    MAIN ENDP
    
    END MAIN