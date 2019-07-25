  TITLE PGM12_3: SCREEN EDITOR
    .MODEL  SMALL
    .STACK  100H
    .CODE
    MAIN    PROC
    ;set video mode and clear screen
            MOV     AH,0            ;set mode function
            MOV     AL,3            ;80x25 color text
            INT     10H             ;set mode
    ;move cursor to upper left corner
            MOV     AH,2            ;move cursor function
            XOR     DX,DX           ;position (0,0)
            MOV     BH,0            ;page 0
            INT     10H             ;move cursor
    ;get keystroke
            MOV     AH,0            ;keyboard input function
            INT     16H             ;AH=scan code,AL=ascii code
    WHILE_:
            CMP     AH,1            ;ESC (exit character)?
            JE      END_WHILE       ;yes, exit
    ;if function key
            CMP     AL,0            ;AL = 0?
            JNE     ELSE_           ;no, character key
    ;then
            CALL    DO_FUNCTION     ;execute function
            JMP     NEXT_KEY        ;get next keystroke
    ELSE_:			       ;display character
            MOV     AH,2            ;display character func
            MOV     DL,AL           ;GET CHARACTER
            INT     21H             ;display character
    NEXT_KEY:
            MOV     AH,0            ;get keystroke function
            INT     16H             ;AH=scan code,AL=ASCII code
            JMP     WHILE_
    END_WHILE:
    ;dos exit
            MOV     AH,4CH
            INT     21H     
    MAIN    ENDP
    
    DO_FUNCTION     PROC    
    ; operates the arrow keys
    ; input: AH scan code
    ; output: none
            PUSH    BX
            PUSH    CX
            PUSH    DX
            PUSH    AX              ;save scan code
    ;locate cursor
            MOV     AH,3            ;get cursor location
            MOV     BH,0            ;on page 0
            INT     10H             ;DH = row, DL = col
            POP     AX              ;retrieve scan code
    ;case scan code of
            CMP     AH,72           ;up arrow?
            JE      CURSOR_UP       ;yes, execute
            CMP     AH,75           ;left arrow?
            JE      CURSOR_LEFT     ;yes, execute
            CMP     AH,77           ;right arrow?
            JE      CURSOR_RIGHT    ;yes, execute
            CMP     AH,80           ;down arrow?
            JE      CURSOR_DOWN     ;yes, execute
            JMP     EXIT            ;other function key
    CURSOR_UP:
            CMP     DH,0            ;row 0?
            JE      SCROLL_DOWN     ;yes, scroll down
            DEC     DH              ;no, row = row - 1
            JMP     EXECUTE         ;go to execute
    CURSOR_DOWN:
            CMP     DH,24           ;last row?
            JE      SCROLL_UP       ;yes, scroll up
            INC     DH              ;no, row = row + 1
            JMP     EXECUTE         ;go to execute
    CURSOR_LEFT:
            CMP     DL,0            ;column 0?
            JNE     GO_LEFT         ;no, move to left
            CMP     DH,0            ;row 0?
            JE      SCROLL_DOWN     ;yes, scroll down
            DEC     DH              ;row = row - 1
            MOV     DL,79           ;last column
            JMP     EXECUTE         ;go to execute
    CURSOR_RIGHT:
            CMP     DL,79           ;last column?
            JNE     GO_RIGHT        ;no, move to right
            CMP     DH,24           ;last row?
            JE      SCROLL_UP       ;yes, scroll up
            INC     DH              ;row = row + 1
            MOV     DL,0            ;col = 0
            JMP     EXECUTE         ;go to execute
    GO_LEFT:
            DEC     DL              ;col = col - 1
            JMP     EXECUTE         ;go to execute
    GO_RIGHT:
            INC     DL              ;col = col + 1
            JMP     EXECUTE         ;go to execute
    SCROLL_DOWN:
            MOV     AL,1            ;scroll 1 line
            XOR     CX,CX           ;upper left corner = (0,0)
            MOV     DH,24           ;last row
            MOV     DL,79           ;last column
            MOV     BH,07           ;normal attribute
            MOV     AH,7            ;scroll down function
            INT     10H             ;scroll down 1 line
            JMP     EXIT            ;exit procedure
    SCROLL_UP:
            MOV     AL,1            ;scroll up 1 line
            XOR     CX,CX           ;upper left corner = (0,0)
            MOV     DX,184FH        ;lower right corner = (4Fh,18h)
            MOV     BH,07           ;normal attribute
            MOV     AH,6            ;scroll up function
            INT     10H             ;scroll up
            JMP     EXIT            ;exit procedure
    EXECUTE:
            MOV     AH,2            ;cursor move function
            INT     10H             ;move cursor
    EXIT:
            POP     DX
            POP     CX
            POP     BX
            RET             
    DO_FUNCTION     ENDP
            END     MAIN