INCLUDE Irvine32.inc
.data
;ROTORS, REFLECTOR AND INVERSES
sysmode byte 3 dup(?)
IntialSys  byte "<A> <A> <A>",0
plug       byte "ABCDEFGHIJKLMNOPQRSTUVWXYZ",0
alphasys   byte "ABCDEFGHIJKLMNOPQRSTUVWXYZ",0
RotorI     byte	"BDFHJLCPRTXVZNYEIWGAKMUSQO",0
RotorII    byte	"AJDKSIRUXBLHWTMCQGZNPYFVOE",0
RotorIII   byte	"EKMFLGDQVZNTOWYHXUSPAIBRCJ",0
Reflector  byte	"YRUHQSLDPXNGOKMIEBFZCWVJAT",0
InversedI  byte	"TAGBPCSDQEUFVNZHYIXJWLRKOM",0
InversedII byte	"AJPCZWRLFBDKOTYUQGENHXMIVS",0
InverseIII byte "UWYGADFPVZBECKMTHXSLRINQOJ",0
plugspace  byte "||||||||||||||||||||||||||",0
nextpage   byte	"Press 'Enter' to continue...",0
dis1       byte "                         This is The plugs system:--",0
dis2       byte "You can change this system, enter 1st character then the 2nd:",0
dis3       byte "                    ----------The plugs changed!----------",0
dis4       byte "                   This is The Intial System Mode for Rotors",0
dis5       byte "Enter your system: <",0
x byte ?
y byte ?
;end


.code
main PROC
	call page1
	call clearscreen
	call page2
	exit
main ENDP

page1 proc uses edx eax
	
	mov edx,offset dis1
	call writestring
	call crlf
	call crlf
	mov edx,offset alphasys
	call writestring
	call crlf
	mov edx,offset plugspace
	call writestring
	call crlf
	mov edx,offset alphasys
	call writestring
	call crlf
	call crlf
	mov edx,offset dis2
	call writestring
	call readchar
	mov x,al
	call writechar
	call readchar
	call writechar
	call readchar
	mov y,al
	call writechar
	call crlf
	mov ecx,26
	mov esi,offset plug
	swapchar:
		mov al,[esi]
		mov bl,x
		mov bh,y
		cmp al,bl
		je swapx
		jmp cont
		cont:
		cmp al,bh
		je swapy
		jmp en
		swapy:
		mov [esi],bl
		jmp en
		swapx:
		mov [esi],bh
		jmp en
		en:
		inc esi
	loop swapchar
	call crlf
	mov edx,offset dis3
	call writestring
	call crlf
	call crlf
	mov edx,offset alphasys
	call writestring
	call crlf
	mov edx,offset plugspace
	call writestring
	call crlf
	mov edx,offset plug
	call writestring
	call crlf
	call crlf
	ret
page1 endp

clearscreen proc uses edx eax
	mov edx,offset nextpage
	call writestring
	call readint
	call clrscr
	ret
clearscreen endp

page2 proc uses edx esi
	mov esi,offset sysmode
	mov edx,offset dis4
	call writestring
	call crlf
	call crlf
	mov edx,offset intialsys
	call writestring
	call crlf
	mov edx, offset dis5
	call writestring
	call readchar
	mov [esi],al
	call writechar
	inc esi
	mov al,62
	call writechar
	mov al,32
	call writechar
	mov al,60
	call writechar
	call readchar
	mov [esi],al
	call writechar
	inc esi
	mov al,62
	call writechar
	mov al,32
	call writechar
	mov al,60
	call writechar
	call readchar
	mov [esi],al
	call writechar
	mov al,62
	call writechar
	call crlf
	call crlf
	ret
page2 endp

END main
