program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov cx, 03h
        petla_zew:
                   ;wielokrotonsc liter
                   mov bx, cx
                   push cx
                   mov cx, 04h
                   sub cx, bx
                   mov ax, 03h
                   mul cx
                   mov bl, 'A'
                   mov cx, ax
                   petla:

                        mov ah, 02h
                        mov dl, bl
                        int 21h
                        inc bl
                        dec cx
                        jnz petla
                   ; tu jeszcze print entera
                   mov ah, 02h
                   mov dl, 0Ah
                   int 21h
                   pop cx
                   dec cx
                   jnz petla_zew
koniec:
        mov ah, 4ch
        int 21h

  zmienna db ?
program ENDS
END start