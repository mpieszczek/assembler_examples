program SEGMENT
ORG 100h
ASSUME CS:program

start:
        mov cx, 0Ch ;dl boku
        kolumna:
               ; znaczki 186 187 188 200 201 205
               ; 11*16+10 = 186 BA BB BC BD BE
               mov bx, 0Ah
               push cx
               cmp cx, 0Ch
               jz wiersz_beg
               cmp cx, 01h
               jz wiersz_end
               wiersz_mid:
                           mov ah, 02h
                           mov dx, 'º'
                           int 21h
                           mov ah, 03h
                           int 10h
                           mov ah, 02h
                           add dl, 14h
                           int 10h
                           mov ah, 02h
                           mov dx, 'º'
                           int 21h
                           jmp next

               wiersz_end:
                           mov ah, 02h
                           mov dx, 'È'
                           int 21h
                           mov dx, 'Í'
                           jmp srodek

               wiersz_beg:
                           mov ah, 02h
                           mov dx, 'É'
                           int 21h
                           mov dx, 'Í'
                           jmp srodek

               srodek: ;printuje znak z rejestru dx
                        mov ah, 02h
                        mov cx, 14h
                        sr_petla:
                                  int 21h
                                  dec cx
                                  jnz sr_petla
               pop cx
               cmp cx, 0Ch
               jz pgr
               cmp cx, 01h
               jz pdr
               pgr:
                    mov ah, 02h
                    mov dx, '»'
                    int 21h
                    push cx
                    jmp next
               pdr:
                    mov ah, 02h
                    mov dx, '¼'
                    int 21h
                    push cx
                    jmp next

               next:
               pop cx
               mov ah, 02h
               mov dl, 0Ah
               int 21h
               dec cx
               jnz kolumna
koniec:
        mov ah, 4ch
        int 21h
program ENDS
END start