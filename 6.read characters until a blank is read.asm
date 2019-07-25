org 100h

MOV AH,1   ; prepare to read
Repeat:
			INT 21H       ; char in AL
; until
			CMP AL, ' '       ; a blank
			JNE REPEAT     ; no, keep reading


ret