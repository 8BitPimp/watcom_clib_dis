Module: cprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005F bytes
0000				con_putc:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0009  52				push		edx
000A  E8 00 00 00 00			call		putch
000F  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0012  41				inc		ecx
0013  83 C4 04				add		esp,0x00000004
0016  89 4B 10				mov		dword ptr 0x10[ebx],ecx
0019  5B				pop		ebx
001A  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 0000

001B				vcprintf:
001B  53				push		ebx
001C  68 00 00 00 00			push		offset con_putc
0021  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0025  52				push		edx
0026  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
002A  53				push		ebx
002B  6A 00				push		0x00000000
002D  E8 00 00 00 00			call		__prtf
0032  83 C4 10				add		esp,0x00000010
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 001B

0037				cprintf:
0037  83 EC 04				sub		esp,0x00000004
003A  8D 44 24 0C			lea		eax,0xc[esp]
003E  68 00 00 00 00			push		offset con_putc
0043  89 44 24 04			mov		dword ptr 0x4[esp],eax
0047  8D 44 24 04			lea		eax,0x4[esp]
004B  50				push		eax
004C  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0050  52				push		edx
0051  6A 00				push		0x00000000
0053  E8 00 00 00 00			call		__prtf
0058  83 C4 10				add		esp,0x00000010
005B  83 C4 04				add		esp,0x00000004
005E  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0037

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

