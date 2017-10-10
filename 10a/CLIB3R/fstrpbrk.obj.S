Module: fstrpbrk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000050 bytes
0000				_fstrpbrk_:
0000  56				push		esi
0001  06				push		es
0002  83 EC 20				sub		esp,0x00000020
0005  8E C2				mov		es,edx
0007  89 C6				mov		esi,eax
0009  89 E0				mov		eax,esp
000B  8C DA				mov		edx,ds
000D  E8 00 00 00 00			call		__fsetbits_
0012  EB 2B				jmp		L$3
0014				L$1:
0014  31 C0				xor		eax,eax
0016  88 D8				mov		al,bl
0018  C1 F8 03				sar		eax,0x03
001B  31 D2				xor		edx,edx
001D  8A 14 04				mov		dl,byte ptr [esp+eax]
0020  88 D8				mov		al,bl
0022  24 07				and		al,0x07
0024  25 FF 00 00 00			and		eax,0x000000ff
0029  8A 80 00 00 00 00			mov		al,byte ptr __Bits[eax]
002F  25 FF 00 00 00			and		eax,0x000000ff
0034  85 C2				test		edx,eax
0036  74 06				je		L$2
0038  8C C2				mov		edx,es
003A  89 F0				mov		eax,esi
003C  EB 0C				jmp		L$4
003E				L$2:
003E  46				inc		esi
003F				L$3:
003F  26 8A 1E				mov		bl,byte ptr es:[esi]
0042  84 DB				test		bl,bl
0044  75 CE				jne		L$1
0046  31 D2				xor		edx,edx
0048  31 C0				xor		eax,eax
004A				L$4:
004A  83 C4 20				add		esp,0x00000020
004D  07				pop		es
004E  5E				pop		esi
004F  C3				ret		

Routine Size: 80 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

