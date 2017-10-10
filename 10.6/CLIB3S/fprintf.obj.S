Module: fprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				fprintf:
0000  53				push		ebx
0001  83 EC 04				sub		esp,0x00000004
0004  8D 44 24 14			lea		eax,0x14[esp]
0008  89 04 24				mov		dword ptr [esp],eax
000B  89 E0				mov		eax,esp
000D  50				push		eax
000E  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0012  52				push		edx
0013  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0017  53				push		ebx
0018  E8 00 00 00 00			call		__fprtf
001D  83 C4 0C				add		esp,0x0000000c
0020  83 C4 04				add		esp,0x00000004
0023  5B				pop		ebx
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

