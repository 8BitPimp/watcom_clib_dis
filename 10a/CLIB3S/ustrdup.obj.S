Module: ustrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				_ustrdup:
0000  53				push		ebx
0001  56				push		esi
0002  55				push		ebp
0003  89 E5				mov		ebp,esp
0005  FF 75 10				push		dword ptr 0x10[ebp]
0008  E8 00 00 00 00			call		_ustrlen
000D  8D 70 01				lea		esi,0x1[eax]
0010  83 C4 04				add		esp,0x00000004
0013  01 F6				add		esi,esi
0015  56				push		esi
0016  E8 00 00 00 00			call		malloc
001B  83 C4 04				add		esp,0x00000004
001E  89 C3				mov		ebx,eax
0020  85 C0				test		eax,eax
0022  74 0D				je		L$1
0024  56				push		esi
0025  FF 75 10				push		dword ptr 0x10[ebp]
0028  50				push		eax
0029  E8 00 00 00 00			call		memcpy
002E  83 C4 0C				add		esp,0x0000000c
0031				L$1:
0031  89 D8				mov		eax,ebx
0033  5D				pop		ebp
0034  5E				pop		esi
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

