Module: fsetpos
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				fsetpos:
0000  53				push		ebx
0001  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0005  6A 00				push		0x00000000
0007  8B 10				mov		edx,dword ptr [eax]
0009  52				push		edx
000A  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000E  53				push		ebx
000F  E8 00 00 00 00			call		fseek
0014  83 C4 0C				add		esp,0x0000000c
0017  5B				pop		ebx
0018  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

