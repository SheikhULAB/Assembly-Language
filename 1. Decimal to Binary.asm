;Decimal to binary:

include 'emu8086.inc'
 
PRINTN 'Enter number :'

 mov ah,01h
 int 21h     ;//getting input in al 
 
 sub al,'0'  ;// we are getting input as a character so substract '0' to get the original number
 mov bx,0
 
 printn
 print 'The binary form of the number is '
 printn
 
 p1:
 mov ah,0
 mov dl,2
 div dl     ;// quotient al = ax / dl ; reminder ah = ax % al    
 
 mov dl,al  ;// moving quotient to dl
 mov al,ah  ; // moving the result/reminder to al 
 mov ah,0
 push ax    ;//pushing the result/reminder to the stack
 
 mov al,dl
 inc bx
 cmp al,0    ;//checking if the remainder is 0 or not 
 je label1   ;//if so move to label1
 loop p1     ; //if not return this chunk of code named p1
 
 label1:
 mov cx,bx 
 
 
 
 func:
 pop dx       ;// popping the stack element which is the result
 add dx,'0'
 mov ah,02h   ;// outputting the result
 int 21h
 loop func
 
 mov ax, 4c00h ; return to ms-dos
 int 21h
 ret
