Module: fstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000066 bytes
0000				_fstrspn:
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
002B  31 C9				xor		ecx,ecx
002D  8E 44 24 30			mov		es,dword ptr 0x30[esp]
0031  EB 22				jmp		L$2
0033				L$1:
0033  89 C2				mov		edx,eax
0035  C1 EA 03				shr		edx,0x03
0038  8A 14 14				mov		dl,byte ptr [esp+edx]
003B  83 E0 07				and		eax,0x00000007
003E  81 E2 FF 00 00 00			and		edx,0x000000ff
0044  8A 80 00 00 00 00			mov		al,byte ptr _Bits[eax]
004A  25 FF 00 00 00			and		eax,0x000000ff
004F  85 C2				test		edx,eax
0051  74 0B				je		L$3
0053  43				inc		ebx
0054  41				inc		ecx
0055				L$2:
0055  31 C0				xor		eax,eax
0057  26 8A 03				mov		al,byte ptr es:[ebx]
005A  85 C0				test		eax,eax
005C  75 D5				jne		L$1
005E				L$3:
005E  89 C8				mov		eax,ecx
0060  83 C4 20				add		esp,0x00000020
0063  07				pop		es
0064  5B				pop		ebx
0065  C3				ret		

Routine Size: 102 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

