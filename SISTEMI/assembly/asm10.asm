;ESEGUIRE LA SOMMA TRA DUE INTERI TRAMITE PUSH E POP
.model small
.stack 200h
.data
	stringa db "inserisci un numero ",13,10,"$"
	n db ?
	somma1 dw ?
.code 
diffe proc near
	push BP
	mov BP,SP
	
	mov ax,[BP + 4]
	;PROVA DISTAMPAAA
	mov dx,ax
	add dl,48d
	mov ah,02h
	int 21h
	mov ah,00
	
	mov bx,[BP + 6]
	;PROVA DISTAMPAAA
	mov dx,bx
	add dl,48d
	mov ah,02h
	int 21h
	mov bh,00
	
	mov ax,[BP + 4]
	mov bx,[BP + 6]
	cmp ax,bx
	jl cambia
	jmp fine
cambia:
	xchg ax,bx
fine:
	sub ax,bx
	mov [BP + 6],ax
	pop BP
	ret
endp 
; ------------  INIZIO  MAIN  ------------------
main: 
	mov ax,@data
	mov ds,ax
	
	lea dx,stringa
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	mov ah,00
	sub al,48d
	push ax
	;andiamo a capo
	mov dl,10	
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	lea dx,stringa
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,00
	sub al,48d
	push ax
	
	call diffe
	
	pop ax
	pop ax

	mov somma1,ax
	
	;andiamo a capo
	mov dl,10	
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	
	mov dx,somma1
	add dl,48d
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
end main