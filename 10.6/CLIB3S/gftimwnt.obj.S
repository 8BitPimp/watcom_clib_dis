Module: gftimwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000070 bytes
0000				_dos_getftime:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 18				sub		esp,0x00000018
0005  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0009  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
000E  89 F2				mov		edx,esi
0010  56				push		esi
0011  8B 1C 90				mov		ebx,dword ptr [eax+edx*4]
0014  FF 15 00 00 00 00			call		dword ptr _AccessFileH
001A  83 C4 04				add		esp,0x00000004
001D  8D 44 24 08			lea		eax,0x8[esp]
0021  50				push		eax
0022  8D 44 24 14			lea		eax,0x14[esp]
0026  50				push		eax
0027  8D 44 24 08			lea		eax,0x8[esp]
002B  50				push		eax
002C  53				push		ebx
002D  E8 00 00 00 00			call		_GetFileTime
0032  85 C0				test		eax,eax
0034  75 11				jne		L$1
0036  56				push		esi
0037  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003D  83 C4 04				add		esp,0x00000004
0040  E8 00 00 00 00			call		__set_errno_nt
0045  EB 23				jmp		L$2
0047				L$1:
0047  56				push		esi
0048  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
004E  83 C4 04				add		esp,0x00000004
0051  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
0055  52				push		edx
0056  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
005A  53				push		ebx
005B  8D 44 24 10			lea		eax,0x10[esp]
005F  50				push		eax
0060  E8 00 00 00 00			call		__MakeDOSDT
0065  83 C4 0C				add		esp,0x0000000c
0068  31 C0				xor		eax,eax
006A				L$2:
006A  83 C4 18				add		esp,0x00000018
006D  5E				pop		esi
006E  5B				pop		ebx
006F  C3				ret		

Routine Size: 112 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

