Module: fjstradv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				_fjstradv:
0000  53				push		ebx
0001  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0005  31 C0				xor		eax,eax
0007  52				push		edx
0008  66 8B 44 24 14			mov		ax,word ptr 0x14[esp]
000D  50				push		eax
000E  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0012  53				push		ebx
0013  9A 00 00 00 00 00 00		call		_fmtob
001A  83 C4 0C				add		esp,0x0000000c
001D  01 D8				add		eax,ebx
001F  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0023  5B				pop		ebx
0024  CB				retf		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

