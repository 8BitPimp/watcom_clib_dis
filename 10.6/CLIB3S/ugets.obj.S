Module: ugets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				_ugets:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  8B 75 14				mov		esi,dword ptr 0x14[ebp]
0009  8B 3D 0C 00 00 00			mov		edi,dword ptr __iob+0xc
000F  89 F3				mov		ebx,esi
0011  80 25 0C 00 00 00 CF		and		byte ptr __iob+0xc,0xcf
0018  83 E7 30				and		edi,0x00000030
001B				L$1:
001B  68 00 00 00 00			push		offset __iob
0020  E8 00 00 00 00			call		_ugetc
0025  83 C4 04				add		esp,0x00000004
0028  89 C2				mov		edx,eax
002A  83 F8 FF				cmp		eax,0xffffffff
002D  74 0C				je		L$2
002F  83 F8 0A				cmp		eax,0x0000000a
0032  74 07				je		L$2
0034  66 89 03				mov		word ptr [ebx],ax
0037  43				inc		ebx
0038  43				inc		ebx
0039  EB E0				jmp		L$1
003B				L$2:
003B  83 FA FF				cmp		edx,0xffffffff
003E  75 11				jne		L$4
0040  39 F3				cmp		ebx,esi
0042  74 09				je		L$3
0044  F6 05 0C 00 00 00 20		test		byte ptr __iob+0xc,0x20
004B  74 04				je		L$4
004D				L$3:
004D  31 F6				xor		esi,esi
004F  EB 05				jmp		L$5
0051				L$4:
0051  66 C7 03 00 00			mov		word ptr [ebx],0x0000
0056				L$5:
0056  89 F0				mov		eax,esi
0058  09 3D 0C 00 00 00			or		dword ptr __iob+0xc,edi
005E  5D				pop		ebp
005F  5F				pop		edi
0060  5E				pop		esi
0061  5B				pop		ebx
0062  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

