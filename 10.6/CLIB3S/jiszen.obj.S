Module: jiszen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003F bytes
0000				jiszen:
0000  31 C0				xor		eax,eax
0002  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0007  C1 F8 08				sar		eax,0x08
000A  25 FF 00 00 00			and		eax,0x000000ff
000F  8A 80 01 00 00 00			mov		al,byte ptr _IsKTable+0x1[eax]
0015  24 04				and		al,0x04
0017  25 FF 00 00 00			and		eax,0x000000ff
001C  74 1E				je		L$1
001E  8A 44 24 04			mov		al,byte ptr 0x4[esp]
0022  25 FF 00 00 00			and		eax,0x000000ff
0027  8A 80 01 00 00 00			mov		al,byte ptr _IsKTable+0x1[eax]
002D  24 08				and		al,0x08
002F  25 FF 00 00 00			and		eax,0x000000ff
0034  74 06				je		L$1
0036  B8 01 00 00 00			mov		eax,0x00000001
003B  C3				ret		
003C				L$1:
003C  31 C0				xor		eax,eax
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

