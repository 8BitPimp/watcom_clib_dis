Module: movedata
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002F bytes
0000				movedata:
0000  56				push		esi
0001  57				push		edi
0002  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
0006  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
000A  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000E  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0012  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0016  1E				push		ds
0017  06				push		es
0018  8E D8				mov		ds,eax
001A  8E C2				mov		es,edx
001C  89 C8				mov		eax,ecx
001E  C1 E9 02				shr		ecx,0x02
0021  F2 A5				repne movsd	
0023  8A C8				mov		cl,al
0025  80 E1 03				and		cl,0x03
0028  F2 A4				repne movsb	
002A  07				pop		es
002B  1F				pop		ds
002C  5F				pop		edi
002D  5E				pop		esi
002E  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

