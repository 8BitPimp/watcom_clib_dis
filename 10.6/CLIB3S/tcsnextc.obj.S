Module: tcsnextc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000				_tcsnextc:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 1D 00 00 00 00			mov		ebx,dword ptr __IsDBCS
000B  31 D2				xor		edx,edx
000D  85 DB				test		ebx,ebx
000F  74 13				je		L$1
0011  31 DB				xor		ebx,ebx
0013  8A 18				mov		bl,byte ptr [eax]
0015  8A 9B 01 00 00 00			mov		bl,byte ptr __MBCSIsTable+0x1[ebx]
001B  80 E3 01				and		bl,0x01
001E  81 E3 FF 00 00 00			and		ebx,0x000000ff
0024				L$1:
0024  85 DB				test		ebx,ebx
0026  74 08				je		L$2
0028  31 D2				xor		edx,edx
002A  8A 10				mov		dl,byte ptr [eax]
002C  C1 E2 08				shl		edx,0x08
002F  40				inc		eax
0030				L$2:
0030  8A 00				mov		al,byte ptr [eax]
0032  25 FF 00 00 00			and		eax,0x000000ff
0037  01 D0				add		eax,edx
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

