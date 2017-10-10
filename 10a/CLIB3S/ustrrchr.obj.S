Module: ustrrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				_ustrrchr:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0007  31 D2				xor		edx,edx
0009				L$1:
0009  66 8B 03				mov		ax,word ptr [ebx]
000C  66 3B 45 10			cmp		ax,word ptr 0x10[ebp]
0010  75 02				jne		L$2
0012  89 DA				mov		edx,ebx
0014				L$2:
0014  89 D8				mov		eax,ebx
0016  43				inc		ebx
0017  43				inc		ebx
0018  66 83 38 00			cmp		word ptr [eax],0x0000
001C  75 EB				jne		L$1
001E  89 D0				mov		eax,edx
0020  5D				pop		ebp
0021  5B				pop		ebx
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

