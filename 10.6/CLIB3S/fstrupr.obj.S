Module: fstrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				_fstrupr:
0000  53				push		ebx
0001  06				push		es
0002  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0006  8E 44 24 10			mov		es,dword ptr 0x10[esp]
000A  89 CA				mov		edx,ecx
000C				L$1:
000C  26 8A 02				mov		al,byte ptr es:[edx]
000F  84 C0				test		al,al
0011  74 13				je		L$3
0013  2C 61				sub		al,0x61
0015  31 DB				xor		ebx,ebx
0017  88 C3				mov		bl,al
0019  83 FB 19				cmp		ebx,0x00000019
001C  7F 05				jg		L$2
001E  04 41				add		al,0x41
0020  26 88 02				mov		byte ptr es:[edx],al
0023				L$2:
0023  42				inc		edx
0024  EB E6				jmp		L$1
0026				L$3:
0026  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
002A  89 C8				mov		eax,ecx
002C  07				pop		es
002D  5B				pop		ebx
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

