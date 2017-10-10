Module: fstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000046 bytes
0000				_fstrrev_:
0000  53				push		ebx
0001  51				push		ecx
0002  56				push		esi
0003  57				push		edi
0004  06				push		es
0005  0F A0				push		fs
0007  89 D6				mov		esi,edx
0009  89 C3				mov		ebx,eax
000B  8E E2				mov		fs,edx
000D  89 F1				mov		ecx,esi
000F  89 C7				mov		edi,eax
0011  89 C2				mov		edx,eax
0013  06				push		es
0014  8E C1				mov		es,ecx
0016  31 C0				xor		eax,eax
0018  89 C1				mov		ecx,eax
001A  49				dec		ecx
001B  F2 AE				repne scasb	
001D  F7 D1				not		ecx
001F  49				dec		ecx
0020  07				pop		es
0021  8D 04 0B				lea		eax,[ebx+ecx]
0024  8E C6				mov		es,esi
0026				L$1:
0026  48				dec		eax
0027  39 C2				cmp		edx,eax
0029  73 0F				jae		L$2
002B  26 8A 08				mov		cl,byte ptr es:[eax]
002E  64 8A 2A				mov		ch,byte ptr fs:[edx]
0031  64 88 0A				mov		byte ptr fs:[edx],cl
0034  42				inc		edx
0035  26 88 28				mov		byte ptr es:[eax],ch
0038  EB EC				jmp		L$1
003A				L$2:
003A  89 F2				mov		edx,esi
003C  89 D8				mov		eax,ebx
003E  0F A1				pop		fs
0040  07				pop		es
0041  5F				pop		edi
0042  5E				pop		esi
0043  59				pop		ecx
0044  5B				pop		ebx
0045  C3				ret		

Routine Size: 70 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

