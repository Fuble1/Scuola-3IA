.model small
.stack 200h
.data
	stringi db "Inserisci un numero: ",13,10,"$"
	num db 0 ; num è la variabile che tiene conto della riga
.code
main:
	mov ax,@data
	mov ds,ax
	
	lea dx,stringi
	mov ah,09h
	int 21h
	mov ah,08h	;ssenza echo
	int 21h
	sub al,30h ;30h 48 in decimale
	mov bl,al ; bl contiene il numero inserito dall'utente
	inc num
	mov cl,num
	;andiamo a capo, ci assicuriamo di essere sulla riga "pulitoa"
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	add num,30h
colonna:
	mov dl,num
	mov ah,02h
	int 21h
	dec cl
	cmp cl,0
	jne colonna
	sub num,30h
	cmp num,bl
	jb riga
	
end main