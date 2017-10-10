Module: calloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				calloc:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  0F AF 5C 24 0C			imul		ebx,dword ptr 0xc[esp]
000A  53				push		ebx
000B  E8 00 00 00 00			call		malloc
0010  83 C4 04				add		esp,0x00000004
0013  85 C0				test		eax,eax
0015  74 0C				je		L$1
0017  53				push		ebx
0018  6A 00				push		0x00000000
001A  50				push		eax
001B  E8 00 00 00 00			call		memset
0020  83 C4 0C				add		esp,0x0000000c
0023				L$1:
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

