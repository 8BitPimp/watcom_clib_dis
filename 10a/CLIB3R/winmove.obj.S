Module: winmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001CE bytes
0000				_MovePageUp_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  89 C2				mov		edx,eax
0006  8B 40 24				mov		eax,dword ptr 0x24[eax]
0009  8B 5A 4A				mov		ebx,dword ptr 0x4a[edx]
000C  48				dec		eax
000D  29 C3				sub		ebx,eax
000F  8B 42 24				mov		eax,dword ptr 0x24[edx]
0012  8B 4A 4E				mov		ecx,dword ptr 0x4e[edx]
0015  48				dec		eax
0016  89 5A 4A				mov		dword ptr 0x4a[edx],ebx
0019  29 C1				sub		ecx,eax
001B  8B 72 4A				mov		esi,dword ptr 0x4a[edx]
001E  89 4A 4E				mov		dword ptr 0x4e[edx],ecx
0021  83 FE 01				cmp		esi,0x00000001
0024  7D 07				jge		L$1
0026  C7 42 4A 01 00 00 00		mov		dword ptr 0x4a[edx],0x00000001
002D				L$1:
002D  83 7A 4E 01			cmp		dword ptr 0x4e[edx],0x00000001
0031  7D 07				jge		L$2
0033  C7 42 4E 01 00 00 00		mov		dword ptr 0x4e[edx],0x00000001
003A				L$2:
003A  89 D0				mov		eax,edx
003C  E8 00 00 00 00			call		_PositionScrollThumb_
0041  89 D0				mov		eax,edx
0043  E8 00 00 00 00			call		_DisplayAllLines_
0048  5E				pop		esi
0049  5A				pop		edx
004A  59				pop		ecx
004B  5B				pop		ebx
004C  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0000

004D				_MovePageDown_:
004D  53				push		ebx
004E  51				push		ecx
004F  52				push		edx
0050  56				push		esi
0051  57				push		edi
0052  89 C3				mov		ebx,eax
0054  E8 00 00 00 00			call		_GetLastLineNumber_
0059  8B 53 24				mov		edx,dword ptr 0x24[ebx]
005C  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
005F  4A				dec		edx
0060  01 D1				add		ecx,edx
0062  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0065  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
0068  4A				dec		edx
0069  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
006C  01 D6				add		esi,edx
006E  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
0071  89 73 4E				mov		dword ptr 0x4e[ebx],esi
0074  39 F8				cmp		eax,edi
0076  73 25				jae		L$3
0078  89 43 4A				mov		dword ptr 0x4a[ebx],eax
007B  8B 43 24				mov		eax,dword ptr 0x24[ebx]
007E  89 C2				mov		edx,eax
0080  C1 FA 1F				sar		edx,0x1f
0083  2B C2				sub		eax,edx
0085  D1 F8				sar		eax,0x01
0087  89 C2				mov		edx,eax
0089  8B 43 4A				mov		eax,dword ptr 0x4a[ebx]
008C  29 D0				sub		eax,edx
008E  89 43 4E				mov		dword ptr 0x4e[ebx],eax
0091  83 F8 01				cmp		eax,0x00000001
0094  7D 07				jge		L$3
0096  C7 43 4E 01 00 00 00		mov		dword ptr 0x4e[ebx],0x00000001
009D				L$3:
009D  89 D8				mov		eax,ebx
009F  E8 00 00 00 00			call		_PositionScrollThumb_
00A4  89 D8				mov		eax,ebx
00A6  E8 00 00 00 00			call		_DisplayAllLines_
00AB				L$4:
00AB  5F				pop		edi
00AC  5E				pop		esi
00AD  5A				pop		edx
00AE  59				pop		ecx
00AF  5B				pop		ebx
00B0  C3				ret		

Routine Size: 100 bytes,    Routine Base: _TEXT + 004D

00B1				_MoveLineUp_:
00B1  53				push		ebx
00B2  51				push		ecx
00B3  52				push		edx
00B4  56				push		esi
00B5  89 C1				mov		ecx,eax
00B7  83 78 4E 01			cmp		dword ptr 0x4e[eax],0x00000001
00BB  74 38				je		L$5
00BD  8B 58 4A				mov		ebx,dword ptr 0x4a[eax]
00C0  8B 70 4E				mov		esi,dword ptr 0x4e[eax]
00C3  4B				dec		ebx
00C4  4E				dec		esi
00C5  89 58 4A				mov		dword ptr 0x4a[eax],ebx
00C8  BA FF FF FF FF			mov		edx,0xffffffff
00CD  89 70 4E				mov		dword ptr 0x4e[eax],esi
00D0  E8 00 00 00 00			call		_ShiftWindow_
00D5  89 C8				mov		eax,ecx
00D7  8B 51 4E				mov		edx,dword ptr 0x4e[ecx]
00DA  E8 00 00 00 00			call		_GetLineDataPointer_
00DF  BA 01 00 00 00			mov		edx,0x00000001
00E4  8D 58 09				lea		ebx,0x9[eax]
00E7  89 C8				mov		eax,ecx
00E9  E8 00 00 00 00			call		_DisplayLineInWindow_
00EE  89 C8				mov		eax,ecx
00F0  E8 00 00 00 00			call		_PositionScrollThumb_
00F5				L$5:
00F5  5E				pop		esi
00F6  5A				pop		edx
00F7  59				pop		ecx
00F8  5B				pop		ebx
00F9  C3				ret		

