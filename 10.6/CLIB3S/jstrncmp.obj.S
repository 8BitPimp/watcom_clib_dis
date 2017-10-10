Module: jstrncmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				jstrncmp:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
000A  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000E  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0012				L$1:
0012  4B				dec		ebx
0013  83 FB FF				cmp		ebx,0xffffffff
0016  74 42				je		L$4
0018  8D 44 24 04			lea		eax,0x4[esp]
001C  50				push		eax
001D  57				push		edi
001E  E8 00 00 00 00			call		jgetmoji
0023  83 C4 08				add		esp,0x00000008
0026  89 C7				mov		edi,eax
0028  89 E0				mov		eax,esp
002A  50				push		eax
002B  56				push		esi
002C  E8 00 00 00 00			call		jgetmoji
0031  83 C4 08				add		esp,0x00000008
0034  89 C6				mov		esi,eax
0036  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
003A  8B 14 24				mov		edx,dword ptr [esp]
003D  66 39 D0				cmp		ax,dx
0040  74 10				je		L$3
0042  73 07				jae		L$2
0044  B8 FF FF FF FF			mov		eax,0xffffffff
0049  EB 11				jmp		L$5
004B				L$2:
004B  B8 01 00 00 00			mov		eax,0x00000001
0050  EB 0A				jmp		L$5
0052				L$3:
0052  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
0058  75 B8				jne		L$1
005A				L$4:
005A  31 C0				xor		eax,eax
005C				L$5:
005C  83 C4 08				add		esp,0x00000008
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

