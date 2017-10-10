Module: lfind
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000031 bytes
0000				lfind:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
0007  8B 1B				mov		ebx,dword ptr [ebx]
0009  EB 1D				jmp		L$3
000B				L$1:
000B  FF 75 10				push		dword ptr 0x10[ebp]
000E  FF 75 0C				push		dword ptr 0xc[ebp]
0011  FF 55 1C				call		dword ptr 0x1c[ebp]
0014  83 C4 08				add		esp,0x00000008
0017  85 C0				test		eax,eax
0019  75 06				jne		L$2
001B  8B 45 10				mov		eax,dword ptr 0x10[ebp]
001E  5D				pop		ebp
001F  5B				pop		ebx
0020  C3				ret		
0021				L$2:
0021  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0024  4B				dec		ebx
0025  01 45 10				add		dword ptr 0x10[ebp],eax
0028				L$3:
0028  85 DB				test		ebx,ebx
002A  75 DF				jne		L$1
002C  31 C0				xor		eax,eax
002E  5D				pop		ebp
002F  5B				pop		ebx
0030  C3				ret		

Routine Size: 49 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

