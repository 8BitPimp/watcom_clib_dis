Module: fstrrev
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				_fstrrev:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  55				push		ebp
0007  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
000B  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
000F  8E E6				mov		fs,esi
0011  89 F1				mov		ecx,esi
0013  89 EF				mov		edi,ebp
0015  89 EA				mov		edx,ebp
0017  06				push		es
0018  8E C1				mov		es,ecx
001A  31 C0				xor		eax,eax
001C  89 C1				mov		ecx,eax
001E  49				dec		ecx
001F  F2 AE				repne scasb	
0021  F7 D1				not		ecx
0023  49				dec		ecx
0024  07				pop		es
0025  8D 04 29				lea		eax,[ecx+ebp]
0028  8E C6				mov		es,esi
002A				L$1:
002A  48				dec		eax
002B  39 C2				cmp		edx,eax
002D  73 0F				jae		L$2
002F  64 8A 3A				mov		bh,byte ptr fs:[edx]
0032  26 8A 18				mov		bl,byte ptr es:[eax]
0035  64 88 1A				mov		byte ptr fs:[edx],bl
0038  42				inc		edx
0039  26 88 38				mov		byte ptr es:[eax],bh
003C  EB EC				jmp		L$1
003E				L$2:
003E  89 F2				mov		edx,esi
0040  89 E8				mov		eax,ebp
0042  5D				pop		ebp
0043  0F A1				pop		fs
0045  07				pop		es
0046  5F				pop		edi
0047  5E				pop		esi
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

