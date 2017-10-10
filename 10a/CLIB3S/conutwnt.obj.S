Module: conutwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AC bytes
0000				__NTRealKey:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  66 83 38 01			cmp		word ptr [eax],0x0001
0008  75 1C				jne		L$2
000A  83 78 04 00			cmp		dword ptr 0x4[eax],0x00000000
000E  74 16				je		L$2
0010  66 8B 40 0A			mov		ax,word ptr 0xa[eax]
0014  66 3D 10 00			cmp		ax,0x0010
0018  72 06				jb		L$1
001A  66 3D 12 00			cmp		ax,0x0012
001E  76 06				jbe		L$2
0020				L$1:
0020  B8 01 00 00 00			mov		eax,0x00000001
0025  C3				ret		
0026				L$2:
0026  31 C0				xor		eax,eax
0028  C3				ret		
0029				initConsoleHandles:
0029  53				push		ebx
002A  6A 00				push		0x00000000
002C  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0032  8B 15 00 00 00 00			mov		edx,dword ptr consoles_opened
0038  83 C4 04				add		esp,0x00000004
003B  85 D2				test		edx,edx
003D  75 4A				jne		L$3
003F  52				push		edx
0040  68 80 00 00 00			push		0x00000080
0045  6A 03				push		0x00000003
0047  52				push		edx
0048  BB 01 00 00 00			mov		ebx,0x00000001
004D  53				push		ebx
004E  68 00 00 00 80			push		0x80000000
0053  68 00 00 00 00			push		offset DGROUP:L$4
0058  89 1D 00 00 00 00			mov		dword ptr consoles_opened,ebx
005E  E8 00 00 00 00			call		_CreateFileA
0063  6A 00				push		0x00000000
0065  68 80 00 00 00			push		0x00000080
006A  6A 03				push		0x00000003
006C  6A 00				push		0x00000000
006E  6A 02				push		0x00000002
0070  68 00 00 00 40			push		0x40000000
0075  68 07 00 00 00			push		offset DGROUP:L$5
007A  A3 00 00 00 00			mov		dword ptr console_in,eax
007F  E8 00 00 00 00			call		_CreateFileA
0084  A3 00 00 00 00			mov		dword ptr console_out,eax
0089				L$3:
0089  6A 00				push		0x00000000
008B  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0091  83 C4 04				add		esp,0x00000004
0094  5B				pop		ebx
0095  C3				ret		

Routine Size: 150 bytes,    Routine Base: _TEXT + 0000

0096				__NTConsoleInput:
0096  E8 00 00 00 00			call		initConsoleHandles
009B  A1 00 00 00 00			mov		eax,dword ptr console_in
00A0  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 0096

00A1				__NTConsoleOutput:
00A1  E8 00 00 00 00			call		initConsoleHandles
00A6  A1 00 00 00 00			mov		eax,dword ptr console_out
00AB  C3				ret		

Routine Size: 11 bytes,    Routine Base: _TEXT + 00A1

No disassembly errors

Segment: CONST DWORD USE32 0000000F bytes
0000				L$4:
0000  63 6F 6E 69 6E 24 00                            conin$.
0007				L$5:
0007  63 6F 6E 6F 75 74 24 00                         conout$.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 0000000C bytes
0000				console_out:
0004				console_in:
0008				consoles_opened:

BSS Size: 12 bytes

