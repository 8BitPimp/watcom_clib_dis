Module: read
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001AD bytes
0000				read:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 10				sub		esp,0x00000010
0007  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
000B  8B 74 24 2C			mov		esi,dword ptr 0x2c[esp]
000F  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
0013  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
0018  8B 04 90				mov		eax,dword ptr [eax+edx*4]
001B  52				push		edx
001C  89 44 24 10			mov		dword ptr 0x10[esp],eax
0020  E8 00 00 00 00			call		__IOMode
0025  83 C4 04				add		esp,0x00000004
0028  89 C3				mov		ebx,eax
002A  89 04 24				mov		dword ptr [esp],eax
002D  85 C0				test		eax,eax
002F  75 14				jne		L$2
0031  6A 04				push		0x00000004
0033  E8 00 00 00 00			call		__set_errno
0038				L$1:
0038  B8 FF FF FF FF			mov		eax,0xffffffff
003D  83 C4 04				add		esp,0x00000004
0040  E9 60 01 00 00			jmp		L$16
0045				L$2:
0045  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0049  51				push		ecx
004A  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0050  83 C4 04				add		esp,0x00000004
0053  F6 C3 01				test		bl,0x01
0056  75 17				jne		L$3
0058  6A 06				push		0x00000006
005A  E8 00 00 00 00			call		__set_errno
005F  83 C4 04				add		esp,0x00000004
0062  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0066  51				push		ecx
0067  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
006D  EB C9				jmp		L$1
006F				L$3:
006F  F6 C3 40				test		bl,0x40
0072  74 65				je		L$6
0074  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdin,0x00000000
007B  74 25				je		L$4
007D  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0081  50				push		eax
0082  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0088  83 C4 04				add		esp,0x00000004
008B  85 C0				test		eax,eax
008D  74 13				je		L$4
008F  56				push		esi
0090  55				push		ebp
0091  50				push		eax
0092  FF 15 00 00 00 00			call		dword ptr _WindowsStdin
0098  83 C4 0C				add		esp,0x0000000c
009B  89 C7				mov		edi,eax
009D  E9 F3 00 00 00			jmp		L$14
00A2				L$4:
00A2  6A 00				push		0x00000000
00A4  8D 44 24 08			lea		eax,0x8[esp]
00A8  50				push		eax
00A9  56				push		esi
00AA  55				push		ebp
00AB  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
00AF  52				push		edx
00B0  E8 00 00 00 00			call		_ReadFile
00B5  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
00B9  85 C0				test		eax,eax
00BB  0F 85 D4 00 00 00			jne		L$14
00C1  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
00C5  53				push		ebx
00C6				L$5:
00C6  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00CC  83 C4 04				add		esp,0x00000004
00CF  E8 00 00 00 00			call		__set_errno_nt
00D4  E9 CC 00 00 00			jmp		L$16
00D9				L$6:
00D9  89 74 24 08			mov		dword ptr 0x8[esp],esi
00DD  31 FF				xor		edi,edi
00DF				L$7:
00DF  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdin,0x00000000
00E6  74 28				je		L$8
00E8  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
00EC  50				push		eax
00ED  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
00F3  83 C4 04				add		esp,0x00000004
00F6  85 C0				test		eax,eax
00F8  74 16				je		L$8
00FA  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
00FE  56				push		esi
00FF  55				push		ebp
0100  50				push		eax
0101  FF 15 00 00 00 00			call		dword ptr _WindowsStdin
0107  83 C4 0C				add		esp,0x0000000c
010A  89 44 24 04			mov		dword ptr 0x4[esp],eax
010E  EB 22				jmp		L$9
0110				L$8:
0110  6A 00				push		0x00000000
0112  8D 44 24 08			lea		eax,0x8[esp]
0116  50				push		eax
0117  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
011B  52				push		edx
011C  55				push		ebp
011D  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0121  53				push		ebx
0122  E8 00 00 00 00			call		_ReadFile
0127  85 C0				test		eax,eax
0129  75 07				jne		L$9
012B  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
012F  51				push		ecx
0130  EB 94				jmp		L$5
0132				L$9:
0132  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0137  74 5C				je		L$14
0139  89 E8				mov		eax,ebp
013B  31 DB				xor		ebx,ebx
013D  31 D2				xor		edx,edx
013F  EB 31				jmp		L$13
0141				L$10:
0141  8A 08				mov		cl,byte ptr [eax]
0143  80 F9 1A				cmp		cl,0x1a
0146  75 1C				jne		L$11
0148  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
014C  89 D8				mov		eax,ebx
014E  29 D0				sub		eax,edx
0150  6A 01				push		0x00000001
0152  40				inc		eax
0153  50				push		eax
0154  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
0158  53				push		ebx
0159  E8 00 00 00 00			call		lseek
015E  83 C4 0C				add		esp,0x0000000c
0161  53				push		ebx
0162  EB 36				jmp		L$15
0164				L$11:
0164  80 F9 0D				cmp		cl,0x0d
0167  74 07				je		L$12
0169  89 D6				mov		esi,edx
016B  47				inc		edi
016C  42				inc		edx
016D  88 0C 2E				mov		byte ptr [esi+ebp],cl
0170				L$12:
0170  40				inc		eax
0171  43				inc		ebx
0172				L$13:
0172  3B 5C 24 04			cmp		ebx,dword ptr 0x4[esp]
0176  72 C9				jb		L$10
0178  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
017C  8A 64 24 01			mov		ah,byte ptr 0x1[esp]
0180  29 D6				sub		esi,edx
0182  01 D5				add		ebp,edx
0184  89 74 24 08			mov		dword ptr 0x8[esp],esi
0188  F6 C4 20				test		ah,0x20
018B  75 08				jne		L$14
018D  85 F6				test		esi,esi
018F  0F 85 4A FF FF FF			jne		L$7
0195				L$14:
0195  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0199  56				push		esi
019A				L$15:
019A  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
01A0  83 C4 04				add		esp,0x00000004
01A3  89 F8				mov		eax,edi
01A5				L$16:
01A5  83 C4 10				add		esp,0x00000010
01A8  5D				pop		ebp
01A9  5F				pop		edi
01AA  5E				pop		esi
01AB  5B				pop		ebx
01AC  C3				ret		

Routine Size: 429 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

