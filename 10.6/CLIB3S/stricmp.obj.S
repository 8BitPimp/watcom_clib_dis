Module: stricmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				_stricmp:
0000				strcmpi:
0000  53				push		ebx
0001  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0005  52				push		edx
0006  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
000A  53				push		ebx
000B  E8 00 00 00 00			call		stricmp
0010  83 C4 08				add		esp,0x00000008
0013  5B				pop		ebx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015				stricmp:
0015  53				push		ebx
0016  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
001A  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
001E				L$1:
001E  8A 02				mov		al,byte ptr [edx]
0020  31 C9				xor		ecx,ecx
0022  8A 23				mov		ah,byte ptr [ebx]
0024  88 C1				mov		cl,al
0026  83 F9 41				cmp		ecx,0x00000041
0029  7C 07				jl		L$2
002B  83 F9 5A				cmp		ecx,0x0000005a
002E  7F 02				jg		L$2
0030  04 20				add		al,0x20
0032				L$2:
0032  31 C9				xor		ecx,ecx
0034  88 E1				mov		cl,ah
0036  83 F9 41				cmp		ecx,0x00000041
0039  7C 08				jl		L$3
003B  83 F9 5A				cmp		ecx,0x0000005a
003E  7F 03				jg		L$3
0040  80 C4 20				add		ah,0x20
0043				L$3:
0043  38 E0				cmp		al,ah
0045  75 08				jne		L$4
0047  84 E4				test		ah,ah
0049  74 04				je		L$4
004B  42				inc		edx
004C  43				inc		ebx
004D  EB CF				jmp		L$1
004F				L$4:
004F  31 D2				xor		edx,edx
0051  88 C2				mov		dl,al
0053  88 E0				mov		al,ah
0055  25 FF 00 00 00			and		eax,0x000000ff
005A  29 C2				sub		edx,eax
005C  89 D0				mov		eax,edx
005E  5B				pop		ebx
005F  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

