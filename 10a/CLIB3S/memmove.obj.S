Module: memmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000052 bytes
0000				memmove:
0000  56				push		esi
0001  57				push		edi
0002  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0006  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
000A  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
000E  39 C6				cmp		esi,eax
0010  74 3D				je		L$2
0012  73 27				jae		L$1
0014  8D 14 0E				lea		edx,[esi+ecx]
0017  39 C2				cmp		edx,eax
0019  76 20				jbe		L$1
001B  8D 3C 08				lea		edi,[eax+ecx]
001E  8D 72 FF				lea		esi,-0x1[edx]
0021  4F				dec		edi
0022  8C DA				mov		edx,ds
0024  06				push		es
0025  8E C2				mov		es,edx
0027  FD				std		
0028  4E				dec		esi
0029  4F				dec		edi
002A  D1 E9				shr		ecx,0x01
002C  66 F3 A5				rep movsw	
002F  11 C9				adc		ecx,ecx
0031  46				inc		esi
0032  47				inc		edi
0033  66 F3 A4				rep movsb	
0036  07				pop		es
0037  FC				cld		
0038  5F				pop		edi
0039  5E				pop		esi
003A  C3				ret		
003B				L$1:
003B  8C DA				mov		edx,ds
003D  89 C7				mov		edi,eax
003F  06				push		es
0040  8E C2				mov		es,edx
0042  51				push		ecx
0043  C1 E9 02				shr		ecx,0x02
0046  F3 A5				rep movsd	
0048  59				pop		ecx
0049  83 E1 03				and		ecx,0x00000003
004C  F3 A4				rep movsb	
004E  07				pop		es
004F				L$2:
004F  5F				pop		edi
0050  5E				pop		esi
0051  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

