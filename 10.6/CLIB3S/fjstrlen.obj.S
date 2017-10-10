Module: fjstrlen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000042 bytes
0000				_fjstrlen:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 04				sub		esp,0x00000004
0005  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
0009  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
000D  31 DB				xor		ebx,ebx
000F				L$1:
000F  89 E2				mov		edx,esp
0011  8C D8				mov		eax,ds
0013  25 FF FF 00 00			and		eax,0x0000ffff
0018  50				push		eax
0019  31 C0				xor		eax,eax
001B  52				push		edx
001C  66 89 F0				mov		ax,si
001F  50				push		eax
0020  51				push		ecx
0021  9A 00 00 00 00 00 00		call		_fjgetmoji
0028  83 C4 10				add		esp,0x00000010
002B  89 D6				mov		esi,edx
002D  8B 14 24				mov		edx,dword ptr [esp]
0030  89 C1				mov		ecx,eax
0032  66 85 D2				test		dx,dx
0035  74 03				je		L$2
0037  43				inc		ebx
0038  EB D5				jmp		L$1
003A				L$2:
003A  89 D8				mov		eax,ebx
003C  83 C4 04				add		esp,0x00000004
003F  5E				pop		esi
0040  5B				pop		ebx
0041  CB				retf		

Routine Size: 66 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

