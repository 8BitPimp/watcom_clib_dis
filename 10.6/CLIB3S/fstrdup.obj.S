Module: fstrdup
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				_fstrdup:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0008  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
000C  06				push		es
000D  8E C1				mov		es,ecx
000F  31 C0				xor		eax,eax
0011  89 C1				mov		ecx,eax
0013  49				dec		ecx
0014  F2 AE				repne scasb	
0016  F7 D1				not		ecx
0018  49				dec		ecx
0019  07				pop		es
001A  8D 71 01				lea		esi,0x1[ecx]
001D  56				push		esi
001E  8C DB				mov		ebx,ds
0020  E8 00 00 00 00			call		malloc
0025  89 C7				mov		edi,eax
0027  83 C4 04				add		esp,0x00000004
002A  89 C5				mov		ebp,eax
002C  85 C0				test		eax,eax
002E  75 05				jne		L$1
0030  66 85 DB				test		bx,bx
0033  74 25				je		L$2
0035				L$1:
0035  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
0039  89 F0				mov		eax,esi
003B  8C DA				mov		edx,ds
003D  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0041  1E				push		ds
0042  06				push		es
0043  57				push		edi
0044  91				xchg		eax,ecx
0045  8E D8				mov		ds,eax
0047  8E C2				mov		es,edx
0049  89 C8				mov		eax,ecx
004B  C1 E9 02				shr		ecx,0x02
004E  F2 A5				repne movsd	
0050  8A C8				mov		cl,al
0052  80 E1 03				and		cl,0x03
0055  F2 A4				repne movsb	
0057  58				pop		eax
0058  07				pop		es
0059  1F				pop		ds
005A				L$2:
005A  89 DA				mov		edx,ebx
005C  89 E8				mov		eax,ebp
005E  5D				pop		ebp
005F  5F				pop		edi
0060  5E				pop		esi
0061  5B				pop		ebx
0062  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

