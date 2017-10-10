Module: usprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000				mem_putc:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0007  8B 10				mov		edx,dword ptr [eax]
0009  8D 5A 02				lea		ebx,0x2[edx]
000C  89 18				mov		dword ptr [eax],ebx
000E  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
0011  66 89 1A				mov		word ptr [edx],bx
0014  FF 40 10				inc		dword ptr 0x10[eax]
0017  5D				pop		ebp
0018  5B				pop		ebx
0019  C3				ret		

Routine Size: 26 bytes,    Routine Base: _TEXT + 0000

001A				_usprintf:
001A  C8 04 00 00			enter		0x0004,0x00
001E  8D 45 10				lea		eax,0x10[ebp]
0021  68 00 00 00 00			push		offset mem_putc
0026  89 45 FC				mov		dword ptr -0x4[ebp],eax
0029  8D 45 FC				lea		eax,-0x4[ebp]
002C  50				push		eax
002D  FF 75 0C				push		dword ptr 0xc[ebp]
0030  FF 75 08				push		dword ptr 0x8[ebp]
0033  E8 00 00 00 00			call		__uprtf
0038  8D 14 00				lea		edx,[eax+eax]
003B  03 55 08				add		edx,dword ptr 0x8[ebp]
003E  83 C4 10				add		esp,0x00000010
0041  66 C7 02 00 00			mov		word ptr [edx],0x0000
0046  C9				leave		
0047  C3				ret		

Routine Size: 46 bytes,    Routine Base: _TEXT + 001A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

