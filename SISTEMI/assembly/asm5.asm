.model small
.stack 200h
.data
	string_i db "Inserisci un valore: ", 10,13,"$"
	string_o db "Il valore maggiore è : ","$"
	val 1 dw ?
	val 2 dw ?
.code
main:
	mov ax,@data
	mov ds,ax
	
	lea dx,string_i
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,0
	mov val1,ax
	;vado a capo
	mov dx,10
	mov ah,02h
	int 21h
	mov dx,13
	mov ah,02h
	int 21h
	;acquisiamo il secondo dato
	lea dx,string_i
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,0
	mov val2,ax
	mov bx,val1
	mov nx,val2
	jae stampa
	lea dx,string_o
	mov ah,09h
	int 21h
	mov dx,val2
	mov ah,02h
	int 21h
	jmp fine
	
	
	
stampa:
	lea dx,string_o
	mov ah,09h
	int 21h
	mov dx,val1
	mov ah,02h
	int 21h
	fine:
	mov ah,4ch
	int 21h
	end main