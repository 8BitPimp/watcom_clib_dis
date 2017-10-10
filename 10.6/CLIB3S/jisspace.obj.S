Module: jisspace
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000015 bytes
0000				jisspace:
0000  31 C0				xor		eax,eax
0002  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0007  3D 40 81 00 00			cmp		eax,0x00008140
000C  0F 94 C0				sete		al
000F  25 FF 00 00 00			and		eax,0x000000ff
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

