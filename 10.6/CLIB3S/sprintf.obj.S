Module: sprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				mem_putc:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 10				mov		edx,dword ptr [eax]
0007  8D 5A 01				lea		ebx,0x1[edx]
000A  89 18				mov		dword ptr [eax],ebx
000C  8A 5C 24 0C			mov		bl,byte ptr 0xc[esp]
0010  88 1A				mov		byte ptr [edx],bl
0012  FF 40 10				inc		dword ptr 0x10[eax]
0015  5B				pop		ebx
0016  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 0000

0017				sprintf:
0017  53				push		ebx
0018  83 EC 04				sub		esp,0x00000004
001B  8D 44 24 14			lea		eax,0x14[esp]
001F  68 00 00 00 00			push		offset mem_putc
0024  89 44 24 04			mov		dword ptr 0x4[esp],eax
0028  8D 44 24 04			lea		eax,0x4[esp]
002C  50				push		eax
002D  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0031  52				push		edx
0032  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0036  53				push		ebx
0037  E8 00 00 00 00			call		__prtf
003C  89 DA				mov		edx,ebx
003E  83 C4 10				add		esp,0x00000010
0041  C6 04 02 00			mov		byte ptr [edx+eax],0x00
0045  83 C4 04				add		esp,0x00000004
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0017

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

