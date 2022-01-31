;ESEGUI LA SOMMA TRA DUE NUMERI 
;INSERITI DA PROGRAMMA
.model small ;identifica la dimensione di tutti i segmenti
.stack 200h ; dimensione dello stack
.data
	n db 3
	m db 3
	
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov a,00h ;inizializzaione
	
	mov al,n
	add al,m
	
	;add al,48
	
	mov dl,al
	
	mov ah,02h
	int 21h
	
	mov ax,4ch
	int 21h
end main