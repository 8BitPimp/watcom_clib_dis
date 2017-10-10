Module: sfattwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000023 bytes
0000				_dos_setfileattr:
0000  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0004  85 C0				test		eax,eax
0006  75 05				jne		L$1
0008  B8 80 00 00 00			mov		eax,0x00000080
000D				L$1:
000D  50				push		eax
000E  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0012  52				push		edx
0013  E8 00 00 00 00			call		_SetFileAttributesA
0018  85 C0				test		eax,eax
001A  0F 84 00 00 00 00			je		__set_errno_nt
0020  31 C0				xor		eax,eax
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

