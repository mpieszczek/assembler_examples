program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov ah, 02h
        mov dl, '*'
        int 21h

        mov al, 'A'
        mov bh, 00h
        mov bl, 14
        mov cx, 5
        
        mov ah, 09h
        int 10h

koniec:
        mov ah, 4ch
        int 21h

  zmienna db ?
program ENDS
END start