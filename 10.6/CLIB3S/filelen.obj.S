Module: filelen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000060 bytes
0000				filelength:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0007  56				push		esi
0008  FF 15 00 00 00 00			call		dword ptr _AccessFileH
000E  83 C4 04				add		esp,0x00000004
0011  6A 01				push		0x00000001
0013  6A 00				push		0x00000000
0015  56				push		esi
0016  E8 00 00 00 00			call		lseek
001B  89 C3				mov		ebx,eax
001D  83 C4 0C				add		esp,0x0000000c
0020  83 F8 FF				cmp		eax,0xffffffff
0023  75 10				jne		L$1
0025  56				push		esi
0026  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
002C  83 C4 04				add		esp,0x00000004
002F  89 D8				mov		eax,ebx
0031  5F				pop		edi
0032  5E				pop		esi
0033  5B				pop		ebx
0034  C3				ret		
0035				L$1:
0035  6A 02				push		0x00000002
0037  6A 00				push		0x00000000
0039  56				push		esi
003A  E8 00 00 00 00			call		lseek
003F  83 C4 0C				add		esp,0x0000000c
0042  56				push		esi
0043  89 C7				mov		edi,eax
0045  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
004B  83 C4 04				add		esp,0x00000004
004E  6A 00				push		0x00000000
0050  53				push		ebx
0051  56				push		esi
0052  E8 00 00 00 00			call		lseek
0057  83 C4 0C				add		esp,0x0000000c
005A  89 F8				mov		eax,edi
005C  5F				pop		edi
005D  5E				pop		esi
005E  5B				pop		ebx
005F  C3				ret		

Routine Size: 96 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

