Module: diskfree
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				_getdiskfree:
0000  53				push		ebx
0001  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0005  52				push		edx
0006  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
000A  53				push		ebx
000B  E8 00 00 00 00			call		_dos_getdiskfree
0010  83 C4 08				add		esp,0x00000008
0013  5B				pop		ebx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

