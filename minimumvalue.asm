;Finding minimum number

include 'emu8086.inc'
  
 PRINTN 'How many numbers'
 mov ah,1h
 int 21h  ;getting input by these two line
 printn  
 
 
 print "Enter numbers: "   
 mov dx,ax ;moving input element to dx and cl registor
 mov cl,al
 sub cl,'0'  ;substracting
 mov bx,0    
 
 p1:
 mov ah,1h
 int 21h   ;doing  a loop 
 mov [bx],ax
 printn
 inc bx
 dec cl
 cmp cl,0  ; comparing command  
 jne p1   ; checking if not equal to 
 printn  
 
 mov ax,dx        ; keep no of item in ax
 sub ax,'0' 
 mov cl,al 
 mov bx,0       
 
 errfix:
 mov dl, [bx]
 
 p2: 
 mov al, [bx]
 cmp al,dl   ; comparing
 jg func    ;checking if greater than or not  // label1 is a chunk of code		
 jle label1    ;checking if less than or not  // func is a chunk of code
 
;do this two task repeatedly  as this is a loop

 label1:
 mov dl,al
 
 func: 
 inc bx 
 loop p2
 
 mov ah,02h
 int 21h 
 
 mov ax, 4c00h ; return to ms-dos
 int 21h
 
 ret