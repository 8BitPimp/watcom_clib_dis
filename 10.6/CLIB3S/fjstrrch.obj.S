Module: fjstrrch
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000005A bytes
0000				_fjstrrchr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 08				sub		esp,0x00000008
0006  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
000A  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000E  31 D2				xor		edx,edx
0010  31 FF				xor		edi,edi
0012  89 14 24				mov		dword ptr [esp],edx
0015				L$1:
0015  8D 54 24 04			lea		edx,0x4[esp]
0019  8C D8				mov		eax,ds
001B  25 FF FF 00 00			and		eax,0x0000ffff
0020  50				push		eax
0021  31 C0				xor		eax,eax
0023  52				push		edx
0024  66 89 D8				mov		ax,bx
0027  50				push		eax
0028  56				push		esi
0029  9A 00 00 00 00 00 00		call		_fjgetmoji
0030  83 C4 10				add		esp,0x00000010
0033  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
0037  66 85 C9				test		cx,cx
003A  74 12				je		L$3
003C  66 3B 4C 24 24			cmp		cx,word ptr 0x24[esp]
0041  75 05				jne		L$2
0043  89 1C 24				mov		dword ptr [esp],ebx
0046  89 F7				mov		edi,esi
0048				L$2:
0048  89 D3				mov		ebx,edx
004A  89 C6				mov		esi,eax
004C  EB C7				jmp		L$1
004E				L$3:
004E  8B 14 24				mov		edx,dword ptr [esp]
0051  89 F8				mov		eax,edi
0053  83 C4 08				add		esp,0x00000008
0056  5F				pop		edi
0057  5E				pop		esi
0058  5B				pop		ebx
0059  CB				retf		

Routine Size: 90 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

