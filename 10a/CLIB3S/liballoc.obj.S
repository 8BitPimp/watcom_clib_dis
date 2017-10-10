Module: liballoc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				_plib_malloc:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		malloc
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				_plib_free:
000E  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0012  52				push		edx
0013  E8 00 00 00 00			call		free
0018  83 C4 04				add		esp,0x00000004
001B  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

