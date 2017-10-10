Module: exv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				execv:
0000  53				push		ebx
0001  8B 15 00 00 00 00			mov		edx,dword ptr environ
0007  52				push		edx
0008  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000C  53				push		ebx
000D  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
0011  51				push		ecx
0012  E8 00 00 00 00			call		execve
0017  83 C4 0C				add		esp,0x0000000c
001A  5B				pop		ebx
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

