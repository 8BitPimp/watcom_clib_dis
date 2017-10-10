Module: outpw
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000000B bytes
0000				outpw_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003  89 C2				mov		edx,eax
0005  89 D8				mov		eax,ebx
0007  66 EF				out		dx,ax
0009  5B				pop		ebx
000A  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

