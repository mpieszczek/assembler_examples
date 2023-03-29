program SEGMENT
ORG 100h
ASSUME CS:program

start:
        ;puting chars to stack
        ;» ¼ É È Í º

           mov cx, '¼'
           push cx
           mov cx, 'Í'
           push cx
           mov cx, 'È'
           push cx


           mov bx, 14
           petla:
                  mov cx, 'º'
                  push cx
                  mov cx, '±'
                  push cx
                  mov cx, 'º'
                  push cx
                  dec bx
                  jnz petla

           mov cx, '»'
           push cx
           mov cx, 'Í'
           push cx
           mov cx, 'É'
           push cx


        mov ah, 02h
        mov bh, 00h
        mov dl, 00h
        mov dh, 00h
        int 10h
        ;mov ah, 09h ;const command num
        ;mov bh, 00h ;page
        mov bl, 0 ;color
        ;mov cx, 1 ; times
        ;mov al - char
        mov bh, 10h
        line:
             inc bl;zm kolor co linie
             pop ax
             push bx
             ;print from stack
             mov ah, 09h
             mov bh, 00h
             mov cx, 01h
             int 10h
             ;change cursor
             mov ah, 02h
             mov bh, 00h
             inc dl
             int 10h

             pop bx
             pop ax
             push bx
             ;print middle
             mov ah, 09h
             mov bh, 00h
             mov cx, 20h
             int 10h

             mov ah, 02h
             mov bh, 00h
             add dl, 20h
             int 10h

             pop bx
             pop ax
             push bx
             ;print from stack
             mov ah, 09h
             mov bh, 00h
             mov cx, 01h
             int 10h
             ;change cursor
             mov ah, 02h
             mov bh, 00h
             inc dl
             int 10h

             ;enter - tu zmieniamy kursor

             mov ah, 02h
             mov dl, 00h
             inc dh
             int 10h

             pop bx
             dec bh
             jnz line

koniec:
        mov ah, 4ch
        int 21h
program ENDS
END start