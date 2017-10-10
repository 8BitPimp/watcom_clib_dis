Module: fstrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006F bytes
0000				_fstrpbrk:
0000  53				push		ebx
0001  06				push		es
0002  83 EC 20				sub		esp,0x00000020
0005  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
0009  31 C0				xor		eax,eax
000B  66 8B 44 24 38			mov		ax,word ptr 0x38[esp]
0010  50				push		eax
0011  8B 54 24 38			mov		edx,dword ptr 0x38[esp]
0015  52				push		edx
0016  8C D8				mov		eax,ds
0018  8D 54 24 08			lea		edx,0x8[esp]
001C  25 FF FF 00 00			and		eax,0x0000ffff
0021  50				push		eax
0022  52				push		edx
0023  E8 00 00 00 00			call		__fsetbits
0028  83 C4 10				add		esp,0x00000010
002B  8E 44 24 30			mov		es,dword ptr 0x30[esp]
002F  EB 2D				jmp		L$3
0031				L$1:
0031  31 D2				xor		edx,edx
0033  88 C2				mov		dl,al
0035  C1 FA 03				sar		edx,0x03
0038  8A 14 14				mov		dl,byte ptr [esp+edx]
003B  81 E2 FF 00 00 00			and		edx,0x000000ff
0041  24 07				and		al,0x07
0043  25 FF 00 00 00			and		eax,0x000000ff
0048  8A 80 00 00 00 00			mov		al,byte ptr _Bits[eax]
004E  25 FF 00 00 00			and		eax,0x000000ff
0053  85 C2				test		edx,eax
0055  74 06				je		L$2
0057  8C C2				mov		edx,es
0059  89 D8				mov		eax,ebx
005B  EB 0C				jmp		L$4
005D				L$2:
005D  43				inc		ebx
005E				L$3:
005E  26 8A 03				mov		al,byte ptr es:[ebx]
0061  84 C0				test		al,al
0063  75 CC				jne		L$1
0065  31 D2				xor		edx,edx
0067  31 C0				xor		eax,eax
0069				L$4:
0069  83 C4 20				add		esp,0x00000020
006C  07				pop		es
006D  5B				pop		ebx
006E  C3				ret		

Routine Size: 111 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

