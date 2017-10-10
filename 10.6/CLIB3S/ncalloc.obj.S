Module: ncalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				_ncalloc:
0000  53				push		ebx
0001  56				push		esi
0002  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0006  0F AF 5C 24 10			imul		ebx,dword ptr 0x10[esp]
000B  53				push		ebx
000C  E8 00 00 00 00			call		_nmalloc
0011  83 C4 04				add		esp,0x00000004
0014  89 C6				mov		esi,eax
0016  85 C0				test		eax,eax
0018  74 0C				je		L$1
001A  53				push		ebx
001B  6A 00				push		0x00000000
001D  50				push		eax
001E  E8 00 00 00 00			call		memset
0023  83 C4 0C				add		esp,0x0000000c
0026				L$1:
0026  89 F0				mov		eax,esi
0028  5E				pop		esi
0029  5B				pop		ebx
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

