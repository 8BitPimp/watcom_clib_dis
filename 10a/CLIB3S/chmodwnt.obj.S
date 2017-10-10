Module: chmodwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000037 bytes
0000				chmod:
0000  53				push		ebx
0001  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0005  52				push		edx
0006  E8 00 00 00 00			call		_GetFileAttributesA
000B  83 F8 FF				cmp		eax,0xffffffff
000E  75 07				jne		L$2
0010				L$1:
0010  E8 00 00 00 00			call		__set_errno_nt
0015  5B				pop		ebx
0016  C3				ret		
0017				L$2:
0017  8A 54 24 0C			mov		dl,byte ptr 0xc[esp]
001B  24 FE				and		al,0xfe
001D  F6 C2 80				test		dl,0x80
0020  75 02				jne		L$3
0022  0C 01				or		al,0x01
0024				L$3:
0024  50				push		eax
0025  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0029  53				push		ebx
002A  E8 00 00 00 00			call		_SetFileAttributesA
002F  85 C0				test		eax,eax
0031  74 DD				je		L$1
0033  31 C0				xor		eax,eax
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

