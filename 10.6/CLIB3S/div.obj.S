Module: div
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003C bytes
0000				div:
0000  53				push		ebx
0001  57				push		edi
0002  06				push		es
0003  83 EC 08				sub		esp,0x00000008
0006  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
000A  89 F3				mov		ebx,esi
000C  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0010  89 CA				mov		edx,ecx
0012  89 C8				mov		eax,ecx
0014  C1 FA 1F				sar		edx,0x1f
0017  F7 FE				idiv		esi
0019  89 04 24				mov		dword ptr [esp],eax
001C  89 CA				mov		edx,ecx
001E  89 C8				mov		eax,ecx
0020  C1 FA 1F				sar		edx,0x1f
0023  F7 FE				idiv		esi
0025  89 DF				mov		edi,ebx
0027  8C D8				mov		eax,ds
0029  89 E6				mov		esi,esp
002B  8E C0				mov		es,eax
002D  89 54 24 04			mov		dword ptr 0x4[esp],edx
0031  A5				movsd		
0032  A5				movsd		
0033  89 D8				mov		eax,ebx
0035  83 C4 08				add		esp,0x00000008
0038  07				pop		es
0039  5F				pop		edi
003A  5B				pop		ebx
003B  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

