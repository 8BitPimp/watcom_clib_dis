Module: fmemicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000062 bytes
0000				_fmemicmp:
0000  53				push		ebx
0001  56				push		esi
0002  06				push		es
0003  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0007  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
000B  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
000F  EB 47				jmp		L$5
0011				L$1:
0011  8E 44 24 14			mov		es,dword ptr 0x14[esp]
0015  31 C9				xor		ecx,ecx
0017  26 8A 23				mov		ah,byte ptr es:[ebx]
001A  88 E1				mov		cl,ah
001C  83 F9 41				cmp		ecx,0x00000041
001F  7C 08				jl		L$2
0021  83 F9 5A				cmp		ecx,0x0000005a
0024  7F 03				jg		L$2
0026  80 C4 20				add		ah,0x20
0029				L$2:
0029  8E 44 24 1C			mov		es,dword ptr 0x1c[esp]
002D  31 C9				xor		ecx,ecx
002F  26 8A 02				mov		al,byte ptr es:[edx]
0032  88 C1				mov		cl,al
0034  83 F9 41				cmp		ecx,0x00000041
0037  7C 07				jl		L$3
0039  83 F9 5A				cmp		ecx,0x0000005a
003C  7F 02				jg		L$3
003E  04 20				add		al,0x20
0040				L$3:
0040  38 C4				cmp		ah,al
0042  74 11				je		L$4
0044  31 D2				xor		edx,edx
0046  88 E2				mov		dl,ah
0048  25 FF 00 00 00			and		eax,0x000000ff
004D  29 C2				sub		edx,eax
004F  89 D0				mov		eax,edx
0051  07				pop		es
0052  5E				pop		esi
0053  5B				pop		ebx
0054  C3				ret		
0055				L$4:
0055  43				inc		ebx
0056  42				inc		edx
0057  4E				dec		esi
0058				L$5:
0058  85 F6				test		esi,esi
005A  75 B5				jne		L$1
005C  31 C0				xor		eax,eax
005E  07				pop		es
005F  5E				pop		esi
0060  5B				pop		ebx
0061  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

