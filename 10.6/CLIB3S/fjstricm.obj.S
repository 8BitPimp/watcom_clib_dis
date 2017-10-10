Module: fjstricm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000E2 bytes
0000				_fjstricmp:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
000B  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
000F  8B 7C 24 2C			mov		edi,dword ptr 0x2c[esp]
0013  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
0017				L$1:
0017  89 E2				mov		edx,esp
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
0033  89 D3				mov		ebx,edx
0035  89 C6				mov		esi,eax
0037  8D 54 24 04			lea		edx,0x4[esp]
003B  8C D8				mov		eax,ds
003D  25 FF FF 00 00			and		eax,0x0000ffff
0042  50				push		eax
0043  31 C0				xor		eax,eax
0045  52				push		edx
0046  66 89 F8				mov		ax,di
0049  50				push		eax
004A  55				push		ebp
004B  9A 00 00 00 00 00 00		call		_fjgetmoji
0052  83 C4 10				add		esp,0x00000010
0055  89 C5				mov		ebp,eax
0057  8B 04 24				mov		eax,dword ptr [esp]
005A  89 D7				mov		edi,edx
005C  30 C0				xor		al,al
005E  25 FF FF 00 00			and		eax,0x0000ffff
0063  74 0E				je		L$2
0065  31 C0				xor		eax,eax
0067  66 8B 04 24			mov		ax,word ptr [esp]
006B  50				push		eax
006C  E8 00 00 00 00			call		jtoupper
0071  EB 0A				jmp		L$3
0073				L$2:
0073  66 8B 04 24			mov		ax,word ptr [esp]
0077  50				push		eax
0078  E8 00 00 00 00			call		toupper
007D				L$3:
007D  83 C4 04				add		esp,0x00000004
0080  89 04 24				mov		dword ptr [esp],eax
0083  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0087  30 C0				xor		al,al
0089  25 FF FF 00 00			and		eax,0x0000ffff
008E  74 0F				je		L$4
0090  31 C0				xor		eax,eax
0092  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
0097  50				push		eax
0098  E8 00 00 00 00			call		jtoupper
009D  EB 0B				jmp		L$5
009F				L$4:
009F  66 8B 44 24 04			mov		ax,word ptr 0x4[esp]
00A4  50				push		eax
00A5  E8 00 00 00 00			call		toupper
00AA				L$5:
00AA  83 C4 04				add		esp,0x00000004
00AD  89 44 24 04			mov		dword ptr 0x4[esp],eax
00B1  8B 04 24				mov		eax,dword ptr [esp]
00B4  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00B8  66 39 D0				cmp		ax,dx
00BB  74 10				je		L$7
00BD  73 07				jae		L$6
00BF  B8 FF FF FF FF			mov		eax,0xffffffff
00C4  EB 14				jmp		L$8
00C6				L$6:
00C6  B8 01 00 00 00			mov		eax,0x00000001
00CB  EB 0D				jmp		L$8
00CD				L$7:
00CD  66 83 3C 24 00			cmp		word ptr [esp],0x0000
00D2  0F 85 3F FF FF FF			jne		L$1
00D8  31 C0				xor		eax,eax
00DA				L$8:
00DA  83 C4 08				add		esp,0x00000008
00DD  5D				pop		ebp
00DE  5F				pop		edi
00DF  5E				pop		esi
00E0  5B				pop		ebx
00E1  CB				retf		

Routine Size: 226 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

