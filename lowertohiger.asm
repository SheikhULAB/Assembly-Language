 org 100h
include 'emu8086.inc'
print "enter length of string : "

mov ah,01h
int 21h

mov cl,al
sub cl,'0'
mov dl,cl
mov bx,0

printn
 print "enter strings here : "
input:
     mov ah,01h
     int 21h   
     
     mov [bx],al
     inc bx
     dec cl
     cmp cl,0
     jne input
  
 printn
 print "inputted strings : "
 
 mov cl,dl
 mov bx,0
 
 output:
      
    mov dl,[bx]
    sub dl,32
    
    mov ah,02h
    int 21h
    
    inc bx
    dec cl
    cmp cl,0
    jne output
 
 
 mov ah,4ch
 int 21h
 
 ret