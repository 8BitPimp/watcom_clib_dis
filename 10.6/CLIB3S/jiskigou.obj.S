Module: jiskigou
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				jiskigou:
0000  31 C0				xor		eax,eax
0002  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0007  3D 41 81 00 00			cmp		eax,0x00008141
000C  7C 14				jl		L$1
000E  3D AC 81 00 00			cmp		eax,0x000081ac
0013  7F 0D				jg		L$1
0015  3D 7F 81 00 00			cmp		eax,0x0000817f
001A  74 06				je		L$1
001C  B8 01 00 00 00			mov		eax,0x00000001
0021  C3				ret		
0022				L$1:
0022  31 C0				xor		eax,eax
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

