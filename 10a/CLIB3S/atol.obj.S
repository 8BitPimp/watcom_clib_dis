Module: atol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000				atol:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005				L$1:
0005  8A 10				mov		dl,byte ptr [eax]
0007  FE C2				inc		dl
0009  81 E2 FF 00 00 00			and		edx,0x000000ff
000F  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
0016  74 03				je		L$2
0018  40				inc		eax
0019  EB EA				jmp		L$1
001B				L$2:
001B  8A 08				mov		cl,byte ptr [eax]
001D  80 F9 2B				cmp		cl,0x2b
0020  74 05				je		L$3
0022  80 F9 2D				cmp		cl,0x2d
0025  75 01				jne		L$4
0027				L$3:
0027  40				inc		eax
0028				L$4:
0028  31 DB				xor		ebx,ebx
002A				L$5:
002A  8A 10				mov		dl,byte ptr [eax]
002C  FE C2				inc		dl
002E  81 E2 FF 00 00 00			and		edx,0x000000ff
0034  F6 82 00 00 00 00 20		test		byte ptr _IsTable[edx],0x20
003B  74 0F				je		L$6
003D  6B DB 0A				imul		ebx,0x0000000a
0040  31 D2				xor		edx,edx
0042  8A 10				mov		dl,byte ptr [eax]
0044  01 D3				add		ebx,edx
0046  40				inc		eax
0047  83 EB 30				sub		ebx,0x00000030
004A  EB DE				jmp		L$5
004C				L$6:
004C  80 F9 2D				cmp		cl,0x2d
004F  75 02				jne		L$7
0051  F7 DB				neg		ebx
0053				L$7:
0053  89 D8				mov		eax,ebx
0055  5B				pop		ebx
0056  C3				ret		

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

