Module: fstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				_fstrcat:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000F  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0013  1E				push		ds
0014  06				push		es
0015  50				push		eax
0016  66 8E C2				mov		es,dx
0019  66 8E D9				mov		ds,cx
001C  8B F3				mov		esi,ebx
001E  8B F8				mov		edi,eax
0020  2B C9				sub		ecx,ecx
0022  49				dec		ecx
0023  B0 00				mov		al,0x00
0025  F2 AE				repne scasb	
0027  4F				dec		edi
0028				L$1:
0028  8A 06				mov		al,byte ptr [esi]
002A  AA				stosb		
002B  3C 00				cmp		al,0x00
002D  74 0B				je		L$2
002F  8A 46 01				mov		al,byte ptr 0x1[esi]
0032  83 C6 02				add		esi,0x00000002
0035  AA				stosb		
0036  3C 00				cmp		al,0x00
0038  75 EE				jne		L$1
003A				L$2:
003A  58				pop		eax
003B  07				pop		es
003C  1F				pop		ds
003D  5F				pop		edi
003E  5E				pop		esi
003F  5B				pop		ebx
0040  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

