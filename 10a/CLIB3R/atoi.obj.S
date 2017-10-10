Module: atoi
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000				atoi_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003				L$1:
0003  8A 10				mov		dl,byte ptr [eax]
0005  FE C2				inc		dl
0007  81 E2 FF 00 00 00			and		edx,0x000000ff
000D  F6 82 00 00 00 00 02		test		byte ptr __IsTable[edx],0x02
0014  74 03				je		L$2
0016  40				inc		eax
0017  EB EA				jmp		L$1
0019				L$2:
0019  8A 08				mov		cl,byte ptr [eax]
001B  80 F9 2B				cmp		cl,0x2b
001E  74 05				je		L$3
0020  80 F9 2D				cmp		cl,0x2d
0023  75 01				jne		L$4
0025				L$3:
0025  40				inc		eax
0026				L$4:
0026  31 DB				xor		ebx,ebx
0028				L$5:
0028  8A 10				mov		dl,byte ptr [eax]
002A  FE C2				inc		dl
002C  81 E2 FF 00 00 00			and		edx,0x000000ff
0032  F6 82 00 00 00 00 20		test		byte ptr __IsTable[edx],0x20
0039  74 0F				je		L$6
003B  6B DB 0A				imul		ebx,0x0000000a
003E  31 D2				xor		edx,edx
0040  8A 10				mov		dl,byte ptr [eax]
0042  01 D3				add		ebx,edx
0044  40				inc		eax
0045  83 EB 30				sub		ebx,0x00000030
0048  EB DE				jmp		L$5
004A				L$6:
004A  80 F9 2D				cmp		cl,0x2d
004D  75 02				jne		L$7
004F  F7 DB				neg		ebx
0051				L$7:
0051  89 D8				mov		eax,ebx
0053  5A				pop		edx
0054  59				pop		ecx
0055  5B				pop		ebx
0056  C3				ret		

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

