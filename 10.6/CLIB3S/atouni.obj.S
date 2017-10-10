Module: atouni
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000043 bytes
0000				_atouni:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0008  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
000C  89 D7				mov		edi,edx
000E  06				push		es
000F  8C D8				mov		eax,ds
0011  8E C0				mov		es,eax
0013  29 C9				sub		ecx,ecx
0015  49				dec		ecx
0016  31 C0				xor		eax,eax
0018  F2 AE				repne scasb	
001A  F7 D1				not		ecx
001C  49				dec		ecx
001D  07				pop		es
001E  8D 59 01				lea		ebx,0x1[ecx]
0021  8D 04 1B				lea		eax,[ebx+ebx]
0024  89 EE				mov		esi,ebp
0026  01 E8				add		eax,ebp
0028  01 DA				add		edx,ebx
002A				L$1:
002A  39 F0				cmp		eax,esi
002C  76 0E				jbe		L$2
002E  4A				dec		edx
002F  30 ED				xor		ch,ch
0031  83 E8 02				sub		eax,0x00000002
0034  8A 0A				mov		cl,byte ptr [edx]
0036  4B				dec		ebx
0037  66 89 08				mov		word ptr [eax],cx
003A  EB EE				jmp		L$1
003C				L$2:
003C  89 E8				mov		eax,ebp
003E  5D				pop		ebp
003F  5F				pop		edi
0040  5E				pop		esi
0041  5B				pop		ebx
0042  C3				ret		

Routine Size: 67 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

