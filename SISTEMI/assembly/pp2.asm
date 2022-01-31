;Servendoti dello stack(pop e push) 
;chiedere all'utente 4 valori(ad una cifra) 
;e stampare il maggiore e il minore.
.model small
.stack 200h
.data
	stringi  db  "Inserisci un valore ", 13, 10,"$"
	stringo  db  "Il valore maggiore e': ","$"
	stringoo db  "Il valore minore e': ","$"
	min dw ?
	max dw ?
.code
main: 
	mov ax,@data
	mov ds,ax
	mov cl,04h	;conteggia quante volte preleviamo il dato dallo stack
	;inseriamo il primo valore
	lea dx,stringi 
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ah,0 ;pulire il registro
	push ax
	;secondo valore
	mov ah,01h
	int 21h
	mov ah,0
	push ax
	;terzo valore
	mov ah,01h
	int 21h
	mov ah,0
	push ax
	;quarto valore
	mov ah,01h
	int 21h
	mov ah,0
	push ax
	;prendo inizialmente i primi due valori dallo stack e li metto in min e max
	pop ax
	dec cl
	mov min,ax
	pop ax
	dec cl
	mov max,ax
	cmp ax,min 	;ossia confronto max con min 
	jae pre_conf  ;salta se max>min
	mov bx,0
	;scambio tra max e min
	mov bx,min
	mov min,ax
	mov max,bx
pre_conf:
	pop ax   	;prelevo il 3Â°dato dallo stack e lo confronto prima con min
	dec cl
	cmp ax,min
	jb sca_min
	cmp ax,max	;altrimenti lo confronta con max
	ja sca_mas 
	;se non Ã¨ un valore maggiore di max o minore di min 
	;preleviamo l'ultimo dato dallo stack
	pop ax 
	dec cl
	cmp ax,min
	jb sca_min
	cmp ax,max	
	ja sca_mas
	jmp fine
sca_mas:	
	mov max,ax
	cmp cl,0
	je fine
	pop ax 
	dec cl
	cmp ax,min
	jb sca_min
	cmp ax,max	
	ja sca_mas
	jmp fine
sca_min:
	mov min,ax
	cmp cl,0
	je fine
	pop ax  
	dec cl 	
	cmp ax,min
	jb sca_min
	cmp ax,max	
	ja sca_mas
	jmp fine
fine:
	mov dl,10	;invio a capo
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	lea dx,stringo
	mov ah,09h
	int 21h
	mov dx,max
	mov ah,02h
	int 21h
	;vado a capo
	mov dl,10	;invio a capo
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	lea dx,stringoo
	mov ah,09h
	int 21h
	mov dx,min
	mov ah,02h
	int 21h
	mov ah,4Ch 
	int 21h
end main