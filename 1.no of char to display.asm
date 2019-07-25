org 100h

MOV CX, 5  ; no of char to display
MOV DL, 0 

PRINT_LOOP:
        mov ah,01h  ; take input in AL
        int 21h
        
        mov dl, al 
        
        mov ah,02h         ; show output
        int 21h
		 
		DEC CX		; keep going if CX not 0
		JNZ PRINT_LOOP
		
; DOS Exit
		MOV AH, 4CH
		INT 21h 

 
ret




