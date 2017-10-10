Module: memchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000022 bytes
0000				memchr:
0000  57				push		edi
0001  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
0005  8A 44 24 0C			mov		al,byte ptr 0xc[esp]
0009  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
000D  06				push		es
000E  E3 0B				jecxz		L$1
0010  8C DA				mov		edx,ds
0012  8E C2				mov		es,edx
0014  F2 AE				repne scasb	
0016  75 03				jne		L$1
0018  4F				dec		edi
0019  66 A9                                           f.
001B				L$1:
001B  89 CF				mov		edi,ecx
001D  07				pop		es
001E  89 F8				mov		eax,edi
0020  5F				pop		edi
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

