Module: rewind
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001B bytes
0000				rewind:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  6A 00				push		0x00000000
0006  8A 50 0C				mov		dl,byte ptr 0xc[eax]
0009  6A 00				push		0x00000000
000B  80 E2 CF				and		dl,0xcf
000E  50				push		eax
000F  88 50 0C				mov		byte ptr 0xc[eax],dl
0012  E8 00 00 00 00			call		fseek
0017  83 C4 0C				add		esp,0x0000000c
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

