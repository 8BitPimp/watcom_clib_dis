Module: fjstrlwr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007F bytes
0000				_fjstrlwr:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
000B  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
000F  89 7C 24 08			mov		dword ptr 0x8[esp],edi
0013  89 2C 24				mov		dword ptr [esp],ebp
0016  89 FB				mov		ebx,edi
0018  89 EE				mov		esi,ebp
001A  EB 29				jmp		L$2
001C				L$1:
001C  31 C0				xor		eax,eax
001E  66 89 D0				mov		ax,dx
0021  50				push		eax
0022  E8 00 00 00 00			call		jtolower
0027  83 C4 04				add		esp,0x00000004
002A  25 FF FF 00 00			and		eax,0x0000ffff
002F  50				push		eax
0030  31 C0				xor		eax,eax
0032  66 89 D8				mov		ax,bx
0035  50				push		eax
0036  56				push		esi
0037  9A 00 00 00 00 00 00		call		_fjputmoji
003E  83 C4 0C				add		esp,0x0000000c
0041  89 D3				mov		ebx,edx
0043  89 C6				mov		esi,eax
0045				L$2:
0045  8D 54 24 04			lea		edx,0x4[esp]
0049  8C D8				mov		eax,ds
004B  25 FF FF 00 00			and		eax,0x0000ffff
0050  50				push		eax
0051  31 C0				xor		eax,eax
0053  52				push		edx
0054  66 89 F8				mov		ax,di
0057  50				push		eax
0058  55				push		ebp
0059  9A 00 00 00 00 00 00		call		_fjgetmoji
0060  83 C4 10				add		esp,0x00000010
0063  89 D7				mov		edi,edx
0065  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0069  89 C5				mov		ebp,eax
006B  66 85 D2				test		dx,dx
006E  75 AC				jne		L$1
0070  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0074  8B 04 24				mov		eax,dword ptr [esp]
0077  83 C4 0C				add		esp,0x0000000c
007A  5D				pop		ebp
007B  5F				pop		edi
007C  5E				pop		esi
007D  5B				pop		ebx
007E  CB				retf		

Routine Size: 127 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

