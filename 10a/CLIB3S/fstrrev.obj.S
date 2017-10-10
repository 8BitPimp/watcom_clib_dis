Module: fstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004D bytes
0000				_fstrrev:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  0F A8				push		gs
0008  0F B5 74 24 1C			lgs		esi,fword ptr 0x1c[esp]
000D  8C E8				mov		eax,gs
000F  89 F2				mov		edx,esi
0011  8C E9				mov		ecx,gs
0013  89 F7				mov		edi,esi
0015  8C EB				mov		ebx,gs
0017  8E E0				mov		fs,eax
0019  06				push		es
001A  8E C1				mov		es,ecx
001C  31 C0				xor		eax,eax
001E  89 C1				mov		ecx,eax
0020  49				dec		ecx
0021  F2 AE				repne scasb	
0023  F7 D1				not		ecx
0025  49				dec		ecx
0026  07				pop		es
0027  8D 04 0E				lea		eax,[esi+ecx]
002A  8E C3				mov		es,ebx
002C				L$1:
002C  48				dec		eax
002D  39 C2				cmp		edx,eax
002F  73 0F				jae		L$2
0031  26 8A 18				mov		bl,byte ptr es:[eax]
0034  64 8A 3A				mov		bh,byte ptr fs:[edx]
0037  64 88 1A				mov		byte ptr fs:[edx],bl
003A  42				inc		edx
003B  26 88 38				mov		byte ptr es:[eax],bh
003E  EB EC				jmp		L$1
0040				L$2:
0040  8C EA				mov		edx,gs
0042  89 F0				mov		eax,esi
0044  0F A9				pop		gs
0046  0F A1				pop		fs
0048  07				pop		es
0049  5F				pop		edi
004A  5E				pop		esi
004B  5B				pop		ebx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

