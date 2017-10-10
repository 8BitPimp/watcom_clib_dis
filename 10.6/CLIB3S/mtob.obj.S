Module: mtob
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002E bytes
0000				mtob:
0000  53				push		ebx
0001  83 EC 04				sub		esp,0x00000004
0004  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0008  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
000C				L$1:
000C  4B				dec		ebx
000D  83 FB FF				cmp		ebx,0xffffffff
0010  74 13				je		L$2
0012  89 E2				mov		edx,esp
0014  52				push		edx
0015  50				push		eax
0016  E8 00 00 00 00			call		jgetmoji
001B  83 C4 08				add		esp,0x00000008
001E  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0023  75 E7				jne		L$1
0025				L$2:
0025  2B 44 24 0C			sub		eax,dword ptr 0xc[esp]
0029  83 C4 04				add		esp,0x00000004
002C  5B				pop		ebx
002D  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

