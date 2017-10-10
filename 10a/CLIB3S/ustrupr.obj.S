Module: ustrupr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002B bytes
0000				_ustrupr:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006				L$1:
0006  66 8B 10				mov		dx,word ptr [eax]
0009  66 85 D2				test		dx,dx
000C  74 18				je		L$3
000E  F6 C6 FF				test		dh,0xff
0011  75 0F				jne		L$2
0013  83 EA 61				sub		edx,0x00000061
0016  66 83 FA 19			cmp		dx,0x0019
001A  77 06				ja		L$2
001C  83 C2 41				add		edx,0x00000041
001F  66 89 10				mov		word ptr [eax],dx
0022				L$2:
0022  40				inc		eax
0023  40				inc		eax
0024  EB E0				jmp		L$1
0026				L$3:
0026  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0029  5D				pop		ebp
002A  C3				ret		

Routine Size: 43 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

