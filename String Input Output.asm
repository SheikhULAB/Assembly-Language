;Converting String to uppercase
;after inputting each character is checked whether they are in between 'a' and 'z' if so
;ASCII value of these character is substracted by 32

include 'emu8086.inc'

 PRINTN 'Enter length of string'
 mov ah,1h
 int 21h  ; getting input
 printn        
 
 
 print "Enter String here: "
 mov cl,al  ;moving input element from al to cl
 sub cl,'0'  ;// substracting
 mov dl,cl 
 mov bx,0                 
 
 p1:
 mov ah,1h
 int 21h  ;// again getting input 
 mov [bx],ax ;// doing a loop
 inc bx  ;// incrementing bx
 dec cl
 cmp cl,0 ;//comparing 
 jne p1   ;//checking not equal to  
 printn
 
 mov cl,dl
 mov bx,0

 output: ; //doing a loop again
 mov dl,[bx]
 ; print
 mov ah,2h
 int 21h
 inc bx   
 dec cl
 cmp cl,0  
 jne output  

 
 
 mov ax, 4c00h ; return to ms-dos
 int 21h
 
 ret