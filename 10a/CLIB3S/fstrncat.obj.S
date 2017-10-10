Module: fstrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005C bytes
0000				_fstrncat:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  55				push		ebp
0007  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
000B  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
000F  8B 74 24 2C			mov		esi,dword ptr 0x2c[esp]
0013  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0017  B9 FF FF FF FF			mov		ecx,0xffffffff
001C  89 EF				mov		edi,ebp
001E  30 C0				xor		al,al
0020  06				push		es
0021  E3 0B				jecxz		L$1
0023  8E C2				mov		es,edx
0025  F2 AE				repne scasb	
0027  75 05				jne		L$1
0029  4F				dec		edi
002A  8C C1				mov		ecx,es
002C  66 A9                                           f.
002E				L$1:
002E  89 CF				mov		edi,ecx
0030  07				pop		es
0031  8E 64 24 28			mov		fs,dword ptr 0x28[esp]
0035  8E C1				mov		es,ecx
0037				L$2:
0037  85 F6				test		esi,esi
0039  74 0F				je		L$3
003B  64 8A 03				mov		al,byte ptr fs:[ebx]
003E  26 88 07				mov		byte ptr es:[edi],al
0041  84 C0				test		al,al
0043  74 05				je		L$3
0045  47				inc		edi
0046  43				inc		ebx
0047  4E				dec		esi
0048  EB ED				jmp		L$2
004A				L$3:
004A  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
004E  89 E8				mov		eax,ebp
0050  26 C6 07 00			mov		byte ptr es:[edi],0x00
0054  5D				pop		ebp
0055  0F A1				pop		fs
0057  07				pop		es
0058  5F				pop		edi
0059  5E				pop		esi
005A  5B				pop		ebx
005B  C3				ret		

Routine Size: 92 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

