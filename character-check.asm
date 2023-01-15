TITLE PUCHTAA 
.MODEL SMALL 
.STACK 100H 
.DATA 
     MSG DB 0AH, 0DH, "ENTER A CHARACTER: $" 
     ALPHABET DB 0AH, 0DH, "IT'S ALPHABET $" 
     DIGIT DB 0AH, 0DH, "IT'S DIGIT $" 
     SPECIAL DB 0AH, 0DH, "IT'S SPECIAL CHARACTER $" 
.CODE 
    START: 
        MOV AX, @DATA 
        MOV DS, AX 
    AGAIN:     
       ;-----------------------  
        LEA DX, MSG 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
       ;----------------------  
        MOV BL, AL 
         
        CMP BL, 61H 
        JGE DALPHABET_SMALL 
         
        CMP BL, 41H 
        JGE DALPHABET 
         
        CMP BL, 30H 
        JGE DDIGIT 
         
        CMP BL, 30H 
        JL DSPECIAL   
         
         
;--------------------------------------------          
         
    DSPECIAL: 
        LEA DX, SPECIAL 
        MOV AH, 09H 
        INT 21H       
         
        JMP AGAIN 
;---------------------------------------------         
    DDIGIT: 
        CMP BL, 39H 
        JG DSPECIAL 
         
        LEA DX, DIGIT 
        MOV AH, 09H 
        INT 21H 
         
        JMP AGAIN 
;---------------------------------------------         
    DALPHABET: 
        CMP BL, 5AH 
        JG DSPECIAL 
          
        LEA DX, ALPHABET 
        MOV AH, 09H 
        INT 21H 
         
        JMP AGAIN 
;---------------------------------------------         
    DALPHABET_SMALL: 
        CMP BL, 7AH 
        JG DSPECIAL 
         
        LEA DX, ALPHABET 
        MOV AH, 09H 
        INT 21H 
         
        JMP AGAIN     
;--------------------------------------------         
         
    EXIT:     
         
        MOV AH, 04CH 
        INT 21H 
         
    END START  