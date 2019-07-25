;Divisible by 5
;same thing is done as we did in the previous file
;here except we did all the work with 5 in place of 4

include 'emu8086.inc'
 
 mov bx,0
 mov ax,0
 
 PRINTN 'Enter number'     

 p1:
     mov ah,01h
     int 21h
      
     cmp al,13
     je label1 
     
     sub al,'0'
     mov [bx],ax
     inc bx
     loop p1
 
 label1:
     printn
     dec bx
     mov al,[bx]
     
     cmp al,5
     je func1 
     
     cmp al,0
     je func1 
     
     printn 'Not Divisible by 5'
     ret    
     
 
 func1:
     printn 'Divisible by 5'
     ret
     