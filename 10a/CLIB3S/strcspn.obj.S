Module: strcspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004F bytes
0000				strcspn:
0000  53				push		ebx
0001  83 EC 20				sub		esp,0x00000020
0004  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
0008  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
000C  52				push		edx
000D  8D 44 24 04			lea		eax,0x4[esp]
0011  50				push		eax
0012  E8 00 00 00 00			call		__setbits
0017  83 C4 08				add		esp,0x00000008
001A  31 C9				xor		ecx,ecx
001C  EB 22				jmp		L$2
001E				L$1:
001E  89 C2				mov		edx,eax
0020  C1 EA 03				shr		edx,0x03
0023  8A 14 14				mov		dl,byte ptr [esp+edx]
0026  83 E0 07				and		eax,0x00000007
0029  81 E2 FF 00 00 00			and		edx,0x000000ff
002F  8A 80 00 00 00 00			mov		al,byte ptr _Bits[eax]
0035  25 FF 00 00 00			and		eax,0x000000ff
003A  85 C2				test		edx,eax
003C  75 0A				jne		L$3
003E  41				inc		ecx
003F  43				inc		ebx
0040				L$2:
0040  31 C0				xor		eax,eax
0042  8A 03				mov		al,byte ptr [ebx]
0044  85 C0				test		eax,eax
0046  75 D6				jne		L$1
0048				L$3:
0048  89 C8				mov		eax,ecx
004A  83 C4 20				add		esp,0x00000020
004D  5B				pop		ebx
004E  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

