Module: fsetbits
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000064 bytes
0000				__fsetbits:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  0F A0				push		fs
0006  0F B4 74 24 18			lfs		esi,fword ptr 0x18[esp]
000B  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
000F  B9 20 00 00 00			mov		ecx,0x00000020
0014  8C E2				mov		edx,fs
0016  89 F7				mov		edi,esi
0018  30 C0				xor		al,al
001A  06				push		es
001B  57				push		edi
001C  8E C2				mov		es,edx
001E  88 C4				mov		ah,al
0020  D1 E9				shr		ecx,0x01
0022  F2 66 AB				repne stosw	
0025  11 C9				adc		ecx,ecx
0027  F2 AA				repne stosb	
0029  5F				pop		edi
002A  07				pop		es
002B  EB 25				jmp		L$2
002D				L$1:
002D  31 C0				xor		eax,eax
002F  8C E1				mov		ecx,fs
0031  88 D0				mov		al,dl
0033  8E C1				mov		es,ecx
0035  C1 F8 03				sar		eax,0x03
0038  80 E2 07				and		dl,0x07
003B  81 E2 FF 00 00 00			and		edx,0x000000ff
0041  8A 92 00 00 00 00			mov		dl,byte ptr _Bits[edx]
0047  26 8A 34 06			mov		dh,byte ptr es:[esi+eax]
004B  08 D6				or		dh,dl
004D  43				inc		ebx
004E  26 88 34 06			mov		byte ptr es:[esi+eax],dh
0052				L$2:
0052  8E 44 24 24			mov		es,dword ptr 0x24[esp]
0056  26 8A 13				mov		dl,byte ptr es:[ebx]
0059  84 D2				test		dl,dl
005B  75 D0				jne		L$1
005D  0F A1				pop		fs
005F  07				pop		es
0060  5F				pop		edi
0061  5E				pop		esi
0062  5B				pop		ebx
0063  C3				ret		

Routine Size: 100 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

