Module: enterdb
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				__EnterWVIDEO:
0000  80 3D 00 00 00 00 00		cmp		byte ptr __WD_Present,0x00
0007  74 1F				je		L$2
0009  31 C0				xor		eax,eax
000B  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
0010  50				push		eax
0011  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0015  52				push		edx
0016  CC				int		0x03
0017  EB 06				jmp		L$1
0019  57				push		edi
001A  56				push		esi
001B  49				dec		ecx
001C  44				inc		esp
001D  45				inc		ebp
001E  4F				dec		edi
001F				L$1:
001F  B8 01 00 00 00			mov		eax,0x00000001
0024  83 C4 08				add		esp,0x00000008
0027  C3				ret		
0028				L$2:
0028  31 C0				xor		eax,eax
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000001 bytes
0000				__WD_Present:
0000  00                                              .

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

