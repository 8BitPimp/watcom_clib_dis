Module: jstrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004E bytes
0000				jstrlwr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
000A  89 F7				mov		edi,esi
000C  89 F3				mov		ebx,esi
000E  EB 1F				jmp		L$2
0010				L$1:
0010  31 C0				xor		eax,eax
0012  66 89 D0				mov		ax,dx
0015  50				push		eax
0016  E8 00 00 00 00			call		jtolower
001B  83 C4 04				add		esp,0x00000004
001E  25 FF FF 00 00			and		eax,0x0000ffff
0023  50				push		eax
0024  53				push		ebx
0025  E8 00 00 00 00			call		jputmoji
002A  83 C4 08				add		esp,0x00000008
002D  89 C3				mov		ebx,eax
002F				L$2:
002F  89 E0				mov		eax,esp
0031  50				push		eax
0032  56				push		esi
0033  E8 00 00 00 00			call		jgetmoji
0038  83 C4 08				add		esp,0x00000008
003B  8B 14 24				mov		edx,dword ptr [esp]
003E  89 C6				mov		esi,eax
0040  66 85 D2				test		dx,dx
0043  75 CB				jne		L$1
0045  89 F8				mov		eax,edi
0047  83 C4 04				add		esp,0x00000004
004A  5F				pop		edi
004B  5E				pop		esi
004C  5B				pop		ebx
004D  C3				ret		

Routine Size: 78 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

