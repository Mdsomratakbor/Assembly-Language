.MODEL SMALL
.STACK 100H
.DATA 

    INPUT1 DB 'Your ids 1st Digit:$'
    INPUT2 DB 'Your ids 7th Digit:$'  
    INPUT3 DB 'Your ids last Digit:$'
    OUTPUT DB  'Output:$'   
    
    NUMBER1 DB ?
    NUMBER2 DB ?
    NUMBER3 DB ?
    
    FIRSTDIGIT DB ?
    SECONDDIGIT DB ?
    
    NUMBER DB ?      
    
 .CODE
 
            
        MAIN PROC 
            
             ;DATA SEGMENT INITIALIZATION
             MOV AX, @DATA
             MOV DS, AX
             
              ;PRINT NUMBER1 STRING
              LEA DX, INPUT1
              MOV AH, 9
              INT 21H
              
              ;INPUT FIRST NUMBER 
              MOV AH, 1
              INT 21H
              SUB AL, 30H 
              
              ;MOVE THE RESULT OF VARIABLE NUMBER1
              MOV NUMBER1, AL 
               
                           
              ;NEWLINE
              MOV AH, 2
              MOV DL, 0AH
              INT 21H
              MOV DL, 0DH
              INT 21H   
              
              ;PRINT NUMBER2 STRING
              LEA DX, INPUT2
              MOV AH, 9
              INT 21H
              
              ;INPUT SECOND NUMBER 
              MOV AH, 1
              INT 21H
              SUB AL, 30H
              
              ;MOVE THE RESULT OF VARIABLE NUMBER2
              MOV NUMBER2, AL   
              
              ;NEWLINE
              MOV AH, 2
              MOV DL, 0AH
              INT 21H
              MOV DL, 0DH
              INT 21H 
              
              
              ;PRINT NUMBER3 STRING
              LEA DX, INPUT3
              MOV AH, 9
              INT 21H
              
              ;INPUT THIRD NUMBER 
              MOV AH, 1
              INT 21H
              SUB AL, 30H
              
              ;MOVE THE RESULT OF VARIABLE NUMBER3
              MOV NUMBER3, AL
              
              
              ;SUBSTRACTION NUMBER2-NUMBER1
              
              MOV BL, NUMBER2
              SUB BL, NUMBER1
              MOV FIRSTDIGIT, BL
                                   

              ;SUBSTRACTION NUMBER3-NUMBER2
              MOV BL, NUMBER3
              SUB BL, NUMBER2
              MOV SECONDDIGIT, BL
              
              
              ;MULTIPLY THE NUMBER WITH 10
              MOV AL, FIRSTDIGIT
              MOV AH, 0H
              MOV BL, 10H
              MUL BL  
              
              ;MOVE THE RESULT OF THE MULTIPLICATION OF THE VARIABLE NUMBER
              MOV NUMBER, AL 
              
              
              ;ADDITION SECOND DIGIT WITH NUMBER VARIABLE VALUE
              
              MOV BL, SECONDDIGIT
              ADD BL, NUMBER 
              MOV NUMBER, BL
              
              ;NEWLINE
              MOV AH, 2
              MOV DL, 0AH
              INT 21H
              MOV DL, 0DH
              INT 21H 
              
              ;PRINT OUTPUT STRING
              LEA DX, INPUT1
              MOV AH, 9
              INT 21H
              
              ;DIVISION BY 10 FOR LEFT MOST DIGIT
              MOV AL, NUMBER
              MOV AH, 0H
              MOV BL, 10 
              DIV BL
              
              ;PRINT LEFT MOST DIGIT
              MOV DL, AL
              ADD DL, 48H
              MOV AH, 2
              INT 21H
              
              
              
                
               
              
             
        MAIN ENDP
                  
        
  END MAIN