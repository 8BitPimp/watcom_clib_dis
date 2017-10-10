Module: fbtom
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004E bytes
0000				_fbtom:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000A  8B 4C 24 18			mov		ecx,dword ptr 0x18[esp]
000E  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
0012  31 DB				xor		ebx,ebx
0014  01 CF				add		edi,ecx
0016				L$1:
0016  89 E2				mov		edx,esp
0018  8C D8				mov		eax,ds
001A  25 FF FF 00 00			and		eax,0x0000ffff
001F  50				push		eax
0020  31 C0				xor		eax,eax
0022  52				push		edx
0023  66 89 F0				mov		ax,si
0026  50				push		eax
0027  51				push		ecx
0028  9A 00 00 00 00 00 00		call		_fjgetmoji
002F  83 C4 10				add		esp,0x00000010
0032  89 D6				mov		esi,edx
0034  8B 14 24				mov		edx,dword ptr [esp]
0037  89 C1				mov		ecx,eax
0039  66 85 D2				test		dx,dx
003C  74 07				je		L$2
003E  39 F8				cmp		eax,edi
0040  77 03				ja		L$2
0042  43				inc		ebx
0043  EB D1				jmp		L$1
0045				L$2:
0045  89 D8				mov		eax,ebx
0047  83 C4 04				add		esp,0x00000004
004A  5F				pop		edi
004B  5E				pop		esi
004C  5B				pop		ebx
004D  CB				retf		

Routine Size: 78 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

