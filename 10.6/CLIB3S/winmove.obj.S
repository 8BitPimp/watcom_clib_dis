Module: winmove
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001EC bytes
0000				_MovePageUp:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0007  83 7B 4E 01			cmp		dword ptr 0x4e[ebx],0x00000001
000B  74 48				je		L$4
000D  8B 43 24				mov		eax,dword ptr 0x24[ebx]
0010  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
0013  48				dec		eax
0014  29 C1				sub		ecx,eax
0016  8B 43 24				mov		eax,dword ptr 0x24[ebx]
0019  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
001C  48				dec		eax
001D  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
0020  29 C6				sub		esi,eax
0022  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
0025  89 73 4E				mov		dword ptr 0x4e[ebx],esi
0028  83 FF 01				cmp		edi,0x00000001
002B  7D 07				jge		L$1
002D  C7 43 4A 01 00 00 00		mov		dword ptr 0x4a[ebx],0x00000001
0034				L$1:
0034  83 7B 4E 01			cmp		dword ptr 0x4e[ebx],0x00000001
0038				L$2:
0038  7D 07				jge		L$3
003A  C7 43 4E 01 00 00 00		mov		dword ptr 0x4e[ebx],0x00000001
0041				L$3:
0041  53				push		ebx
0042  E8 00 00 00 00			call		_PositionScrollThumb
0047  83 C4 04				add		esp,0x00000004
004A  6A 01				push		0x00000001
004C  53				push		ebx
004D  E8 00 00 00 00			call		_DisplayAllLines
0052  83 C4 08				add		esp,0x00000008
0055				L$4:
0055  5F				pop		edi
0056  5E				pop		esi
0057  5B				pop		ebx
0058  C3				ret		

Routine Size: 89 bytes,    Routine Base: _TEXT + 0000

0059				_MovePageDown:
0059  53				push		ebx
005A  56				push		esi
005B  57				push		edi
005C  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0060  53				push		ebx
0061  E8 00 00 00 00			call		_GetLastLineNumber
0066  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0069  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
006C  4A				dec		edx
006D  83 C4 04				add		esp,0x00000004
0070  01 D1				add		ecx,edx
0072  8B 53 24				mov		edx,dword ptr 0x24[ebx]
0075  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
0078  4A				dec		edx
0079  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
007C  01 D6				add		esi,edx
007E  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
0081  89 73 4E				mov		dword ptr 0x4e[ebx],esi
0084  39 F8				cmp		eax,edi
0086  73 B9				jae		L$3
0088  89 43 4A				mov		dword ptr 0x4a[ebx],eax
008B  8B 43 24				mov		eax,dword ptr 0x24[ebx]
008E  89 C2				mov		edx,eax
0090  C1 FA 1F				sar		edx,0x1f
0093  2B C2				sub		eax,edx
0095  D1 F8				sar		eax,0x01
0097  89 C2				mov		edx,eax
0099  8B 43 4A				mov		eax,dword ptr 0x4a[ebx]
009C  29 D0				sub		eax,edx
009E  89 43 4E				mov		dword ptr 0x4e[ebx],eax
00A1  83 F8 01				cmp		eax,0x00000001
00A4  EB 92				jmp		L$2

Routine Size: 77 bytes,    Routine Base: _TEXT + 0059

00A6				_MoveLineUp:
00A6  53				push		ebx
00A7  56				push		esi
00A8  57				push		edi
00A9  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
00AD  83 7B 4E 01			cmp		dword ptr 0x4e[ebx],0x00000001
00B1  74 3E				je		L$5
00B3  6A FF				push		0xffffffff
00B5  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
00B8  8B 73 4E				mov		esi,dword ptr 0x4e[ebx]
00BB  49				dec		ecx
00BC  4E				dec		esi
00BD  89 4B 4A				mov		dword ptr 0x4a[ebx],ecx
00C0  53				push		ebx
00C1  89 73 4E				mov		dword ptr 0x4e[ebx],esi
00C4  E8 00 00 00 00			call		_ShiftWindow
00C9  83 C4 08				add		esp,0x00000008
00CC  8B 7B 4E				mov		edi,dword ptr 0x4e[ebx]
00CF  57				push		edi
00D0  53				push		ebx
00D1  E8 00 00 00 00			call		_GetLineDataPointer
00D6  83 C4 08				add		esp,0x00000008
00D9  83 C0 09				add		eax,0x00000009
00DC  50				push		eax
00DD  6A 01				push		0x00000001
00DF  53				push		ebx
00E0  E8 00 00 00 00			call		_DisplayLineInWindow
00E5  83 C4 0C				add		esp,0x0000000c
00E8  53				push		ebx
00E9  E8 00 00 00 00			call		_PositionScrollThumb
00EE  83 C4 04				add		esp,0x00000004
00F1				L$5:
00F1  5F				pop		edi
00F2  5E				pop		esi
00F3  5B				pop		ebx
00F4  C3				ret		

Routine Size: 79 bytes,    Routine Base: _TEXT + 00A6

