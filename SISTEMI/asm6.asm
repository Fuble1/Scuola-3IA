.model small
.stack 200h
.data
	stringi db "Inserisci un numero a piu' cifre: ",13,10,"$"
	cifra db ?
	numero db ?
.code
main:
	mov ax,@data
	mov ds,ax
	mov numero,0
	lea dx,stringi
	mov ah,09h
	int 21h
	mov bl,10d

	mov ah,01h
	int 21h
	salta:
	cmp al,13d
	je fine
	sub al,48d ; convertirlo nella cifra numerica
	mov cifra,al
	mov al,numero
	mul bl 
	add al,cifra
	mov numero,al
	mov ah,01h
	int 21h
	jmp salta
fine:
	; andiamo a capo
	mov dl,10	
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	; stampiamo il contenuto della variabile numero
stampa:
	mov ah,0
	mov al,numero
	div bl
	mov numero,al
	mov dl,ah
	add dl,48d
	mov ah,02h
	int 21h
	cmp numero,0
	jne stampa
	
	mov ah,4Ch 
	int 21h
end main