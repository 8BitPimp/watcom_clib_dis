Module: getchwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000190 bytes
0000				do_getch:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 18				sub		esp,0x00000018
0005  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
0009  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$14
000E  83 F8 01				cmp		eax,0x00000001
0011  72 5E				jb		L$5
0013  76 07				jbe		L$1
0015  83 F8 02				cmp		eax,0x00000002
0018  74 39				je		L$4
001A  EB 55				jmp		L$5
001C				L$1:
001C  8B 1D 08 00 00 00			mov		ebx,dword ptr DGROUP:L$17
0022  4B				dec		ebx
0023  8B 0D 04 00 00 00			mov		ecx,dword ptr DGROUP:L$16
0029  89 1D 08 00 00 00			mov		dword ptr DGROUP:L$17,ebx
002F  85 C9				test		ecx,ecx
0031  74 0C				je		L$2
0033  85 DB				test		ebx,ebx
0035  75 12				jne		L$3
0037  89 1D 00 00 00 00			mov		dword ptr DGROUP:L$14,ebx
003D  EB 0A				jmp		L$3
003F				L$2:
003F  C7 05 00 00 00 00 02 00 00 00
					mov		dword ptr DGROUP:L$14,0x00000002
0049				L$3:
0049  A1 04 00 00 00			mov		eax,dword ptr DGROUP:L$16
004E  E9 B4 00 00 00			jmp		L$9
0053				L$4:
0053  83 3D 08 00 00 00 00		cmp		dword ptr DGROUP:L$17,0x00000000
005A  0F 95 C0				setne		al
005D  25 FF 00 00 00			and		eax,0x000000ff
0062  A3 00 00 00 00			mov		dword ptr DGROUP:L$14,eax
0067  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$15
006C  E9 96 00 00 00			jmp		L$9
0071				L$5:
0071  8D 44 24 14			lea		eax,0x14[esp]
0075  50				push		eax
0076  6A 01				push		0x00000001
0078  8D 44 24 08			lea		eax,0x8[esp]
007C  50				push		eax
007D  53				push		ebx
007E  E8 00 00 00 00			call		_ReadConsoleInputA
0083  85 C0				test		eax,eax
0085  0F 84 77 00 00 00			je		L$8
008B  89 E0				mov		eax,esp
008D  50				push		eax
008E  E8 00 00 00 00			call		__NTRealKey
0093  83 C4 04				add		esp,0x00000004
0096  85 C0				test		eax,eax
0098  74 D7				je		L$5
009A  31 C0				xor		eax,eax
009C  66 8B 44 24 08			mov		ax,word ptr 0x8[esp]
00A1  48				dec		eax
00A2  A3 08 00 00 00			mov		dword ptr DGROUP:L$17,eax
00A7  31 C0				xor		eax,eax
00A9  8A 44 24 0E			mov		al,byte ptr 0xe[esp]
00AD  A3 04 00 00 00			mov		dword ptr DGROUP:L$16,eax
00B2  F6 44 24 11 01			test		byte ptr 0x11[esp],0x01
00B7  75 09				jne		L$6
00B9  83 3D 04 00 00 00 00		cmp		dword ptr DGROUP:L$16,0x00000000
00C0  75 24				jne		L$7
00C2				L$6:
00C2  BE 02 00 00 00			mov		esi,0x00000002
00C7  31 C0				xor		eax,eax
00C9  31 C9				xor		ecx,ecx
00CB  66 8B 44 24 0C			mov		ax,word ptr 0xc[esp]
00D0  89 0D 04 00 00 00			mov		dword ptr DGROUP:L$16,ecx
00D6  89 35 00 00 00 00			mov		dword ptr DGROUP:L$14,esi
00DC  A3 00 00 00 00			mov		dword ptr DGROUP:L$15,eax
00E1  E9 63 FF FF FF			jmp		L$3
00E6				L$7:
00E6  83 3D 08 00 00 00 00		cmp		dword ptr DGROUP:L$17,0x00000000
00ED  0F 84 56 FF FF FF			je		L$3
00F3  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr DGROUP:L$14,0x00000001
00FD  E9 47 FF FF FF			jmp		L$3
0102				L$8:
0102  B8 FF FF FF FF			mov		eax,0xffffffff
0107				L$9:
0107  83 C4 18				add		esp,0x00000018
010A  5E				pop		esi
010B  5B				pop		ebx
010C  C3				ret		

Routine Size: 269 bytes,    Routine Base: _TEXT + 0000

010D				getch:
010D  53				push		ebx
010E  56				push		esi
010F  83 EC 04				sub		esp,0x00000004
0112  A1 00 00 00 00			mov		eax,dword ptr _cbyte
0117  85 C0				test		eax,eax
0119  74 0A				je		L$10
011B  31 F6				xor		esi,esi
011D  89 35 00 00 00 00			mov		dword ptr _cbyte,esi
0123  EB 65				jmp		L$13
0125				L$10:
0125  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsGetch,0x00000000
012C  74 18				je		L$11
012E  50				push		eax
012F  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0135  83 C4 04				add		esp,0x00000004
0138  50				push		eax
0139  FF 15 00 00 00 00			call		dword ptr _WindowsGetch
013F  83 C4 04				add		esp,0x00000004
0142  89 C6				mov		esi,eax
0144  EB 42				jmp		L$12
0146				L$11:
0146  50				push		eax
0147  FF 15 00 00 00 00			call		dword ptr _AccessFileH
014D  83 C4 04				add		esp,0x00000004
0150  E8 00 00 00 00			call		__NTConsoleInput
0155  89 C3				mov		ebx,eax
0157  89 E0				mov		eax,esp
0159  50				push		eax
015A  53				push		ebx
015B  E8 00 00 00 00			call		_GetConsoleMode
0160  6A 00				push		0x00000000
0162  53				push		ebx
0163  E8 00 00 00 00			call		_SetConsoleMode
0168  53				push		ebx
0169  E8 00 00 00 00			call		do_getch
016E  83 C4 04				add		esp,0x00000004
0171  8B 0C 24				mov		ecx,dword ptr [esp]
0174  51				push		ecx
0175  53				push		ebx
0176  89 C6				mov		esi,eax
0178  E8 00 00 00 00			call		_SetConsoleMode
017D  6A 00				push		0x00000000
017F  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0185  83 C4 04				add		esp,0x00000004
0188				L$12:
0188  89 F0				mov		eax,esi
018A				L$13:
018A  83 C4 04				add		esp,0x00000004
018D  5E				pop		esi
018E  5B				pop		ebx
018F  C3				ret		

Routine Size: 131 bytes,    Routine Base: _TEXT + 010D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				L$14:
0000  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 0000000C bytes
0000				L$15:
0004				L$16:
0008				L$17:

BSS Size: 12 bytes

