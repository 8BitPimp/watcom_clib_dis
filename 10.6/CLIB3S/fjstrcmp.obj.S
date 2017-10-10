Module: fjstrcmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000084 bytes
0000				_fjstrcmp:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
000A  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
000E  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0012				L$1:
0012  89 E2				mov		edx,esp
0014  8C D8				mov		eax,ds
0016  25 FF FF 00 00			and		eax,0x0000ffff
001B  50				push		eax
001C  31 C0				xor		eax,eax
001E  52				push		edx
001F  66 8B 44 24 28			mov		ax,word ptr 0x28[esp]
0024  50				push		eax
0025  57				push		edi
0026  9A 00 00 00 00 00 00		call		_fjgetmoji
002D  83 C4 10				add		esp,0x00000010
0030  89 C7				mov		edi,eax
0032  89 54 24 20			mov		dword ptr 0x20[esp],edx
0036  8C D8				mov		eax,ds
0038  8D 54 24 04			lea		edx,0x4[esp]
003C  25 FF FF 00 00			and		eax,0x0000ffff
0041  50				push		eax
0042  31 C0				xor		eax,eax
0044  52				push		edx
0045  66 89 D8				mov		ax,bx
0048  50				push		eax
0049  56				push		esi
004A  9A 00 00 00 00 00 00		call		_fjgetmoji
0051  83 C4 10				add		esp,0x00000010
0054  89 D3				mov		ebx,edx
0056  89 C6				mov		esi,eax
0058  8B 04 24				mov		eax,dword ptr [esp]
005B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
005F  66 39 D0				cmp		ax,dx
0062  74 10				je		L$3
0064  73 07				jae		L$2
0066  B8 FF FF FF FF			mov		eax,0xffffffff
006B  EB 10				jmp		L$4
006D				L$2:
006D  B8 01 00 00 00			mov		eax,0x00000001
0072  EB 09				jmp		L$4
0074				L$3:
0074  66 83 3C 24 00			cmp		word ptr [esp],0x0000
0079  75 97				jne		L$1
007B  31 C0				xor		eax,eax
007D				L$4:
007D  83 C4 08				add		esp,0x00000008
0080  5F				pop		edi
0081  5E				pop		esi
0082  5B				pop		ebx
0083  CB				retf		

Routine Size: 132 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

