org 100h

MOV AH, 01H
INT 21H

SUB AL, 48

CMP AL,1  
JE ODD        
CMP AL,3
JE ODD

CMP AL,2  
JE EVEN 
CMP AL,4           
JE EVEN 
JG DISPLAY

ODD:           
    MOV DL, '0'
    MOV AH,2
    INT 21H
    RET


EVEN:
    MOV DL, 'E'
    MOV AH,2
    INT 21H
    RET

DISPLAY:
       
ret




