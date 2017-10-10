Module: dmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000125 bytes
0000				L$1:
0000  EF 00 00 00                                     DD	offset L$7
0004  51 00 00 00                                     DD	offset L$3
0008  33 00 00 00                                     DD	offset L$2
000C  DE 00 00 00                                     DD	offset L$6

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
0023  0F 87 F3 00 00 00			ja		L$10
0029  89 F8				mov		eax,edi
002B  2E FF 24 85 00 00 00 00		jmp		dword ptr cs:L$1[eax*4]
0033				L$2:
0033  31 F8				xor		eax,edi
0035  E8 00 00 00 00			call		__NTAddThread_
003A  85 C0				test		eax,eax
003C  0F 84 DC 00 00 00			je		L$11
0042  56				push		esi
0043  57				push		edi
0044  55				push		ebp
0045  E8 00 00 00 00			call		_LibMain
004A  89 C3				mov		ebx,eax
004C  E9 CB 00 00 00			jmp		L$10
0051				L$3:
0051  B8 01 00 00 00			mov		eax,0x00000001
0056  E8 00 00 00 00			call		__InitRtns
005B  31 D2				xor		edx,edx
005D  B8 01 00 00 00			mov		eax,0x00000001
0062  E8 00 00 00 00			call		__NTInit_
0067  85 C0				test		eax,eax
0069  0F 84 AF 00 00 00			je		L$11
006F  E8 00 00 00 00			call		__NTThreadInit_
0074  85 C0				test		eax,eax
0076  0F 84 A2 00 00 00			je		L$11
007C  B8 0F 00 00 00			mov		eax,0x0000000f
0081  E8 00 00 00 00			call		__InitRtns
0086  E8 00 00 00 00			call		__InitMultipleThread_
008B  B8 FF 00 00 00			mov		eax,0x000000ff
0090  E8 00 00 00 00			call		__InitRtns
0095  E8 00 00 00 00			call		__CommonInit_
009A  56				push		esi
009B  57				push		edi
009C  55				push		ebp
009D  E8 00 00 00 00			call		_LibMain
00A2  89 C3				mov		ebx,eax
00A4  85 C0				test		eax,eax
00A6  74 2B				je		L$5
00A8  E8 00 00 00 00			call		_GetVersion
00AD  A3 00 00 00 00			mov		dword ptr DGROUP:L$12,eax
00B2  A9 00 00 00 80			test		eax,0x80000000
00B7  74 1A				je		L$5
00B9  31 C0				xor		eax,eax
00BB  E8 00 00 00 00			call		__NTAddThread_
00C0  85 C0				test		eax,eax
00C2  74 0D				je		L$4
00C4  56				push		esi
00C5  6A 02				push		0x00000002
00C7  55				push		ebp
00C8  E8 00 00 00 00			call		_LibMain
00CD  89 C3				mov		ebx,eax
00CF  EB 02				jmp		L$5
00D1				L$4:
00D1  31 DB				xor		ebx,ebx
00D3				L$5:
00D3  85 DB				test		ebx,ebx
00D5  75 45				jne		L$10
00D7  BA FF 00 00 00			mov		edx,0x000000ff
00DC  EB 37				jmp		L$9
00DE				L$6:
00DE  56				push		esi
00DF  57				push		edi
00E0  55				push		ebp
00E1  E8 00 00 00 00			call		_LibMain
00E6  89 C3				mov		ebx,eax
00E8  E8 00 00 00 00			call		__NTRemoveThread_
00ED  EB 2D				jmp		L$10
00EF				L$7:
00EF  F6 05 03 00 00 00 80		test		byte ptr DGROUP:L$13,0x80
00F6  74 0E				je		L$8
00F8  56				push		esi
00F9  6A 03				push		0x00000003
00FB  55				push		ebp
00FC  E8 00 00 00 00			call		_LibMain
0101  E8 00 00 00 00			call		__NTRemoveThread_
0106				L$8:
0106  56				push		esi
0107  57				push		edi
0108  55				push		ebp
0109  E8 00 00 00 00			call		_LibMain
010E  BA FF 00 00 00			mov		edx,0x000000ff
0113  89 C3				mov		ebx,eax
0115				L$9:
0115  31 C0				xor		eax,eax
0117  E8 00 00 00 00			call		__FiniRtns
011C				L$10:
011C  89 D8				mov		eax,ebx
011E				L$11:
011E  5D				pop		ebp
011F  5F				pop		edi
0120  5E				pop		esi
0121  5B				pop		ebx
0122  C2 0C 00				ret		0x000c

Routine Size: 277 bytes,    Routine Base: _TEXT + 0010

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				L$12:
0003				L$13:

BSS Size: 4 bytes

