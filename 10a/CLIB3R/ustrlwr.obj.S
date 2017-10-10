Module: ustrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000029 bytes
0000				_ustrlwr_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004				L$1:
0004  66 8B 18				mov		bx,word ptr [eax]
0007  66 85 DB				test		bx,bx
000A  74 18				je		L$3
000C  F6 C7 FF				test		bh,0xff
000F  75 0F				jne		L$2
0011  83 EB 41				sub		ebx,0x00000041
0014  66 83 FB 19			cmp		bx,0x0019
0018  77 06				ja		L$2
001A  83 C3 61				add		ebx,0x00000061
001D  66 89 18				mov		word ptr [eax],bx
0020				L$2:
0020  40				inc		eax
0021  40				inc		eax
0022  EB E0				jmp		L$1
0024				L$3:
0024  89 D0				mov		eax,edx
0026  5A				pop		edx
0027  5B				pop		ebx
0028  C3				ret		

Routine Size: 41 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

