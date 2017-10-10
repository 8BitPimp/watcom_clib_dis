Module: spvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000154 bytes
0000				spawnvpe:
0000  68 38 01 00 00			push		0x00000138
0005  E8 00 00 00 00			call		__CHK
000A  53				push		ebx
000B  56				push		esi
000C  57				push		edi
000D  C8 14 01 00			enter		0x0114,0x00
0011  8B 75 18				mov		esi,dword ptr 0x18[ebp]
0014  FF 75 20				push		dword ptr 0x20[ebp]
0017  FF 75 1C				push		dword ptr 0x1c[ebp]
001A  56				push		esi
001B  FF 75 14				push		dword ptr 0x14[ebp]
001E  E8 00 00 00 00			call		spawnve
0023  89 C7				mov		edi,eax
0025  83 C4 10				add		esp,0x00000010
0028  89 45 FC				mov		dword ptr -0x4[ebp],eax
002B  83 F8 FF				cmp		eax,0xffffffff
002E  0F 85 18 01 00 00			jne		L$6
0034  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
003A  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
003E  0F 85 08 01 00 00			jne		L$6
0044  80 3E 5C				cmp		byte ptr [esi],0x5c
0047  0F 84 FF 00 00 00			je		L$6
004D  80 3E 00				cmp		byte ptr [esi],0x00
0050  0F 84 F6 00 00 00			je		L$6
0056  80 7E 01 3A			cmp		byte ptr 0x1[esi],0x3a
005A  0F 84 EC 00 00 00			je		L$6
0060  68 00 00 00 00			push		offset DGROUP:L$7
0065  E8 00 00 00 00			call		getenv
006A  83 C4 04				add		esp,0x00000004
006D  89 C3				mov		ebx,eax
006F  85 C0				test		eax,eax
0071  75 07				jne		L$1
0073  89 F8				mov		eax,edi
0075  C9				leave		
0076  5F				pop		edi
0077  5E				pop		esi
0078  5B				pop		ebx
0079  C3				ret		
007A				L$1:
007A  56				push		esi
007B  E8 00 00 00 00			call		strlen
0080  40				inc		eax
0081  89 45 F4				mov		dword ptr -0xc[ebp],eax
0084  B8 04 01 00 00			mov		eax,0x00000104
0089  2B 45 F4				sub		eax,dword ptr -0xc[ebp]
008C  83 C4 04				add		esp,0x00000004
008F  89 45 F0				mov		dword ptr -0x10[ebp],eax
0092				L$2:
0092  80 3B 00				cmp		byte ptr [ebx],0x00
0095  0F 84 B1 00 00 00			je		L$6
009B  6A 3B				push		0x0000003b
009D  53				push		ebx
009E  E8 00 00 00 00			call		strchr
00A3  83 C4 08				add		esp,0x00000008
00A6  89 C7				mov		edi,eax
00A8  85 C0				test		eax,eax
00AA  75 0C				jne		L$3
00AC  53				push		ebx
00AD  E8 00 00 00 00			call		strlen
00B2  83 C4 04				add		esp,0x00000004
00B5  8D 3C 03				lea		edi,[ebx+eax]
00B8				L$3:
00B8  89 F8				mov		eax,edi
00BA  29 D8				sub		eax,ebx
00BC  89 45 F8				mov		dword ptr -0x8[ebp],eax
00BF  3B 45 F0				cmp		eax,dword ptr -0x10[ebp]
00C2  76 1E				jbe		L$4
00C4  6A 02				push		0x00000002
00C6  E8 00 00 00 00			call		__set_errno
00CB  83 C4 04				add		esp,0x00000004
00CE  6A 0A				push		0x0000000a
00D0  E8 00 00 00 00			call		__set_doserrno
00D5  B8 FF FF FF FF			mov		eax,0xffffffff
00DA  83 C4 04				add		esp,0x00000004
00DD  C9				leave		
00DE  5F				pop		edi
00DF  5E				pop		esi
00E0  5B				pop		ebx
00E1  C3				ret		
00E2				L$4:
00E2  50				push		eax
00E3  53				push		ebx
00E4  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
00EA  8D 9D EC FE FF FF			lea		ebx,-0x114[ebp]
00F0  50				push		eax
00F1  03 5D F8				add		ebx,dword ptr -0x8[ebp]
00F4  E8 00 00 00 00			call		memcpy
00F9  83 C4 0C				add		esp,0x0000000c
00FC  80 7B FF 5C			cmp		byte ptr -0x1[ebx],0x5c
0100  74 04				je		L$5
0102  C6 03 5C				mov		byte ptr [ebx],0x5c
0105  43				inc		ebx
0106				L$5:
0106  FF 75 F4				push		dword ptr -0xc[ebp]
0109  56				push		esi
010A  53				push		ebx
010B  E8 00 00 00 00			call		memcpy
0110  83 C4 0C				add		esp,0x0000000c
0113  FF 75 20				push		dword ptr 0x20[ebp]
0116  FF 75 1C				push		dword ptr 0x1c[ebp]
0119  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
011F  50				push		eax
0120  FF 75 14				push		dword ptr 0x14[ebp]
0123  E8 00 00 00 00			call		spawnve
0128  83 C4 10				add		esp,0x00000010
012B  89 45 FC				mov		dword ptr -0x4[ebp],eax
012E  83 F8 FF				cmp		eax,0xffffffff
0131  75 19				jne		L$6
0133  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0139  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
013D  75 0D				jne		L$6
013F  80 3F 3B				cmp		byte ptr [edi],0x3b
0142  75 08				jne		L$6
0144  8D 5F 01				lea		ebx,0x1[edi]
0147  E9 46 FF FF FF			jmp		L$2
014C				L$6:
014C  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
014F  C9				leave		
0150  5F				pop		edi
0151  5E				pop		esi
0152  5B				pop		ebx
0153  C3				ret		

Routine Size: 340 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000				L$7:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

