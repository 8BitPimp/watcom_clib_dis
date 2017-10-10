Module: fmemchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000028 bytes
0000				_fmemchr:
0000  57				push		edi
0001  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0005  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0009  8A 44 24 10			mov		al,byte ptr 0x10[esp]
000D  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
0011  06				push		es
0012  E3 0B				jecxz		L$1
0014  8E C2				mov		es,edx
0016  F2 AE				repne scasb	
0018  75 05				jne		L$1
001A  4F				dec		edi
001B  8C C1				mov		ecx,es
001D  66 A9                                           f.
001F				L$1:
001F  89 CF				mov		edi,ecx
0021  07				pop		es
0022  89 CA				mov		edx,ecx
0024  89 F8				mov		eax,edi
0026  5F				pop		edi
0027  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

