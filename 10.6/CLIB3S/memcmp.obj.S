Module: memcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				memcmp:
0000  56				push		esi
0001  57				push		edi
0002  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0006  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
000A  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
000E  06				push		es
000F  8C D8				mov		eax,ds
0011  8E C0				mov		es,eax
0013  31 C0				xor		eax,eax
0015  F3 A6				repe cmpsb	
0017  74 05				je		L$1
0019  19 C0				sbb		eax,eax
001B  83 D8 FF				sbb		eax,0xffffffff
001E				L$1:
001E  07				pop		es
001F  5F				pop		edi
0020  5E				pop		esi
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

