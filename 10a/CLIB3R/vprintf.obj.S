Module: vprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000017 bytes
0000				vprintf_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C3				mov		ebx,eax
0004  89 D1				mov		ecx,edx
0006  B8 1A 00 00 00			mov		eax,offset ___iob+0x1a
000B  89 DA				mov		edx,ebx
000D  89 CB				mov		ebx,ecx
000F  E8 00 00 00 00			call		__fprtf_
0014  59				pop		ecx
0015  5B				pop		ebx
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

