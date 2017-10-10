Module: strdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				_strdup:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		strdup
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				strdup:
000E  53				push		ebx
000F  56				push		esi
0010  57				push		edi
0011  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0015  89 F7				mov		edi,esi
0017  06				push		es
0018  8C D8				mov		eax,ds
001A  8E C0				mov		es,eax
001C  29 C9				sub		ecx,ecx
001E  49				dec		ecx
001F  31 C0				xor		eax,eax
0021  F2 AE				repne scasb	
0023  F7 D1				not		ecx
0025  49				dec		ecx
0026  07				pop		es
0027  8D 59 01				lea		ebx,0x1[ecx]
002A  53				push		ebx
002B  E8 00 00 00 00			call		malloc
0030  83 C4 04				add		esp,0x00000004
0033  89 C2				mov		edx,eax
0035  85 C0				test		eax,eax
0037  74 1A				je		L$1
0039  89 C7				mov		edi,eax
003B  89 D9				mov		ecx,ebx
003D  06				push		es
003E  8C D8				mov		eax,ds
0040  8E C0				mov		es,eax
0042  57				push		edi
0043  89 C8				mov		eax,ecx
0045  C1 E9 02				shr		ecx,0x02
0048  F2 A5				repne movsd	
004A  8A C8				mov		cl,al
004C  80 E1 03				and		cl,0x03
004F  F2 A4				repne movsb	
0051  5F				pop		edi
0052  07				pop		es
0053				L$1:
0053  89 D0				mov		eax,edx
0055  5F				pop		edi
0056  5E				pop		esi
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

