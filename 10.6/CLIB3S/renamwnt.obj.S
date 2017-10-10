Module: renamwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				rename:
0000  53				push		ebx
0001  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0005  52				push		edx
0006  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
000A  53				push		ebx
000B  E8 00 00 00 00			call		_MoveFileA
0010  85 C0				test		eax,eax
0012  75 07				jne		L$1
0014  E8 00 00 00 00			call		__set_errno_nt
0019  5B				pop		ebx
001A  C3				ret		
001B				L$1:
001B  31 C0				xor		eax,eax
001D  5B				pop		ebx
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

