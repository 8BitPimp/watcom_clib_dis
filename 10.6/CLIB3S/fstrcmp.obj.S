Module: fstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000				_fstrcmp:
0000  56				push		esi
0001  57				push		edi
0002  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0006  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
000A  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
000E  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0012  1E				push		ds
0013  06				push		es
0014  96				xchg		eax,esi
0015  8E D8				mov		ds,eax
0017  8E C1				mov		es,ecx
0019  A6				cmpsb		
001A  75 11				jne		L$1
001C  4F				dec		edi
001D  4E				dec		esi
001E  31 C0				xor		eax,eax
0020  89 C1				mov		ecx,eax
0022  49				dec		ecx
0023  F2 AE				repne scasb	
0025  F7 D1				not		ecx
0027  29 CF				sub		edi,ecx
0029  F3 A6				repe cmpsb	
002B  74 05				je		L$2
002D				L$1:
002D  19 C9				sbb		ecx,ecx
002F  83 D9 FF				sbb		ecx,0xffffffff
0032				L$2:
0032  07				pop		es
0033  1F				pop		ds
0034  89 C8				mov		eax,ecx
0036  5F				pop		edi
0037  5E				pop		esi
0038  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

