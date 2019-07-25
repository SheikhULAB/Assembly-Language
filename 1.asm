
      TITLE PGM12_1: SCREEN DISPLAY_1
     .MODEL  SMALL
     .STACK  100H
     .CODE
     MAIN    PROC
     ;set DS to active display page
             MOV     AX,0B800h  ;color active display page    
             MOV     DS,AX                   
             MOV     CX,2000    ;80*25 = 2000 words 
             MOV     DI,0       ;initialize DI
     ;fill active display page
     FILL_BUF:
             MOV     word ptr[DI],1441h ;red A on blue
             ADD     DI,2       ;go to next word
             LOOP    FILL_BUF   ;loop until done
     ;dos exit
             MOV     AH,4CH                  
             INT     21H
     MAIN    ENDP 
             END     MAIN