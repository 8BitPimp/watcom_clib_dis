Module: uperror
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				_uperror:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006  85 C0				test		eax,eax
0008  74 26				je		L$1
000A  66 83 38 00			cmp		word ptr [eax],0x0000
000E  74 20				je		L$1
0010  68 34 00 00 00			push		offset __iob+0x34
0015  50				push		eax
0016  E8 00 00 00 00			call		_ufputs
001B  83 C4 08				add		esp,0x00000008
001E  68 34 00 00 00			push		offset __iob+0x34
0023  68 00 00 00 00			push		offset DGROUP:L$2
0028  E8 00 00 00 00			call		_ufputs
002D  83 C4 08				add		esp,0x00000008
0030				L$1:
0030  68 34 00 00 00			push		offset __iob+0x34
0035  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
003B  FF 70 04				push		dword ptr 0x4[eax]
003E  E8 00 00 00 00			call		_ustrerror
0043  83 C4 04				add		esp,0x00000004
0046  50				push		eax
0047  E8 00 00 00 00			call		_ufputs
004C  83 C4 08				add		esp,0x00000008
004F  68 34 00 00 00			push		offset __iob+0x34
0054  6A 0A				push		0x0000000a
0056  E8 00 00 00 00			call		_ufputc
005B  83 C4 08				add		esp,0x00000008
005E  5D				pop		ebp
005F  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000006 bytes
0000				L$2:
0000  3A 00 20 00 00 00                               :. ...

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

