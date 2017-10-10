Module: clockwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000				curr_tick:
0000  53				push		ebx
0001  E8 00 00 00 00			call		_GetTickCount
0006  BB 0A 00 00 00			mov		ebx,0x0000000a
000B  31 D2				xor		edx,edx
000D  F7 F3				div		ebx
000F  5B				pop		ebx
0010  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011				__clock_init:
0011  E8 00 00 00 00			call		curr_tick
0016  A3 00 00 00 00			mov		dword ptr clock_start,eax
001B  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0011

001C				__clock:
001C  E8 00 00 00 00			call		curr_tick
0021  2B 05 00 00 00 00			sub		eax,dword ptr clock_start
0027  C3				ret		

Routine Size: 12 bytes,    Routine Base: _TEXT + 001C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				clock_start:

BSS Size: 4 bytes

