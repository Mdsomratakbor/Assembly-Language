.MODEL SMALL
.STACK 100H
.DATA

  STR1 DB 0AH,0DH,'ENTER THE FIRST NUMBER: $' 
  STR2 DB 0AH,0DH,'ENTER THE SECOND NUMBER: $'
  
   STR3 DB 0AH,0DH,'OUTPUT : $'     
  N1 DB ?
  N2 DB ?
  RESULT DB ?
  
     ADDITION MACRO A, B
    
         MOV BL, A
         ADD BL, B
         MOV RESULT, BL 
         
         OUTPUT  RESULT
    
  ENDM
  
  OUTPUT MACRO R
                 
         MOV AH,9
        MOV DX, OFFSET STR3
        INT 21H 
        
              MOV DL, R
              ADD DL, 30H
              MOV AH, 2
              INT 21H
  ENDM
  
  
 .CODE   
 
        MAIN PROC  
                   
        ;DATA SEGEMENT INITIALIZATION 
        MOV AX, @DATA
        MOV DS, AX  
        
        MOV AH,9
        MOV DX, OFFSET STR1
        INT 21H 
        
        MOV AH,1
        INT 21H
        SUB AL,30H  
        
        MOV N1, AL
        
        MOV AH,9
        MOV DX, OFFSET STR2
        INT 21H  
        
        MOV AH,1
        INT 21H
        SUB AL,30H  
         
         
        MOV N2, AL 
        
        ADDITION N1, N2  
        
   
         
        MAIN ENDP            
        
  END MAIN  
  
  
  
