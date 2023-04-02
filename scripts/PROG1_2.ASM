program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov cx, 0Ah
        mov bl, 'A'
        petla:

                mov ah, 02h
                mov dl, bl
                int 21h
                inc bl
                dec cx
                jnz petla
koniec:
        mov ah, 4ch
        int 21h

  zmienna db ?
program ENDS
END start