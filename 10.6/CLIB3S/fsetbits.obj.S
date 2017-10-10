Module: fsetbits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				__fsetbits:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  55				push		ebp
0005  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0009  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
000D  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0011  B9 20 00 00 00			mov		ecx,0x00000020
0016  89 F2				mov		edx,esi
0018  89 EF				mov		edi,ebp
001A  30 C0				xor		al,al
001C  06				push		es
001D  57				push		edi
001E  8E C2				mov		es,edx
0020  88 C4				mov		ah,al
0022  D1 E9				shr		ecx,0x01
0024  F2 66 AB				repne stosw	
0027  11 C9				adc		ecx,ecx
0029  F2 AA				repne stosb	
002B  5F				pop		edi
002C  07				pop		es
002D  EB 23				jmp		L$2
002F				L$1:
002F  31 C0				xor		eax,eax
0031  88 D0				mov		al,dl
0033  8E C6				mov		es,esi
0035  C1 F8 03				sar		eax,0x03
0038  80 E2 07				and		dl,0x07
003B  81 E2 FF 00 00 00			and		edx,0x000000ff
0041  8A 92 00 00 00 00			mov		dl,byte ptr _Bits[edx]
0047  26 8A 34 28			mov		dh,byte ptr es:[eax+ebp]
004B  08 D6				or		dh,dl
004D  43				inc		ebx
004E  26 88 34 28			mov		byte ptr es:[eax+ebp],dh
0052				L$2:
0052  8E 44 24 24			mov		es,dword ptr 0x24[esp]
0056  26 8A 13				mov		dl,byte ptr es:[ebx]
0059  84 D2				test		dl,dl
005B  75 D2				jne		L$1
005D  5D				pop		ebp
005E  07				pop		es
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

