Module: jstrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002A bytes
0000				jstrlen:
0000  53				push		ebx
0001  83 EC 04				sub		esp,0x00000004
0004  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0008  31 DB				xor		ebx,ebx
000A				L$1:
000A  89 E0				mov		eax,esp
000C  50				push		eax
000D  52				push		edx
000E  E8 00 00 00 00			call		jgetmoji
0013  83 C4 08				add		esp,0x00000008
0016  8B 0C 24				mov		ecx,dword ptr [esp]
0019  89 C2				mov		edx,eax
001B  66 85 C9				test		cx,cx
001E  74 03				je		L$2
0020  43				inc		ebx
0021  EB E7				jmp		L$1
0023				L$2:
0023  89 D8				mov		eax,ebx
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

