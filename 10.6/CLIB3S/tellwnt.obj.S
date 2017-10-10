Module: tellwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000				tell:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 1D 00 00 00 00			mov		ebx,dword ptr __FileHandleIDs
000B  50				push		eax
000C  8B 1C 83				mov		ebx,dword ptr [ebx+eax*4]
000F  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0015  83 C4 04				add		esp,0x00000004
0018  6A 01				push		0x00000001
001A  6A 00				push		0x00000000
001C  6A 00				push		0x00000000
001E  53				push		ebx
001F  E8 00 00 00 00			call		_SetFilePointer
0024  89 C3				mov		ebx,eax
0026  83 F8 FF				cmp		eax,0xffffffff
0029  75 05				jne		L$1
002B  E8 00 00 00 00			call		__set_errno_nt
0030				L$1:
0030  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0034  51				push		ecx
0035  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003B  83 C4 04				add		esp,0x00000004
003E  89 D8				mov		eax,ebx
0040  5B				pop		ebx
0041  C3				ret		

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

