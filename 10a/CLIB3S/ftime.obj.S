Module: ftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000				ftime:
0000  53				push		ebx
0001  83 EC 24				sub		esp,0x00000024
0004  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
0008  89 E0				mov		eax,esp
000A  50				push		eax
000B  E8 00 00 00 00			call		__getctime
0010  83 C4 04				add		esp,0x00000004
0013  66 89 43 04			mov		word ptr 0x4[ebx],ax
0017  89 E0				mov		eax,esp
0019  50				push		eax
001A  E8 00 00 00 00			call		mktime
001F  83 C4 04				add		esp,0x00000004
0022  89 03				mov		dword ptr [ebx],eax
0024  B9 3C 00 00 00			mov		ecx,0x0000003c
0029  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
002D  31 D2				xor		edx,edx
002F  66 89 43 08			mov		word ptr 0x8[ebx],ax
0033  A1 00 00 00 00			mov		eax,dword ptr timezone
0038  F7 F1				div		ecx
003A  66 89 43 06			mov		word ptr 0x6[ebx],ax
003E  31 C0				xor		eax,eax
0040  83 C4 24				add		esp,0x00000024
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

