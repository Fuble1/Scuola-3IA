;utilizzo della pop e push e scambio del contenuto delle variabili
;val1 e val2
.model small
.stack 200h
.data
	stringa db "Inserisci un valore ", 13,10,"$"
	val1 dw ?
	val2 dw ?
.code
main:
	mov ax,@data
	mov ds,ax
	lea dx,stringa
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	;in al abbiamo il dato inserito da tastiera
	mov ah,0
	mov val1,ax
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;ristampo il messaggio
	lea dx,stringa
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	;in al abbiamo il dato inserito da tastiera
	mov ah,0
	mov val2,ax
	push val1
	push val2
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;stampiamo il contenuto delle variabili val1 e val2
	mov dx,val1
	mov ah,02h
	int 21h
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;stampiamo val2
	mov dx,val2
	mov ah,02h
	int 21h
	;prelevo i dati dallo stack passandoli prima 
	;per un registro bx per poi memorizzarli nelle variabili
	mov bx,0
	pop bx
	mov val1,bx
	mov bx,0
	pop bx
	mov val2,bx
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;verifichiamo che il contenuto delle variabili si siano scambiati
	mov dx,val1
	mov ah,02h
	int 21h
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;stampiamo val2
	mov dx,val2
	mov ah,02h
	int 21h
	mov ah,4Ch
	int 21h
end main