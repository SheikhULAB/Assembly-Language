org 100h

MOV AH, 01H
INT 21H

MOV BL, AL   ; take in BL
 
MOV AH, 01H  ; take in AL
INT 21H

       
CMP AL, BL    
       
JNBE ELSE 
MOV DL, AL   

JMP DISPLAY

ELSE:
      	MOV DL, BL
      	
DISPLAY: 
        MOV AH, 02H
        INT 21h  


 
ret




