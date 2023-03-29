program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov cx, 00h
        petla:
               mov ax, cx
               push cx
               mov bl, 64h
               petla_wew:
                        mov ah, 0
                        div bl

                        add al, '0'
                        mov dl, al
                        push ax
                        mov ah, 02h
                        int 21h

                        pop ax
                        mov al, ah
                        mov ah, 00h
                        push ax
                        ;podzielenie bx przez 10
                        mov al, bl
                        mov bl, 0Ah
                        div bl
                        mov bh, 00h
                        mov bl, al
                        pop ax
                        cmp bl, 00h
                        jnz petla_wew ; jak 1 to po podzieleniu bedzie 0
               kon_wew:
               pop cx
               mov ah, 02h
               mov dx, ' '
               int 21h
               mov dx, '['
               int 21h
               mov dl, cl
               int 21h
               mov dx, ']'
               int 21h
               mov dl, 0Ah
               int 21h

               inc cl
               jnz petla
koniec:
        mov ah, 4ch
        int 21h
program ENDS
END start