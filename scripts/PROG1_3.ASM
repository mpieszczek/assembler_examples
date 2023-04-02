program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov cx, 03h
        petla_zew:
                   mov bx, cx
                   push cx
                   mov cx, bx
                   mov cx, 03h
                   sub cx, bx
                   jz next
                   mov ax, cx
                   mov cx, 02h
                   mul cx
                   mov cx, ax
                   spacje:
                        mov ah, 02h
                        mov dl, ' '
                        int 21h
                        dec cx
                        jnz spacje
                   next:
                   mov bl, 'A'
                   mov cx, 0Ah
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