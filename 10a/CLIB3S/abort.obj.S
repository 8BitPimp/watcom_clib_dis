Module: abort
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000019 bytes
0000				abort:
0000  FF 15 00 00 00 00			call		dword ptr __abort

Routine Size: 6 bytes,    Routine Base: _TEXT + 0000

0006				__terminate:
0006  68 FF 00 00 00			push		0x000000ff
000B  68 00 00 00 00			push		offset DGROUP:L$1
0010  E8 00 00 00 00			call		__fatal_runtime_error
0015  83 C4 08				add		esp,0x00000008
0018  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 0006

No disassembly errors

Segment: CONST DWORD USE32 00000017 bytes
0000				L$1:
0000  41 42 4E 4F 52 4D 41 4C 20 54 45 52 4D 49 4E 41 ABNORMAL TERMINA
0010  54 49 4F 4E 0D 0A 00                            TION...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				__abort:
0000  00 00 00 00                                     DD	offset __terminate

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

