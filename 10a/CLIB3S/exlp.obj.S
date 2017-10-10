Module: exlp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000013 bytes
0000				execlp:
0000  8D 44 24 08			lea		eax,0x8[esp]
0004  50				push		eax
0005  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0009  52				push		edx
000A  E8 00 00 00 00			call		execvp
000F  83 C4 08				add		esp,0x00000008
0012  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

