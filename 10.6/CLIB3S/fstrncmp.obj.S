Module: fstrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				_fstrncmp:
0000  53				push		ebx
0001  06				push		es
0002  0F A0				push		fs
0004  C4 44 24 10			les		eax,fword ptr 0x10[esp]
0008  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
000C  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0010  8E 64 24 1C			mov		fs,dword ptr 0x1c[esp]
0014				L$1:
0014  85 DB				test		ebx,ebx
0016  75 07				jne		L$3
0018				L$2:
0018  31 C0				xor		eax,eax
001A  0F A1				pop		fs
001C  07				pop		es
001D  5B				pop		ebx
001E  C3				ret		
001F				L$3:
001F  26 8A 08				mov		cl,byte ptr es:[eax]
0022  64 8A 2A				mov		ch,byte ptr fs:[edx]
0025  38 E9				cmp		cl,ch
0027  74 16				je		L$4
0029  88 C8				mov		al,cl
002B  25 FF 00 00 00			and		eax,0x000000ff
0030  88 EA				mov		dl,ch
0032  81 E2 FF 00 00 00			and		edx,0x000000ff
0038  29 D0				sub		eax,edx
003A  0F A1				pop		fs
003C  07				pop		es
003D  5B				pop		ebx
003E  C3				ret		
003F				L$4:
003F  26 80 38 00			cmp		byte ptr es:[eax],0x00
0043  74 D3				je		L$2
0045  40				inc		eax
0046  42				inc		edx
0047  4B				dec		ebx
0048  EB CA				jmp		L$1

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

