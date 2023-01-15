.MODEL SMALL
.STACK 100H
.DATA 

  STR DB 0AH,0DH,'ENTER SIZE: $' 
  STR1 DB 0AH,0DH,'ENTER THE ARRAY ELEMENT: $' 
  STR2 DB 0AH,0DH,'EVEN DIGIT: $'
  STR3 DB 0AH,0DH,'ODD DIGIT : $'
  
  N DB ?     
  N1 DB ?
  N2 DB ?
  RESULT DB ? 
  ARRAY DB 10 DUP(?)
         
         
     DIGIT_CHECK MACRO ARRAY, LENGTH
    
        MOV CH, 0H
        MOV CL, LENGTH      
        MOV SI, ARRAY
        
        MOV AH,9
        MOV DX,OFFSET STR2
        INT 21H
                
        EVEN:  
               MOV AH, 2
               MOV DL, [SI]
               ADD DL, 30H
               INC SI
               INT 21H
                
                
                           
                LOOP EVEN 
         
         
    
  ENDM
  

  
  
 .CODE   
 
        MAIN PROC  
                   
        ;DATA SEGEMENT INITIALIZATION 
        MOV AX, @DATA
        MOV DS, AX  
        
        MOV AH,9
        MOV DX, OFFSET STR
        INT 21H 
        
        MOV AH,1
        INT 21H
        SUB AL,30H
        
        MOV N,AL        
                
                
        
        MOV AH,9
        MOV DX, OFFSET STR1
        INT 21H  
        
        MOV CH,0
        MOV CL,N 
         
        MOV SI,0 
          
        
        
         INPUT:
        
            MOV AH,1
            INT 21H
            SUB AL,30H
            MOV [SI],AL
            INC SI
            LOOP INPUT
        
        MOV SI, OFFSET ARRAY
        
        DIGIT_CHECK SI, N  
        
   
         
        MAIN ENDP            
        
  END MAIN  
  
  
  
