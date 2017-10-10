Module: cmain386
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000059 bytes
0000				__CMain:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 1D 00 00 00 00			mov		ebx,dword ptr __ASTACKSIZ
000A  83 C3 03				add		ebx,0x00000003
000D  80 E3 FC				and		bl,0xfc
0010  E8 00 00 00 00			call		stackavail
0015  39 C3				cmp		ebx,eax
0017  73 08				jae		L$1
0019  89 D8				mov		eax,ebx
001B  29 C4				sub		esp,eax
001D  89 E0				mov		eax,esp
001F  EB 02				jmp		L$2
0021				L$1:
0021  31 C0				xor		eax,eax
0023				L$2:
0023  8B 1D 00 00 00 00			mov		ebx,dword ptr __ASTACKSIZ
0029  01 D8				add		eax,ebx
002B  A3 00 00 00 00			mov		dword ptr __ASTACKPTR,eax
0030  E8 00 00 00 00			call		__CommonInit
0035  8B 15 00 00 00 00			mov		edx,dword ptr ___Argv
003B  52				push		edx
003C  8B 1D 00 00 00 00			mov		ebx,dword ptr ___Argc
0042  53				push		ebx
0043  E8 00 00 00 00			call		main
0048  83 C4 08				add		esp,0x00000008
004B  50				push		eax
004C  E8 00 00 00 00			call		exit
0051  83 C4 04				add		esp,0x00000004
0054  89 EC				mov		esp,ebp
0056  5D				pop		ebp
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

