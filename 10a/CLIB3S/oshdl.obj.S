Module: oshdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				_os_handle:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  83 F8 FF				cmp		eax,0xffffffff
0007  74 0D				je		L$1
0009  89 C2				mov		edx,eax
000B  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
0010  C1 E2 02				shl		edx,0x02
0013  8B 04 02				mov		eax,dword ptr [edx+eax]
0016				L$1:
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

