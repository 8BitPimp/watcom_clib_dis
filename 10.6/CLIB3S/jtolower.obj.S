Module: jtolower
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001C bytes
0000				jtolower:
0000  53				push		ebx
0001  31 DB				xor		ebx,ebx
0003  66 8B 5C 24 08			mov		bx,word ptr 0x8[esp]
0008  53				push		ebx
0009  E8 00 00 00 00			call		jisupper
000E  83 C4 04				add		esp,0x00000004
0011  85 C0				test		eax,eax
0013  74 03				je		L$1
0015  83 C3 21				add		ebx,0x00000021
0018				L$1:
0018  89 D8				mov		eax,ebx
001A  5B				pop		ebx
001B  C3				ret		

Routine Size: 28 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

