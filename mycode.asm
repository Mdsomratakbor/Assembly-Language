.MODEL SMALL
.STACK 100H
.DATA

    number1 DB 'number1:$'
    number2 DB 'number2:$'
    output DB  'output:$' 
    N DB ?  
    
.CODE
    
        MAIN PROC 
            
             ;DATA SEGMENT INITIALIZATION
                MOV AX, @DATA
                MOV DS, AX
               
              ;PRINT NUMBER1 STRING
              LEA DX, number1
              MOV AH, 9
              INT 21H
              
              ;INPUT LEFT MOST NUMBER 
              MOV AH, 1
              INT 21H
              SUB AL, 30H
              
              ;MULTIPLY THE NUMBER WITH 10
              MOV AH, 0H
              MOV BL, 10H
              MUL BL
              
              ;MOVE THE RESULT OF THE MULTIPLICATION OF THE VARIABLE N
              MOV N, AL
              
              ;NEWLINE
              MOV AH, 2
              MOV DL, 0AH
              INT 21H
              MOV DL, 0DH
              INT 21H
              
              ;PRINT NUMBER2 STRING
              LEA DX, number2
              MOV AH, 9
              INT 21H 
              
              ;INPUT RIGHT MOST NUMBER 
              MOV AH, 1
              INT 21H
              SUB AL, 30H  
              
              ;ADD THE NEW VLAUE WITH N PRIVIOUS VALUEA 
              ADD N, AL
              
              ;NEWLINE
              MOV AH, 2
              MOV DL, 0AH
              INT 21H
              MOV DL, 0DH
              INT 21H  
              
              ;PRINT OUTPUT STRING
              LEA DX, output
              MOV AH, 9
              INT 21H  
              
              
              ;OUTPUT N VAIRABLE VALUE
              ;MOV DL, N
              ;MOV AH, 2
              ;INT 21H        
               
               MOV AL, N
               MOV AH, 0H
               MOV BL, 10 
               DIV BL
                
               MOV DL, AL
              MOV AH, 2
              INT 21H
               
               
              
             
        MAIN ENDP
                  
        
  END MAIN


