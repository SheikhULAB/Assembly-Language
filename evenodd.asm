;5. Take N input and identify if it is odd or even
;Input and Output:
;5
;1o2e3o4e5o

org 100h 
include 'emu8086.inc' 

printn 'Enter number of inputs:'

mov ah,1h   ;taking N inputs
int 21h;

printn
    
mov cl,al;  ;placing value of al to cl
sub cl,'0';    ;converting the value in cl into digit

top:
mov ah,01h   ;taking input
int 21h;

sub al,'0';      ;converting it to digit

mov ah,0;     ;assigning 0 to ah
mov dl,2;     ;assigning 2 to dl 

div dl;   ;quotient al = ax / dl ; reminder ah = ax % al 

cmp ah,0;   ;comparing ah with 0  
je output   ;goes to output

cmp cl,0;    ;comparing cl with 0
je end;      ;if cl=0 then end the program
 
print 'o';   ;number is odd

loop top 


output:  
cmp cl,0;       ;;comparing cl with 0
je end;          ;if cl=0 then end the program
print 'e';        ;number is even
loop top 


end:
mov ax,4c00h;
int 21h
ret