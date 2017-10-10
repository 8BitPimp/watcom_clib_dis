Module: mblen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000014 bytes
0000				mblen_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004  89 D1				mov		ecx,edx
0006  89 DA				mov		edx,ebx
0008  31 C0				xor		eax,eax
000A  89 CB				mov		ebx,ecx
000C  E8 00 00 00 00			call		mbtowc_
0011  59				pop		ecx
0012  5B				pop		ebx
0013  C3				ret		

Routine Size: 20 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

