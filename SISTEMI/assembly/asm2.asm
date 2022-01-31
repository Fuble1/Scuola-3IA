.model small
.stack 200h
.data
	m dw 71
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov SI,0100h
	mov ax,m
	mov [SI*],ax

	mov dx,[SI]
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
end main
