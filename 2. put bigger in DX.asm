org 100h

mov ah,01h  
int 21h 

MOV DX, AX  ; put AX input in DX


mov ah,01h  
int 21h 

MOV BX, AX  ; put BX input


CMP DX, BX   ; is AX / DX bigger than BX?
JG NEXT        ; yes, go on  

MOV DX, BX
mov ah,02h  ; PRINT BX
int 21h 
ret

NEXT:
mov ah,02h  ; PRINT AX
int 21h 






; DOS Exit
		MOV AH, 4CH
		INT 21h 

 
ret

                  
                  

	


