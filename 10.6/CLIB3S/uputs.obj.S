Module: uputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000				_uputs:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  68 1A 00 00 00			push		offset __iob+0x1a
0009  FF 75 0C				push		dword ptr 0xc[ebp]
000C  E8 00 00 00 00			call		_ufputs
0011  89 C3				mov		ebx,eax
0013  83 C4 08				add		esp,0x00000008
0016  83 F8 FF				cmp		eax,0xffffffff
0019  74 17				je		L$1
001B  68 1A 00 00 00			push		offset __iob+0x1a
0020  6A 0A				push		0x0000000a
0022  E8 00 00 00 00			call		_ufputc
0027  83 C4 08				add		esp,0x00000008
002A  83 F8 0A				cmp		eax,0x0000000a
002D  75 03				jne		L$1
002F  8D 43 01				lea		eax,0x1[ebx]
0032				L$1:
0032  5D				pop		ebp
0033  5B				pop		ebx
0034  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

