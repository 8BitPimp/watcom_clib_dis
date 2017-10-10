Module: mktime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000158 bytes
0000				mktime:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
0008  8B 47 10				mov		eax,dword ptr 0x10[edi]
000B  89 C2				mov		edx,eax
000D  BB 0C 00 00 00			mov		ebx,0x0000000c
0012  C1 FA 1F				sar		edx,0x1f
0015  F7 FB				idiv		ebx
0017  BD 00 00 00 00			mov		ebp,offset __diyr
001C  8B 5F 14				mov		ebx,dword ptr 0x14[edi]
001F  89 D6				mov		esi,edx
0021  81 FB A1 7E FB F4			cmp		ebx,0xf4fb7ea1
0027  7D 0A				jge		L$2
0029				L$1:
0029  B8 FF FF FF FF			mov		eax,0xffffffff
002E  5D				pop		ebp
002F  5F				pop		edi
0030  5E				pop		esi
0031  5B				pop		ebx
0032  C3				ret		
0033				L$2:
0033  8B 47 10				mov		eax,dword ptr 0x10[edi]
0036  89 C2				mov		edx,eax
0038  B9 0C 00 00 00			mov		ecx,0x0000000c
003D  C1 FA 1F				sar		edx,0x1f
0040  F7 F9				idiv		ecx
0042  01 C3				add		ebx,eax
0044				L$3:
0044  85 F6				test		esi,esi
0046  7D 06				jge		L$4
0048  4B				dec		ebx
0049  83 C6 0C				add		esi,0x0000000c
004C  EB F6				jmp		L$3
004E				L$4:
004E  85 DB				test		ebx,ebx
0050  7C D7				jl		L$1
0052  8D 83 6C 07 00 00			lea		eax,0x76c[ebx]
0058  50				push		eax
0059  E8 00 00 00 00			call		__leapyear
005E  83 C4 04				add		esp,0x00000004
0061  85 C0				test		eax,eax
0063  74 05				je		L$5
0065  BD 00 00 00 00			mov		ebp,offset __dilyr
006A				L$5:
006A  8D 4B 03				lea		ecx,0x3[ebx]
006D  89 D8				mov		eax,ebx
006F  C1 E0 03				shl		eax,0x03
0072  01 D8				add		eax,ebx
0074  C1 E0 03				shl		eax,0x03
0077  01 D8				add		eax,ebx
0079  89 C2				mov		edx,eax
007B  C1 E0 02				shl		eax,0x02
007E  C1 F9 02				sar		ecx,0x02
0081  01 D0				add		eax,edx
0083  8D 14 08				lea		edx,[eax+ecx]
0086  0F BF 44 75 00			movsx		eax,word ptr [ebp+esi*2]
008B  8B 77 0C				mov		esi,dword ptr 0xc[edi]
008E  01 D0				add		eax,edx
0090  01 C6				add		esi,eax
0092  4E				dec		esi
0093  85 DB				test		ebx,ebx
0095  74 01				je		L$6
0097  4E				dec		esi
0098				L$6:
0098  8B 57 08				mov		edx,dword ptr 0x8[edi]
009B  89 D0				mov		eax,edx
009D  C1 E0 04				shl		eax,0x04
00A0  29 D0				sub		eax,edx
00A2  C1 E0 02				shl		eax,0x02
00A5  8B 57 04				mov		edx,dword ptr 0x4[edi]
00A8  01 C2				add		edx,eax
00AA  89 D0				mov		eax,edx
00AC  C1 E0 04				shl		eax,0x04
00AF  29 D0				sub		eax,edx
00B1  8B 1F				mov		ebx,dword ptr [edi]
00B3  C1 E0 02				shl		eax,0x02
00B6  01 C3				add		ebx,eax
00B8				L$7:
00B8  85 DB				test		ebx,ebx
00BA  7D 09				jge		L$8
00BC  4E				dec		esi
00BD  81 C3 80 51 01 00			add		ebx,0x00015180
00C3  EB F3				jmp		L$7
00C5				L$8:
00C5  57				push		edi
00C6  6A 00				push		0x00000000
00C8  53				push		ebx
00C9  56				push		esi
00CA  E8 00 00 00 00			call		__brktime
00CF  83 C4 10				add		esp,0x00000010
00D2  E8 00 00 00 00			call		tzset
00D7  8B 15 00 00 00 00			mov		edx,dword ptr timezone
00DD  8B 4F 20				mov		ecx,dword ptr 0x20[edi]
00E0  01 D3				add		ebx,edx
00E2  85 C9				test		ecx,ecx
00E4  7D 09				jge		L$9
00E6  57				push		edi
00E7  E8 00 00 00 00			call		__isindst
00EC  83 C4 04				add		esp,0x00000004
00EF				L$9:
00EF  83 7F 20 00			cmp		dword ptr 0x20[edi],0x00000000
00F3  7E 06				jle		L$10
00F5  2B 1D 00 00 00 00			sub		ebx,dword ptr __dst_adjust
00FB				L$10:
00FB  85 DB				test		ebx,ebx
00FD  7D 09				jge		L$11
00FF  4E				dec		esi
0100  81 C3 80 51 01 00			add		ebx,0x00015180
0106  EB F3				jmp		L$10
0108				L$11:
0108  81 FE DE 63 00 00			cmp		esi,0x000063de
010E  0F 8C 15 FF FF FF			jl		L$1
0114  75 1D				jne		L$12
0116  8B 15 00 00 00 00			mov		edx,dword ptr timezone
011C  81 EB 80 51 01 00			sub		ebx,0x00015180
0122  85 D2				test		edx,edx
0124  0F 8E FF FE FF FF			jle		L$1
012A  85 DB				test		ebx,ebx
012C  7D 23				jge		L$13
012E  E9 F6 FE FF FF			jmp		L$1
0133				L$12:
0133  8D 86 21 9C FF FF			lea		eax,-0x63df[esi]
0139  89 C6				mov		esi,eax
013B  C1 E6 03				shl		esi,0x03
013E  29 C6				sub		esi,eax
0140  C1 E6 05				shl		esi,0x05
0143  01 C6				add		esi,eax
0145  C1 E6 07				shl		esi,0x07
0148  89 F0				mov		eax,esi
014A  C1 E6 02				shl		esi,0x02
014D  29 C6				sub		esi,eax
014F  01 F3				add		ebx,esi
0151				L$13:
0151  89 D8				mov		eax,ebx
0153  5D				pop		ebp
0154  5F				pop		edi
0155  5E				pop		esi
0156  5B				pop		ebx
0157  C3				ret		

Routine Size: 344 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

