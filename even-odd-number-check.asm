newline macro
         
  lea dx,nl
  mov ah,9
  int 21h
  
endm
  
.model small
.stack 100h


.data
msg db 'Enter a number : ', '$'
msg1 db 'number is even', '$'
msg2 db 'number is odd',  '$'
nl   db  0dh,0ah,         '$'



.code 
.startup
  
  ;initialize data segment  
  mov ax,@data
  mov ds,ax
  
  lea dx,msg
  mov ah,9
  int 21h   
   
  mov ah,1
  int 21h
  

  ;divide al by whatever is in bl
  mov bl,2
  div bl
  
  mov al,ah
  
  ;check if remainder is zero
  cmp al,0
  
  ;use any condition here jump greater, jump if not equal etc
  jg odd 
          
          
  
  ;if it was a odd number than it would never reach here
  ;print a new line if even
  even:
    newline  
  
  
  ;print the string in msg1 and skip rest of the code to exit label
  lea dx,msg1
  mov ah,9
  int 21h
  jmp exit 
  
  
    
  ;the previous jg odd label jumps to here skipping even portion of the code    
  odd:
    newline        
          
            
  ;show the message for odd number        
  lea dx,msg2
  mov ah,9
  int 21h
          
  
  ;just a jump label to skip executing some codes        
  exit:
  
 
.exit