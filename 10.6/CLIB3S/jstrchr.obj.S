Module: jstrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000034 bytes
0000				jstrchr:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 04				sub		esp,0x00000004
0005  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0009  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
000D				L$1:
000D  89 E0				mov		eax,esp
000F  50				push		eax
0010  53				push		ebx
0011  E8 00 00 00 00			call		jgetmoji
0016  83 C4 08				add		esp,0x00000008
0019  8B 14 24				mov		edx,dword ptr [esp]
001C  66 39 D6				cmp		si,dx
001F  75 04				jne		L$2
0021  89 D8				mov		eax,ebx
0023  EB 09				jmp		L$3
0025				L$2:
0025  89 C3				mov		ebx,eax
0027  66 85 D2				test		dx,dx
002A  75 E1				jne		L$1
002C  31 C0				xor		eax,eax
002E				L$3:
002E  83 C4 04				add		esp,0x00000004
0031  5E				pop		esi
0032  5B				pop		ebx
0033  C3				ret		

Routine Size: 52 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