Routine Size: 73 bytes,    Routine Base: _TEXT + 00B1

00FA				_MoveLineDown_:
00FA  53				push		ebx
00FB  51				push		ecx
00FC  52				push		edx
00FD  56				push		esi
00FE  57				push		edi
00FF  89 C1				mov		ecx,eax
0101  E8 00 00 00 00			call		_GetLastLineNumber_
0106  3B 41 4A				cmp		eax,dword ptr 0x4a[ecx]
0109  74 A0				je		L$4
010B  8B 51 4E				mov		edx,dword ptr 0x4e[ecx]
010E  03 51 24				add		edx,dword ptr 0x24[ecx]
0111  8D 5A FF				lea		ebx,-0x1[edx]
0114  39 C3				cmp		ebx,eax
0116  73 93				jae		L$4
0118  BA 01 00 00 00			mov		edx,0x00000001
011D  89 C8				mov		eax,ecx
011F  E8 00 00 00 00			call		_ShiftWindow_
0124  89 C8				mov		eax,ecx
0126  89 DA				mov		edx,ebx
0128  E8 00 00 00 00			call		_GetLineDataPointer_
012D  85 C0				test		eax,eax
012F  74 0E				je		L$6
0131  8B 51 24				mov		edx,dword ptr 0x24[ecx]
0134  8D 58 09				lea		ebx,0x9[eax]
0137  4A				dec		edx
0138  89 C8				mov		eax,ecx
013A  E8 00 00 00 00			call		_DisplayLineInWindow_
013F				L$6:
013F  8B 71 4A				mov		esi,dword ptr 0x4a[ecx]
0142  8B 79 4E				mov		edi,dword ptr 0x4e[ecx]
0145  46				inc		esi
0146  47				inc		edi
0147  89 71 4A				mov		dword ptr 0x4a[ecx],esi
014A  89 C8				mov		eax,ecx
014C  89 79 4E				mov		dword ptr 0x4e[ecx],edi
014F  E8 00 00 00 00			call		_PositionScrollThumb_
0154  E9 52 FF FF FF			jmp		L$4

Routine Size: 95 bytes,    Routine Base: _TEXT + 00FA

0159				_MoveToLine_:
0159  51				push		ecx
015A  56				push		esi
015B  57				push		edi
015C  55				push		ebp
015D  89 C1				mov		ecx,eax
015F  89 D6				mov		esi,edx
0161  89 DF				mov		edi,ebx
0163  8B 50 24				mov		edx,dword ptr 0x24[eax]
0166  8B 58 4E				mov		ebx,dword ptr 0x4e[eax]
0169  E8 00 00 00 00			call		_GetLastLineNumber_
016E  83 EA 02				sub		edx,0x00000002
0171  8B 69 4E				mov		ebp,dword ptr 0x4e[ecx]
0174  01 D3				add		ebx,edx
0176  39 EE				cmp		esi,ebp
0178  72 08				jb		L$7
017A  39 DE				cmp		esi,ebx
017C  77 04				ja		L$7
017E  85 FF				test		edi,edi
0180  74 47				je		L$13
0182				L$7:
0182  85 FF				test		edi,edi
0184  75 04				jne		L$8
0186  39 C3				cmp		ebx,eax
0188  73 12				jae		L$9
018A				L$8:
018A  89 D0				mov		eax,edx
018C  C1 FA 1F				sar		edx,0x1f
018F  2B C2				sub		eax,edx
0191  D1 F8				sar		eax,0x01
0193  89 F2				mov		edx,esi
0195  29 C2				sub		edx,eax
0197  89 51 4E				mov		dword ptr 0x4e[ecx],edx
019A  EB 0F				jmp		L$11
019C				L$9:
019C  76 02				jbe		L$10
019E  89 C3				mov		ebx,eax
01A0				L$10:
01A0  39 F3				cmp		ebx,esi
01A2  76 07				jbe		L$11
01A4  89 F0				mov		eax,esi
01A6  29 D0				sub		eax,edx
01A8  89 41 4E				mov		dword ptr 0x4e[ecx],eax
01AB				L$11:
01AB  83 79 4E 01			cmp		dword ptr 0x4e[ecx],0x00000001
01AF  7D 07				jge		L$12
01B1  C7 41 4E 01 00 00 00		mov		dword ptr 0x4e[ecx],0x00000001
01B8				L$12:
01B8  89 C8				mov		eax,ecx
01BA  89 71 4A				mov		dword ptr 0x4a[ecx],esi
01BD  E8 00 00 00 00			call		_PositionScrollThumb_
01C2  89 C8				mov		eax,ecx
01C4  E8 00 00 00 00			call		_DisplayAllLines_
01C9				L$13:
01C9  5D				pop		ebp
01CA  5F				pop		edi
01CB  5E				pop		esi
01CC  59				pop		ecx
01CD  C3				ret		

Routine Size: 117 bytes,    Routine Base: _TEXT + 0159

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

