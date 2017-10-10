Module: cprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000050 bytes
0000				con_putc_:
0000  53				push		ebx
0001  89 C3				mov		ebx,eax
0003  31 C0				xor		eax,eax
0005  88 D0				mov		al,dl
0007  E8 00 00 00 00			call		putch_
000C  FF 43 10				inc		dword ptr 0x10[ebx]
000F  5B				pop		ebx
0010  C3				ret		

Routine Size: 17 bytes,    Routine Base: _TEXT + 0000

0011				vcprintf_:
0011  53				push		ebx
0012  51				push		ecx
0013  89 C3				mov		ebx,eax
0015  89 D1				mov		ecx,edx
0017  89 DA				mov		edx,ebx
0019  31 C0				xor		eax,eax
001B  89 CB				mov		ebx,ecx
001D  B9 00 00 00 00			mov		ecx,offset con_putc_
0022  E8 00 00 00 00			call		__prtf_
0027  59				pop		ecx
0028  5B				pop		ebx
0029  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0011

002A				cprintf_:
002A  53				push		ebx
002B  51				push		ecx
002C  52				push		edx
002D  83 EC 04				sub		esp,0x00000004
0030  8D 5C 24 18			lea		ebx,0x18[esp]
0034  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0038  B9 00 00 00 00			mov		ecx,offset con_putc_
003D  31 C0				xor		eax,eax
003F  89 1C 24				mov		dword ptr [esp],ebx
0042  89 E3				mov		ebx,esp
0044  E8 00 00 00 00			call		__prtf_
0049  83 C4 04				add		esp,0x00000004
004C  5A				pop		edx
004D  59				pop		ecx
004E  5B				pop		ebx
004F  C3				ret		

Routine Size: 38 bytes,    Routine Base: _TEXT + 002A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

