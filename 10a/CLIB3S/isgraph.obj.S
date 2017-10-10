Module: isgraph
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				isgraph:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  8A 80 01 00 00 00			mov		al,byte ptr _IsTable+0x1[eax]
000A  24 0A				and		al,0x0a
000C  3C 08				cmp		al,0x08
000E  0F 94 C0				sete		al
0011  25 FF 00 00 00			and		eax,0x000000ff
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

