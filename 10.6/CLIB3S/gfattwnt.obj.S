Module: gfattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000041 bytes
0000				_dos_getfileattr:
0000  53				push		ebx
0001  81 EC 40 01 00 00			sub		esp,0x00000140
0007  89 E0				mov		eax,esp
0009  50				push		eax
000A  8B 94 24 4C 01 00 00		mov		edx,dword ptr 0x14c[esp]
0011  52				push		edx
0012  E8 00 00 00 00			call		_FindFirstFileA
0017  89 C2				mov		edx,eax
0019  83 F8 FF				cmp		eax,0xffffffff
001C  75 07				jne		L$1
001E  E8 00 00 00 00			call		__set_errno_nt
0023  EB 14				jmp		L$2
0025				L$1:
0025  8B 9C 24 4C 01 00 00		mov		ebx,dword ptr 0x14c[esp]
002C  8B 04 24				mov		eax,dword ptr [esp]
002F  52				push		edx
0030  89 03				mov		dword ptr [ebx],eax
0032  E8 00 00 00 00			call		_FindClose
0037  31 C0				xor		eax,eax
0039				L$2:
0039  81 C4 40 01 00 00			add		esp,0x00000140
003F  5B				pop		ebx
0040  C3				ret		

Routine Size: 65 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

