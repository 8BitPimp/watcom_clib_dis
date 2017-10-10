Module: clearerr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000				clearerr:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0008  52				push		edx
0009  FF 15 00 00 00 00			call		dword ptr _AccessFileH
000F  83 C4 04				add		esp,0x00000004
0012  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0015  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0018  80 E4 CF				and		ah,0xcf
001B  51				push		ecx
001C  88 63 0C				mov		byte ptr 0xc[ebx],ah
001F  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0025  83 C4 04				add		esp,0x00000004
0028  5B				pop		ebx
0029  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

