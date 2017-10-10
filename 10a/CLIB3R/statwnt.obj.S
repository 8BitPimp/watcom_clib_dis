Module: statwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001C2 bytes
0000				at2mode_:
0000  53				push		ebx
0001  51				push		ecx
0002  89 C1				mov		ecx,eax
0004  89 D0				mov		eax,edx
0006  F6 C1 10				test		cl,0x10
0009  74 07				je		L$1
000B  BB 49 40 00 00			mov		ebx,0x00004049
0010  EB 27				jmp		L$2
0012				L$1:
0012  BA 2E 00 00 00			mov		edx,0x0000002e
0017  BB 00 80 00 00			mov		ebx,0x00008000
001C  E8 00 00 00 00			call		strchr_
0021  85 C0				test		eax,eax
0023  74 14				je		L$2
0025  BA 00 00 00 00			mov		edx,offset DGROUP:L$15
002A  40				inc		eax
002B  E8 00 00 00 00			call		strcmp_
0030  85 C0				test		eax,eax
0032  75 05				jne		L$2
0034  BB 49 80 00 00			mov		ebx,0x00008049
0039				L$2:
0039  66 81 CB 24 01			or		bx,0x0124
003E  F6 C1 01				test		cl,0x01
0041  75 03				jne		L$3
0043  80 CB 92				or		bl,0x92
0046				L$3:
0046  89 D8				mov		eax,ebx
0048  59				pop		ecx
0049  5B				pop		ebx
004A  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0000

004B				_stat_:

Routine Size: 0 bytes,    Routine Base: _TEXT + 004B

004B				stat_:
004B  53				push		ebx
004C  51				push		ecx
004D  56				push		esi
004E  57				push		edi
004F  C8 4C 02 00			enter		0x024c,0x00
0053  89 C7				mov		edi,eax
0055  89 D6				mov		esi,edx
0057  80 38 00				cmp		byte ptr [eax],0x00
005A  74 0E				je		L$4
005C  BA 04 00 00 00			mov		edx,offset DGROUP:L$16
0061  E8 00 00 00 00			call		strpbrk_
0066  85 C0				test		eax,eax
0068  74 14				je		L$6
006A				L$4:
006A  B8 01 00 00 00			mov		eax,0x00000001
006F  E8 00 00 00 00			call		__set_errno_
0074				L$5:
0074  B8 FF FF FF FF			mov		eax,0xffffffff
0079  E9 3E 01 00 00			jmp		L$14
007E				L$6:
007E  8D 85 F4 FE FF FF			lea		eax,-0x10c[ebp]
0084  BA 04 01 00 00			mov		edx,0x00000104
0089  E8 00 00 00 00			call		getcwd_
008E  89 F8				mov		eax,edi
0090  80 7F 01 3A			cmp		byte ptr 0x1[edi],0x3a
0094  75 03				jne		L$7
0096  8D 47 02				lea		eax,0x2[edi]
0099				L$7:
0099  80 38 5C				cmp		byte ptr [eax],0x5c
009C  74 05				je		L$8
009E  80 38 2F				cmp		byte ptr [eax],0x2f
00A1  75 3A				jne		L$9
00A3				L$8:
00A3  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
00A7  75 34				jne		L$9
00A9  89 F8				mov		eax,edi
00AB  E8 00 00 00 00			call		chdir_
00B0  85 C0				test		eax,eax
00B2  75 C0				jne		L$5
00B4  8D 85 F4 FE FF FF			lea		eax,-0x10c[ebp]
00BA  BB 3E 01 00 00			mov		ebx,0x0000013e
00BF  E8 00 00 00 00			call		chdir_
00C4  31 D2				xor		edx,edx
00C6  8D 85 B4 FD FF FF			lea		eax,-0x24c[ebp]
00CC  E8 00 00 00 00			call		memset_
00D1  C7 85 B4 FD FF FF 10 00 00 00
					mov		dword ptr -0x24c[ebp],0x00000010
