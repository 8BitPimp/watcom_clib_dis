Module: uaccswnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000002C bytes
0000				_uaccess:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_GetFileAttributesW
000A  83 F8 FF				cmp		eax,0xffffffff
000D  0F 84 00 00 00 00			je		__set_errno_nt
0013  F6 44 24 08 02			test		byte ptr 0x8[esp],0x02
0018  74 0F				je		L$1
001A  A8 01				test		al,0x01
001C  74 0B				je		L$1
001E  6A 05				push		0x00000005
0020  E8 00 00 00 00			call		__set_errno_dos
0025  83 C4 04				add		esp,0x00000004
0028  C3				ret		
0029				L$1:
0029  31 C0				xor		eax,eax
002B  C3				ret		

Routine Size: 44 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

