Module: memmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004C bytes
0000				memmove_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  89 D6				mov		esi,edx
0005  89 D9				mov		ecx,ebx
0007  39 C2				cmp		edx,eax
0009  74 3D				je		L$2
000B  73 27				jae		L$1
000D  01 DA				add		edx,ebx
000F  39 C2				cmp		edx,eax
0011  76 21				jbe		L$1
0013  8D 3C 18				lea		edi,[eax+ebx]
0016  8D 72 FF				lea		esi,-0x1[edx]
0019  4F				dec		edi
001A  8C DA				mov		edx,ds
001C  06				push		es
001D  8E C2				mov		es,edx
001F  FD				std		
0020  4E				dec		esi
0021  4F				dec		edi
0022  D1 E9				shr		ecx,0x01
0024  66 F3 A5				rep movsw	
0027  11 C9				adc		ecx,ecx
0029  46				inc		esi
002A  47				inc		edi
002B  66 F3 A4				rep movsb	
002E  07				pop		es
002F  FC				cld		
0030  5F				pop		edi
0031  5E				pop		esi
0032  59				pop		ecx
0033  C3				ret		
0034				L$1:
0034  8C DA				mov		edx,ds
0036  89 C7				mov		edi,eax
0038  06				push		es
0039  8E C2				mov		es,edx
003B  51				push		ecx
003C  C1 E9 02				shr		ecx,0x02
003F  F3 A5				rep movsd	
0041  59				pop		ecx
0042  83 E1 03				and		ecx,0x00000003
0045  F3 A4				rep movsb	
0047  07				pop		es
0048				L$2:
0048  5F				pop		edi
0049  5E				pop		esi
004A  59				pop		ecx
004B  C3				ret		

Routine Size: 76 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

