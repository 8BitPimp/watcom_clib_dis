Module: dmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000012B bytes
0000				L$1:
0000  F5 00 00 00                                     DD	offset L$7
0004  54 00 00 00                                     DD	offset L$3
0008  33 00 00 00                                     DD	offset L$2
000C  E4 00 00 00                                     DD	offset L$6

Routine Size: 16 bytes,    Routine Base: _TEXT + 0000

0010				__LibMain:
0010  53				push		ebx
0011  56				push		esi
0012  57				push		edi
0013  55				push		ebp
0014  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0018  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
001C  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0020  83 FF 03				cmp		edi,0x00000003
0023  0F 87 F9 00 00 00			ja		L$10
0029  89 F8				mov		eax,edi
002B  2E FF 24 85 00 00 00 00		jmp		dword ptr cs:L$1[eax*4]
0033				L$2:
0033  6A 00				push		0x00000000
0035  E8 00 00 00 00			call		__NTAddThread
003A  83 C4 04				add		esp,0x00000004
003D  85 C0				test		eax,eax
003F  0F 84 DF 00 00 00			je		L$11
0045  56				push		esi
0046  57				push		edi
0047  55				push		ebp
0048  E8 00 00 00 00			call		_LibMain
004D  89 C3				mov		ebx,eax
004F  E9 CE 00 00 00			jmp		L$10
0054				L$3:
0054  B8 01 00 00 00			mov		eax,0x00000001
0059  E8 00 00 00 00			call		__InitRtns
005E  6A 00				push		0x00000000
0060  6A 01				push		0x00000001
0062  E8 00 00 00 00			call		__NTInit
0067  83 C4 08				add		esp,0x00000008
006A  85 C0				test		eax,eax
006C  0F 84 B2 00 00 00			je		L$11
0072  E8 00 00 00 00			call		__NTThreadInit
0077  85 C0				test		eax,eax
0079  0F 84 A5 00 00 00			je		L$11
007F  B8 0F 00 00 00			mov		eax,0x0000000f
0084  E8 00 00 00 00			call		__InitRtns
0089  E8 00 00 00 00			call		__InitMultipleThread
008E  B8 FF 00 00 00			mov		eax,0x000000ff
0093  E8 00 00 00 00			call		__InitRtns
0098  E8 00 00 00 00			call		__CommonInit
009D  56				push		esi
009E  57				push		edi
009F  55				push		ebp
00A0  E8 00 00 00 00			call		_LibMain
00A5  89 C3				mov		ebx,eax
00A7  85 C0				test		eax,eax
00A9  74 2E				je		L$5
00AB  E8 00 00 00 00			call		_GetVersion
00B0  A3 00 00 00 00			mov		dword ptr DGROUP:L$12,eax
00B5  A9 00 00 00 80			test		eax,0x80000000
00BA  74 1D				je		L$5
00BC  6A 00				push		0x00000000
00BE  E8 00 00 00 00			call		__NTAddThread
00C3  83 C4 04				add		esp,0x00000004
00C6  85 C0				test		eax,eax
00C8  74 0D				je		L$4
00CA  56				push		esi
00CB  6A 02				push		0x00000002
00CD  55				push		ebp
00CE  E8 00 00 00 00			call		_LibMain
00D3  89 C3				mov		ebx,eax
00D5  EB 02				jmp		L$5
00D7				L$4:
00D7  31 DB				xor		ebx,ebx
00D9				L$5:
00D9  85 DB				test		ebx,ebx
00DB  75 45				jne		L$10
00DD  BA FF 00 00 00			mov		edx,0x000000ff
00E2  EB 37				jmp		L$9
00E4				L$6:
00E4  56				push		esi
00E5  57				push		edi
00E6  55				push		ebp
00E7  E8 00 00 00 00			call		_LibMain
00EC  89 C3				mov		ebx,eax
00EE  E8 00 00 00 00			call		__NTRemoveThread
00F3  EB 2D				jmp		L$10
00F5				L$7:
00F5  F6 05 03 00 00 00 80		test		byte ptr DGROUP:L$13,0x80
00FC  74 0E				je		L$8
00FE  56				push		esi
00FF  6A 03				push		0x00000003
0101  55				push		ebp
0102  E8 00 00 00 00			call		_LibMain
0107  E8 00 00 00 00			call		__NTRemoveThread
010C				L$8:
010C  56				push		esi
010D  57				push		edi
010E  55				push		ebp
010F  E8 00 00 00 00			call		_LibMain
0114  BA FF 00 00 00			mov		edx,0x000000ff
0119  89 C3				mov		ebx,eax
011B				L$9:
011B  31 C0				xor		eax,eax
011D  E8 00 00 00 00			call		__FiniRtns
0122				L$10:
0122  89 D8				mov		eax,ebx
0124				L$11:
0124  5D				pop		ebp
0125  5F				pop		edi
0126  5E				pop		esi
0127  5B				pop		ebx
0128  C2 0C 00				ret		0x000c

Routine Size: 283 bytes,    Routine Base: _TEXT + 0010

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				L$12:
0003				L$13:

BSS Size: 4 bytes

