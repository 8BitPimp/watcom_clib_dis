Module: gtchewnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000				getche:
0000  53				push		ebx
0001  56				push		esi
0002  8B 35 00 00 00 00			mov		esi,dword ptr _cbyte
0008  E8 00 00 00 00			call		getch
000D  89 C2				mov		edx,eax
000F  89 C3				mov		ebx,eax
0011  83 F8 FF				cmp		eax,0xffffffff
0014  74 0D				je		L$1
0016  85 F6				test		esi,esi
0018  75 09				jne		L$1
001A  50				push		eax
001B  E8 00 00 00 00			call		putch
0020  83 C4 04				add		esp,0x00000004
0023				L$1:
0023  89 D8				mov		eax,ebx
0025  5E				pop		esi
0026  5B				pop		ebx
0027  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

