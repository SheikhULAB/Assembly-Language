  TITLE PGM 12_2: SCREEN DISPLAY_2
 .MODEL SMALL
 .STACK 100H
 .CODE
MAIN    PROC
;set video mode
        MOV     AH,0      ;select mode function
        MOV     AL,3      ;80x25 color text
        INT     10H       ;select mode
;clear window to red
        MOV     AH,6              ;scroll up function
        MOV     CX,081Ah          ;upper left corner (1Ah,08h)
        MOV     DX,1034h          ;lower right corner (34h,10h)
        MOV     BH,43H            ;cyan chars on red background
        MOV     AL,0              ;scroll all lines
        INT     10H               ;clear window
;move cursor
        MOV     AH,2              ;move cursor function
        MOV     DX,0C27h          ;center of screen
        XOR     BH,BH             ;page 0
        INT     10H               ;move cursor
;display character with attribute
        MOV     AH,09             ;display character function
        MOV     BH,0              ;page 0
        MOV     BL,0C3H           ;blinking cyan char, red back
        MOV     CX,1              ;display one character
        MOV     AL,'A'            ;character is 'A'
        INT     10H               ;display character
;dos exit
        MOV     AH,4CH
        INT     21H              
MAIN    ENDP 
END     MAIN