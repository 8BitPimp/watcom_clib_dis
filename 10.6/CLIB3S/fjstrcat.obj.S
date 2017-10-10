Module: fjstrcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000BD bytes
0000				_fjstrncat:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  06				push		es
0004  83 EC 04				sub		esp,0x00000004
0007  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
000B  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
000F  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0013				L$1:
0013  89 E2				mov		edx,esp
0015  8C D8				mov		eax,ds
0017  25 FF FF 00 00			and		eax,0x0000ffff
001C  50				push		eax
001D  31 C0				xor		eax,eax
001F  52				push		edx
0020  66 89 F8				mov		ax,di
0023  50				push		eax
0024  53				push		ebx
0025  9A 00 00 00 00 00 00		call		_fjgetmoji
002C  83 C4 10				add		esp,0x00000010
002F  89 D7				mov		edi,edx
0031  8B 14 24				mov		edx,dword ptr [esp]
0034  89 C3				mov		ebx,eax
0036  66 85 D2				test		dx,dx
0039  75 D8				jne		L$1
003B  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
003F  31 C0				xor		eax,eax
0041  52				push		edx
0042  66 8B 44 24 2C			mov		ax,word ptr 0x2c[esp]
0047  50				push		eax
0048  56				push		esi
0049  9A 00 00 00 00 00 00		call		_fmtob
0050  83 C4 0C				add		esp,0x0000000c
0053				L$2:
0053  48				dec		eax
0054  83 F8 FF				cmp		eax,0xffffffff
0057  74 10				je		L$3
0059  8E 44 24 28			mov		es,dword ptr 0x28[esp]
005D  26 8A 16				mov		dl,byte ptr es:[esi]
0060  8E C7				mov		es,edi
0062  46				inc		esi
0063  26 88 13				mov		byte ptr es:[ebx],dl
0066  43				inc		ebx
0067  EB EA				jmp		L$2
0069				L$3:
0069  8E C7				mov		es,edi
006B  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
006F  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
0073  26 C6 03 00			mov		byte ptr es:[ebx],0x00
0077  83 C4 04				add		esp,0x00000004
007A  07				pop		es
007B  5F				pop		edi
007C  5E				pop		esi
007D  5B				pop		ebx
007E  CB				retf		

Routine Size: 127 bytes,    Routine Base: _TEXT + 0000

007F				_fjstrcat:
007F  53				push		ebx
0080  31 C0				xor		eax,eax
0082  66 8B 44 24 18			mov		ax,word ptr 0x18[esp]
0087  50				push		eax
0088  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
008C  52				push		edx
008D  9A 00 00 00 00 00 00		call		_fjstrlen
0094  83 C4 08				add		esp,0x00000008
0097  50				push		eax
0098  31 C0				xor		eax,eax
009A  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
009F  50				push		eax
00A0  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
00A4  31 C0				xor		eax,eax
00A6  53				push		ebx
00A7  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
00AC  50				push		eax
00AD  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
00B1  51				push		ecx
00B2  0E				push		cs
00B3  E8 00 00 00 00			call		_fjstrncat
00B8  83 C4 14				add		esp,0x00000014
00BB  5B				pop		ebx
00BC  CB				retf		

Routine Size: 62 bytes,    Routine Base: _TEXT + 007F

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

