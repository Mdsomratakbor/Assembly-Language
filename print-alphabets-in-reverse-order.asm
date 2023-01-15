.model small
.stack 100h
.data
.code
     main proc
        mov ax, @data
        mov ds, ax
        mov cx, 26
        mov dx, 90
        
        loop1:
            mov ah,2
            int 21h
             dec dx
         loop loop1
        
        mov ah, 4ch
        int 21h 
        
             
             main endp
     end main
         