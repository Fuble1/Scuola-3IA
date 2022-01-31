.model small
.stack 200h
.data
	stringa db "Inserisci un valore ", 13, 10,"$"
	val1 dw ?
	val2 dw ?
.code
main: 
	mov ax,@data
	mov ds,ax
	
	lea dx,stringa ;inseriamo il primo valore
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,0
	mov val1,ax
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	lea dx,stringa ; inseriamo il secondo valore
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,0
	mov val2,ax
	push val1
	push val2
	;eseguiamo una stampa per verificare che effettivamente
	;val1 e val2 contengono ancora i valori iniziali
	mov ah,0
	mov ax,val1
	mov dx,ax
	mov ah,02h
	int 21h
	mov ah,0
	mov ax,val2
	mov dx,ax
	mov ah,02h
	int 21h
	;preleviamo adesso i valori dallo stack eseguendo un cambio di variabili
	mov ah,0
	mov al,0
	pop ax
	mov val1,ax
	mov ah,0
	mov al,0
	pop ax
	mov val2,ax
	;rieseguo la stampa, ma invertita
	mov ax,val1
	mov dx,ax
	mov ah,02h
	int 21h
	
	mov ax,val2
	mov dx,ax
	mov ah,02h
	int 21h
	
	
	mov ah,4Ch 
	int 21h
end main