;varie
;richiesta di un valore da tastiera e stampa
;richiesta dato, elaborazione e stampa del codice ascii
;richiesta dato, elaborazione e stampa del valore numerico
.model small
.stack 200h
.data
	stringa db "inserisci un valore: ",13,10,"$"
	dato db ?
.code
main:
	mov ax,@data
	mov ds,ax
	lea dx,stringa
	mov ah,09h ;comandostampa
	int 21h
	mov ah,08h ;acquisiamo il carattere da tasiera ;01h con echo ;08h senza echo
	int 21h
	;mov dato,al
	;add al,dato
	;sub al,48
	mov dl,al
	mov ah,02h
	int 21h
	
	
	
	mov ah,4ch
	int 21h
end main