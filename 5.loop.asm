org 100h

MOV CX, 80  ; no of stars to display
MOV AH, 2    ; display char function
MOV DL, '*'   ; character to display
TOP:
		INT 21h               ; display a star
		LOOP TOP           ; repeat 80 times


ret