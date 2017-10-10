Module: tclen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000024 bytes
0000				_tclen:
0000  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0007  74 17				je		L$1
0009  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
000D  31 C0				xor		eax,eax
000F  8A 02				mov		al,byte ptr [edx]
0011  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
0017  24 01				and		al,0x01
0019  25 FF 00 00 00			and		eax,0x000000ff
001E  40				inc		eax
001F  C3				ret		
0020				L$1:
0020  31 C0				xor		eax,eax
0022  40				inc		eax
0023  C3				ret		

Routine Size: 36 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

