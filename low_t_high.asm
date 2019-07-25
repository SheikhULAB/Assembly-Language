org 100h

mov ah,01h
int 21h

sub al,32

mov dl,al

mov ah,02h
int 21h


mov ah,4ch
int 21h

ret