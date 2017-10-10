Module: umask
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				umask:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  81 E2 80 01 00 00			and		edx,0x00000180
000A  A1 00 00 00 00			mov		eax,dword ptr __umaskval
000F  89 15 00 00 00 00			mov		dword ptr __umaskval,edx
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

