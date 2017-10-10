Module: printf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				printf:
0000  83 EC 04				sub		esp,0x00000004
0003  8D 44 24 0C			lea		eax,0xc[esp]
0007  89 04 24				mov		dword ptr [esp],eax
000A  89 E0				mov		eax,esp
000C  50				push		eax
000D  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0011  52				push		edx
0012  68 1A 00 00 00			push		offset __iob+0x1a
0017  E8 00 00 00 00			call		__fprtf
001C  83 C4 0C				add		esp,0x0000000c
001F  83 C4 04				add		esp,0x00000004
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