00F5				_MoveLineDown:
00F5  53				push		ebx
00F6  56				push		esi
00F7  57				push		edi
00F8  55				push		ebp
00F9  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
00FD  53				push		ebx
00FE  E8 00 00 00 00			call		_GetLastLineNumber
0103  89 C2				mov		edx,eax
0105  8B 4B 4A				mov		ecx,dword ptr 0x4a[ebx]
0108  83 C4 04				add		esp,0x00000004
010B  39 C8				cmp		eax,ecx
010D  74 4F				je		L$7
010F  8B 43 4E				mov		eax,dword ptr 0x4e[ebx]
0112  03 43 24				add		eax,dword ptr 0x24[ebx]
0115  8D 70 FF				lea		esi,-0x1[eax]
0118  39 D6				cmp		esi,edx
011A  73 42				jae		L$7
011C  6A 01				push		0x00000001
011E  53				push		ebx
011F  E8 00 00 00 00			call		_ShiftWindow
0124  83 C4 08				add		esp,0x00000008
0127  56				push		esi
0128  53				push		ebx
0129  E8 00 00 00 00			call		_GetLineDataPointer
012E  83 C4 08				add		esp,0x00000008
0131  85 C0				test		eax,eax
0133  74 12				je		L$6
0135  83 C0 09				add		eax,0x00000009
0138  50				push		eax
0139  8B 43 24				mov		eax,dword ptr 0x24[ebx]
013C  48				dec		eax
013D  50				push		eax
013E  53				push		ebx
013F  E8 00 00 00 00			call		_DisplayLineInWindow
0144  83 C4 0C				add		esp,0x0000000c
0147				L$6:
0147  8B 7B 4A				mov		edi,dword ptr 0x4a[ebx]
014A  8B 6B 4E				mov		ebp,dword ptr 0x4e[ebx]
014D  47				inc		edi
014E  45				inc		ebp
014F  89 7B 4A				mov		dword ptr 0x4a[ebx],edi
0152  53				push		ebx
0153  89 6B 4E				mov		dword ptr 0x4e[ebx],ebp
0156  E8 00 00 00 00			call		_PositionScrollThumb
015B  83 C4 04				add		esp,0x00000004
015E				L$7:
015E  5D				pop		ebp
015F  5F				pop		edi
0160  5E				pop		esi
0161  5B				pop		ebx
0162  C3				ret		

Routine Size: 110 bytes,    Routine Base: _TEXT + 00F5

0163				_MoveToLine:
0163  53				push		ebx
0164  56				push		esi
0165  57				push		edi
0166  55				push		ebp
0167  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
016B  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
016F  53				push		ebx
0170  8B 73 24				mov		esi,dword ptr 0x24[ebx]
0173  8B 7B 4E				mov		edi,dword ptr 0x4e[ebx]
0176  E8 00 00 00 00			call		_GetLastLineNumber
017B  83 EE 02				sub		esi,0x00000002
017E  83 C4 04				add		esp,0x00000004
0181  8B 53 4E				mov		edx,dword ptr 0x4e[ebx]
0184  01 F7				add		edi,esi
0186  39 D5				cmp		ebp,edx
0188  72 0B				jb		L$8
018A  39 FD				cmp		ebp,edi
018C  77 07				ja		L$8
018E  83 7C 24 1C 00			cmp		dword ptr 0x1c[esp],0x00000000
0193  74 52				je		L$14
0195				L$8:
0195  83 7C 24 1C 00			cmp		dword ptr 0x1c[esp],0x00000000
019A  75 04				jne		L$9
019C  39 C7				cmp		edi,eax
019E  73 14				jae		L$10
01A0				L$9:
01A0  89 F2				mov		edx,esi
01A2  89 F0				mov		eax,esi
01A4  C1 FA 1F				sar		edx,0x1f
01A7  2B C2				sub		eax,edx
01A9  D1 F8				sar		eax,0x01
01AB  89 EE				mov		esi,ebp
01AD  29 C6				sub		esi,eax
01AF  89 73 4E				mov		dword ptr 0x4e[ebx],esi
01B2  EB 0F				jmp		L$12
01B4				L$10:
01B4  76 02				jbe		L$11
01B6  89 C7				mov		edi,eax
01B8				L$11:
01B8  39 EF				cmp		edi,ebp
01BA  76 07				jbe		L$12
01BC  89 E8				mov		eax,ebp
01BE  29 F0				sub		eax,esi
01C0  89 43 4E				mov		dword ptr 0x4e[ebx],eax
01C3				L$12:
01C3  83 7B 4E 01			cmp		dword ptr 0x4e[ebx],0x00000001
01C7  7D 07				jge		L$13
01C9  C7 43 4E 01 00 00 00		mov		dword ptr 0x4e[ebx],0x00000001
01D0				L$13:
01D0  53				push		ebx
01D1  89 6B 4A				mov		dword ptr 0x4a[ebx],ebp
01D4  E8 00 00 00 00			call		_PositionScrollThumb
01D9  83 C4 04				add		esp,0x00000004
01DC  6A 01				push		0x00000001
01DE  53				push		ebx
01DF  E8 00 00 00 00			call		_DisplayAllLines
01E4  83 C4 08				add		esp,0x00000008
01E7				L$14:
01E7  5D				pop		ebp
01E8  5F				pop		edi
01E9  5E				pop		esi
01EA  5B				pop		ebx
01EB  C3				ret		

Routine Size: 137 bytes,    Routine Base: _TEXT + 0163

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

