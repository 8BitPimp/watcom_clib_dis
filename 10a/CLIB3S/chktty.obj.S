Module: chktty
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				__chktty:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  F6 43 0D 20			test		byte ptr 0xd[ebx],0x20
0009  75 26				jne		L$1
000B  8B 53 10				mov		edx,dword ptr 0x10[ebx]
000E  52				push		edx
000F  E8 00 00 00 00			call		isatty
0014  83 C4 04				add		esp,0x00000004
0017  85 C0				test		eax,eax
0019  74 16				je		L$1
001B  8A 53 0D				mov		dl,byte ptr 0xd[ebx]
001E  80 CA 20				or		dl,0x20
0021  88 53 0D				mov		byte ptr 0xd[ebx],dl
0024  F6 C2 07				test		dl,0x07
0027  75 08				jne		L$1
0029  88 D1				mov		cl,dl
002B  80 C9 02				or		cl,0x02
002E  88 4B 0D				mov		byte ptr 0xd[ebx],cl
0031				L$1:
0031  5B				pop		ebx
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