00DB  EB 22				jmp		L$11
00DD				L$9:
00DD  8D 85 B4 FD FF FF			lea		eax,-0x24c[ebp]
00E3  50				push		eax
00E4  57				push		edi
00E5  E8 00 00 00 00			call		_FindFirstFileA
00EA  83 F8 FF				cmp		eax,0xffffffff
00ED  75 0A				jne		L$10
00EF  E8 00 00 00 00			call		__set_errno_nt_
00F4  E9 C3 00 00 00			jmp		L$14
00F9				L$10:
00F9  50				push		eax
00FA  E8 00 00 00 00			call		_FindClose
00FF				L$11:
00FF  80 7F 01 3A			cmp		byte ptr 0x1[edi],0x3a
0103  75 05				jne		L$12
0105  0F B6 07				movzx		eax,byte ptr [edi]
0108  EB 07				jmp		L$13
010A				L$12:
010A  0F B6 85 F4 FE FF FF		movzx		eax,byte ptr -0x10c[ebp]
0111				L$13:
0111  E8 00 00 00 00			call		tolower_
0116  83 E8 61				sub		eax,0x00000061
0119  89 06				mov		dword ptr [esi],eax
011B  FF 0E				dec		dword ptr [esi]
011D  8B 06				mov		eax,dword ptr [esi]
011F  89 46 12				mov		dword ptr 0x12[esi],eax
0122  8B 85 D4 FD FF FF			mov		eax,dword ptr -0x22c[ebp]
0128  89 46 16				mov		dword ptr 0x16[esi],eax
012B  8D 95 E0 FD FF FF			lea		edx,-0x220[ebp]
0131  8B 85 B4 FD FF FF			mov		eax,dword ptr -0x24c[ebp]
0137  8D 5D FC				lea		ebx,-0x4[ebp]
013A  E8 00 00 00 00			call		at2mode_
013F  8D 55 F8				lea		edx,-0x8[ebp]
0142  66 89 46 08			mov		word ptr 0x8[esi],ax
0146  8D 85 B8 FD FF FF			lea		eax,-0x248[ebp]
014C  E8 00 00 00 00			call		__MakeDOSDT_
0151  0F B7 55 FC			movzx		edx,word ptr -0x4[ebp]
0155  0F B7 45 F8			movzx		eax,word ptr -0x8[ebp]
0159  8D 5D FC				lea		ebx,-0x4[ebp]
015C  E8 00 00 00 00			call		_d2ttime_
0161  8D 55 F8				lea		edx,-0x8[ebp]
0164  89 46 22				mov		dword ptr 0x22[esi],eax
0167  8D 85 C0 FD FF FF			lea		eax,-0x240[ebp]
016D  E8 00 00 00 00			call		__MakeDOSDT_
0172  0F B7 55 FC			movzx		edx,word ptr -0x4[ebp]
0176  0F B7 45 F8			movzx		eax,word ptr -0x8[ebp]
017A  8D 5D FC				lea		ebx,-0x4[ebp]
017D  E8 00 00 00 00			call		_d2ttime_
0182  8D 55 F8				lea		edx,-0x8[ebp]
0185  89 46 1A				mov		dword ptr 0x1a[esi],eax
0188  8D 85 C8 FD FF FF			lea		eax,-0x238[ebp]
018E  E8 00 00 00 00			call		__MakeDOSDT_
0193  0F B7 55 FC			movzx		edx,word ptr -0x4[ebp]
0197  0F B7 45 F8			movzx		eax,word ptr -0x8[ebp]
019B  E8 00 00 00 00			call		_d2ttime_
01A0  66 C7 46 10 00 00			mov		word ptr 0x10[esi],0x0000
01A6  89 46 1E				mov		dword ptr 0x1e[esi],eax
01A9  66 8B 46 10			mov		ax,word ptr 0x10[esi]
01AD  66 C7 46 0A 01 00			mov		word ptr 0xa[esi],0x0001
01B3  98				cwde		
01B4  89 46 0C				mov		dword ptr 0xc[esi],eax
01B7  89 46 04				mov		dword ptr 0x4[esi],eax
01BA  31 C0				xor		eax,eax
01BC				L$14:
01BC  C9				leave		
01BD  5F				pop		edi
01BE  5E				pop		esi
01BF  59				pop		ecx
01C0  5B				pop		ebx
01C1  C3				ret		

Routine Size: 375 bytes,    Routine Base: _TEXT + 004B

No disassembly errors

Segment: CONST DWORD USE32 00000007 bytes
0000				L$15:
0000  45 58 45 00                                     EXE.
0004				L$16:
0004  2A 3F 00                                        *?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

