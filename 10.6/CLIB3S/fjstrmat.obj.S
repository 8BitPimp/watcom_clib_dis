Module: fjstrmat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000089 bytes
0000				_fjstrmatch:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  EB 36				jmp		L$3
0008				L$1:
0008  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
000C  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
0010				L$2:
0010  89 E1				mov		ecx,esp
0012  8C D8				mov		eax,ds
0014  25 FF FF 00 00			and		eax,0x0000ffff
0019  50				push		eax
001A  31 C0				xor		eax,eax
001C  51				push		ecx
001D  66 89 D0				mov		ax,dx
0020  50				push		eax
0021  53				push		ebx
0022  9A 00 00 00 00 00 00		call		_fjgetmoji
0029  83 C4 10				add		esp,0x00000010
002C  8B 0C 24				mov		ecx,dword ptr [esp]
002F  89 C3				mov		ebx,eax
0031  66 85 C9				test		cx,cx
0034  75 42				jne		L$5
0036  89 7C 24 20			mov		dword ptr 0x20[esp],edi
003A  89 74 24 1C			mov		dword ptr 0x1c[esp],esi
003E				L$3:
003E  8D 5C 24 04			lea		ebx,0x4[esp]
0042  8C D8				mov		eax,ds
0044  25 FF FF 00 00			and		eax,0x0000ffff
0049  50				push		eax
004A  31 C0				xor		eax,eax
004C  53				push		ebx
004D  66 8B 44 24 28			mov		ax,word ptr 0x28[esp]
0052  50				push		eax
0053  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
0057  52				push		edx
0058  9A 00 00 00 00 00 00		call		_fjgetmoji
005F  83 C4 10				add		esp,0x00000010
0062  89 D7				mov		edi,edx
0064  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0068  89 C6				mov		esi,eax
006A  66 85 D2				test		dx,dx
006D  75 99				jne		L$1
006F  31 C0				xor		eax,eax
0071				L$4:
0071  83 C4 08				add		esp,0x00000008
0074  5F				pop		edi
0075  5E				pop		esi
0076  5B				pop		ebx
0077  CB				retf		
0078				L$5:
0078  66 3B 4C 24 04			cmp		cx,word ptr 0x4[esp]
007D  75 91				jne		L$2
007F  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0083  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
0087  EB E8				jmp		L$4

Routine Size: 137 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

