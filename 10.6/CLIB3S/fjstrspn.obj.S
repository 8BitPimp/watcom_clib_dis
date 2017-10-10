Module: fjstrspn
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000085 bytes
0000				_fjstrspn:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
000A  31 F6				xor		esi,esi
000C  EB 40				jmp		L$4
000E				L$1:
000E  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
0012  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
0016				L$2:
0016  8D 4C 24 04			lea		ecx,0x4[esp]
001A  8C D8				mov		eax,ds
001C  25 FF FF 00 00			and		eax,0x0000ffff
0021  50				push		eax
0022  31 C0				xor		eax,eax
0024  51				push		ecx
0025  66 89 D0				mov		ax,dx
0028  50				push		eax
0029  53				push		ebx
002A  9A 00 00 00 00 00 00		call		_fjgetmoji
0031  83 C4 10				add		esp,0x00000010
0034  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0038  89 C3				mov		ebx,eax
003A  66 85 C9				test		cx,cx
003D  74 06				je		L$3
003F  66 3B 0C 24			cmp		cx,word ptr [esp]
0043  75 D1				jne		L$2
0045				L$3:
0045  66 83 7C 24 04 00			cmp		word ptr 0x4[esp],0x0000
004B  74 2F				je		L$5
004D  46				inc		esi
004E				L$4:
004E  89 E3				mov		ebx,esp
0050  8C D8				mov		eax,ds
0052  25 FF FF 00 00			and		eax,0x0000ffff
0057  50				push		eax
0058  31 C0				xor		eax,eax
005A  53				push		ebx
005B  66 89 F8				mov		ax,di
005E  50				push		eax
005F  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
0063  52				push		edx
0064  9A 00 00 00 00 00 00		call		_fjgetmoji
006B  83 C4 10				add		esp,0x00000010
006E  89 D7				mov		edi,edx
0070  8B 14 24				mov		edx,dword ptr [esp]
0073  89 44 24 1C			mov		dword ptr 0x1c[esp],eax
0077  66 85 D2				test		dx,dx
007A  75 92				jne		L$1
007C				L$5:
007C  89 F0				mov		eax,esi
007E  83 C4 08				add		esp,0x00000008
0081  5F				pop		edi
0082  5E				pop		esi
0083  5B				pop		ebx
0084  CB				retf		

Routine Size: 133 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

