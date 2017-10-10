Module: spl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000021 bytes
0000				spawnl:
0000  53				push		ebx
0001  8B 15 00 00 00 00			mov		edx,dword ptr environ
0007  52				push		edx
0008  8D 44 24 14			lea		eax,0x14[esp]
000C  50				push		eax
000D  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0011  53				push		ebx
0012  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0016  51				push		ecx
0017  E8 00 00 00 00			call		spawnve
001C  83 C4 10				add		esp,0x00000010
001F  5B				pop		ebx
0020  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

