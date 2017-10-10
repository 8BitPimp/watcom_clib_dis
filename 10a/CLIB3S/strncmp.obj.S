Module: strncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000				strncmp:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0009  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000D				L$1:
000D  85 DB				test		ebx,ebx
000F  75 04				jne		L$3
0011				L$2:
0011  31 C0				xor		eax,eax
0013  5B				pop		ebx
0014  C3				ret		
0015				L$3:
0015  8A 08				mov		cl,byte ptr [eax]
0017  8A 2A				mov		ch,byte ptr [edx]
0019  38 E9				cmp		cl,ch
001B  74 0E				je		L$4
001D  31 DB				xor		ebx,ebx
001F  31 C0				xor		eax,eax
0021  88 CB				mov		bl,cl
0023  88 E8				mov		al,ch
0025  29 C3				sub		ebx,eax
0027  89 D8				mov		eax,ebx
0029  5B				pop		ebx
002A  C3				ret		
002B				L$4:
002B  80 38 00				cmp		byte ptr [eax],0x00
002E  74 E1				je		L$2
0030  40				inc		eax
0031  42				inc		edx
0032  4B				dec		ebx
0033  EB D8				jmp		L$1

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

