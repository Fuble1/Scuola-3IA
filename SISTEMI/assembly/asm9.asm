.model small
.stack 200h
.data
	stringa db "inserisci un numero ",13,10,"$"
.code 

main: 
	mov ax,@data
	mov ds,ax
	
	lea dx,stringa
	mov ah,09h
	int 21h
	call leggi ;chiamata alla funzone

	;modifica con la call scrivi
	call scrivi
		
	;variante mov dx,bx
	;variante mov ah,02h
	;variante int 21h
	mov ah,4Ch 
	int 21h
	
; --------------- SEZIONI PROCEDURE ------------------

;procedure leggi
leggi proc near

	PUSH BP		;salvataggio vecchio BP
	mov BP,SP  	;BP punta alla cima dello stack
	mov bx,0h
	mov ah,01h
	int 21h
	mov ah,0
	mov bx,ax
	POP BP		;ripristino del registro BP
	RET 
leggi ENDP

; procedure scrivi
scrivi proc near
	PUSH BP		;salvataggio vecchio BP
	MOV BP,SP  	;BP punta alla cima dello stack
	mov dx,bx
	mov ah,02h
	int 21h
	POP BP
	RET

scrivi endp

end main