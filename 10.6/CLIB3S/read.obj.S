Module: read
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001D9 bytes
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
001C  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0020  E8 00 00 00 00			call		__IOMode
0025  83 C4 04				add		esp,0x00000004
0028  89 C3				mov		ebx,eax
002A  89 44 24 04			mov		dword ptr 0x4[esp],eax
002E  85 C0				test		eax,eax
0030  75 14				jne		L$2
0032  6A 04				push		0x00000004
0034  E8 00 00 00 00			call		__set_errno
0039				L$1:
0039  B8 FF FF FF FF			mov		eax,0xffffffff
003E  83 C4 04				add		esp,0x00000004
0041  E9 8B 01 00 00			jmp		L$16
0046				L$2:
0046  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
004A  51				push		ecx
004B  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0051  83 C4 04				add		esp,0x00000004
0054  F6 C3 01				test		bl,0x01
0057  75 17				jne		L$3
0059  6A 06				push		0x00000006
005B  E8 00 00 00 00			call		__set_errno
0060  83 C4 04				add		esp,0x00000004
0063  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0067  51				push		ecx
0068  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
006E  EB C9				jmp		L$1
0070				L$3:
0070  F6 C3 40				test		bl,0x40
0073  74 72				je		L$6
0075  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdin,0x00000000
007C  74 25				je		L$4
007E  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0082  50				push		eax
0083  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0089  83 C4 04				add		esp,0x00000004
008C  85 C0				test		eax,eax
008E  74 13				je		L$4
0090  56				push		esi
0091  55				push		ebp
0092  50				push		eax
0093  FF 15 00 00 00 00			call		dword ptr _WindowsStdin
0099  83 C4 0C				add		esp,0x0000000c
009C  89 C7				mov		edi,eax
009E  E9 1E 01 00 00			jmp		L$14
00A3				L$4:
00A3  6A 00				push		0x00000000
00A5  8D 44 24 04			lea		eax,0x4[esp]
00A9  50				push		eax
00AA  56				push		esi
00AB  55				push		ebp
00AC  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
00B0  52				push		edx
00B1  E8 00 00 00 00			call		_ReadFile
00B6  8B 3C 24				mov		edi,dword ptr [esp]
00B9  85 C0				test		eax,eax
00BB  0F 85 00 01 00 00			jne		L$14
00C1  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
00C5  53				push		ebx
00C6  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00CC  83 C4 04				add		esp,0x00000004
00CF  E8 00 00 00 00			call		_GetLastError
00D4  83 F8 6D				cmp		eax,0x0000006d
00D7  0F 84 F2 00 00 00			je		L$15
00DD				L$5:
00DD  E8 00 00 00 00			call		__set_errno_nt
00E2  E9 EA 00 00 00			jmp		L$16
00E7				L$6:
00E7  89 74 24 0C			mov		dword ptr 0xc[esp],esi
00EB  31 FF				xor		edi,edi
00ED				L$7:
00ED  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdin,0x00000000
00F4  74 27				je		L$8
00F6  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
00FA  50				push		eax
00FB  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0101  83 C4 04				add		esp,0x00000004
0104  85 C0				test		eax,eax
0106  74 15				je		L$8
0108  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
010C  56				push		esi
010D  55				push		ebp
010E  50				push		eax
010F  FF 15 00 00 00 00			call		dword ptr _WindowsStdin
0115  83 C4 0C				add		esp,0x0000000c
0118  89 04 24				mov		dword ptr [esp],eax
011B  EB 39				jmp		L$9
011D				L$8:
011D  6A 00				push		0x00000000
011F  8D 44 24 04			lea		eax,0x4[esp]
0123  50				push		eax
0124  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0128  52				push		edx
0129  55				push		ebp
012A  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
012E  53				push		ebx
012F  E8 00 00 00 00			call		_ReadFile
0134  85 C0				test		eax,eax
0136  75 1E				jne		L$9
0138  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
013C  51				push		ecx
013D  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0143  83 C4 04				add		esp,0x00000004
0146  E8 00 00 00 00			call		_GetLastError
014B  83 F8 6D				cmp		eax,0x0000006d
014E  0F 84 7B 00 00 00			je		L$15
0154  EB 87				jmp		L$5
0156				L$9:
0156  83 3C 24 00			cmp		dword ptr [esp],0x00000000
015A  74 65				je		L$14
015C  89 E8				mov		eax,ebp
015E  31 DB				xor		ebx,ebx
0160  31 D2				xor		edx,edx
0162  EB 3B				jmp		L$13
0164				L$10:
0164  31 C9				xor		ecx,ecx
0166  8A 08				mov		cl,byte ptr [eax]
0168  83 F9 1A				cmp		ecx,0x0000001a
016B  75 24				jne		L$11
016D  8B 14 24				mov		edx,dword ptr [esp]
0170  89 D8				mov		eax,ebx
0172  29 D0				sub		eax,edx
0174  6A 01				push		0x00000001
0176  40				inc		eax
0177  50				push		eax
0178  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
017C  53				push		ebx
017D  E8 00 00 00 00			call		lseek
0182  83 C4 0C				add		esp,0x0000000c
0185  53				push		ebx
0186  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
018C  83 C4 04				add		esp,0x00000004
018F  EB 3E				jmp		L$15
0191				L$11:
0191  83 F9 0D				cmp		ecx,0x0000000d
0194  74 07				je		L$12
0196  89 D6				mov		esi,edx
0198  47				inc		edi
0199  42				inc		edx
019A  88 0C 2E				mov		byte ptr [esi+ebp],cl
019D				L$12:
019D  40				inc		eax
019E  43				inc		ebx
019F				L$13:
019F  3B 1C 24				cmp		ebx,dword ptr [esp]
01A2  72 C0				jb		L$10
01A4  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
01A8  8A 64 24 05			mov		ah,byte ptr 0x5[esp]
01AC  29 D6				sub		esi,edx
01AE  01 D5				add		ebp,edx
01B0  89 74 24 0C			mov		dword ptr 0xc[esp],esi
01B4  F6 C4 20				test		ah,0x20
01B7  75 08				jne		L$14
01B9  85 F6				test		esi,esi
01BB  0F 85 2C FF FF FF			jne		L$7
01C1				L$14:
01C1  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
01C5  56				push		esi
01C6  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
01CC  83 C4 04				add		esp,0x00000004
01CF				L$15:
01CF  89 F8				mov		eax,edi
01D1				L$16:
01D1  83 C4 10				add		esp,0x00000010
01D4  5D				pop		ebp
01D5  5F				pop		edi
01D6  5E				pop		esi
01D7  5B				pop		ebx
01D8  C3				ret		

Routine Size: 473 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

