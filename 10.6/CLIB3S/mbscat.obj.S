Module: mbscat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000300 bytes
0000				_mbscat:
0000  56				push		esi
0001  57				push		edi
0002  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0006  89 F7				mov		edi,esi
0008  06				push		es
0009  8C D8				mov		eax,ds
000B  8E C0				mov		es,eax
000D  29 C9				sub		ecx,ecx
000F  49				dec		ecx
0010  31 C0				xor		eax,eax
0012  F2 AE				repne scasb	
0014  F7 D1				not		ecx
0016  49				dec		ecx
0017  07				pop		es
0018  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
001C  8D 51 01				lea		edx,0x1[ecx]
001F  06				push		es
0020  8C D8				mov		eax,ds
0022  8E C0				mov		es,eax
0024  29 C9				sub		ecx,ecx
0026  49				dec		ecx
0027  31 C0				xor		eax,eax
0029  F2 AE				repne scasb	
002B  F7 D1				not		ecx
002D  49				dec		ecx
002E  07				pop		es
002F  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
0033  01 CF				add		edi,ecx
0035  89 D1				mov		ecx,edx
0037				L$1:
0037  06				push		es
0038  8C D8				mov		eax,ds
003A  8E C0				mov		es,eax
003C  57				push		edi
003D  89 C8				mov		eax,ecx
003F  C1 E9 02				shr		ecx,0x02
0042  F2 A5				repne movsd	
0044  8A C8				mov		cl,al
0046  80 E1 03				and		cl,0x03
0049  F2 A4				repne movsb	
004B  5F				pop		edi
004C  07				pop		es
004D  89 F8				mov		eax,edi
004F  5F				pop		edi
0050  5E				pop		esi
0051  C3				ret		

Routine Size: 82 bytes,    Routine Base: _TEXT + 0000

0052				_mbscpy:
0052  56				push		esi
0053  57				push		edi
0054  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0058  89 F7				mov		edi,esi
005A  06				push		es
005B  8C D8				mov		eax,ds
005D  8E C0				mov		es,eax
005F  29 C9				sub		ecx,ecx
0061  49				dec		ecx
0062  31 C0				xor		eax,eax
0064  F2 AE				repne scasb	
0066  F7 D1				not		ecx
0068  49				dec		ecx
0069  07				pop		es
006A  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
006E  41				inc		ecx
006F  EB C6				jmp		L$1

Routine Size: 31 bytes,    Routine Base: _TEXT + 0052

0071				_mbsdup:
0071  53				push		ebx
0072  56				push		esi
0073  57				push		edi
0074  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0078  89 F7				mov		edi,esi
007A  06				push		es
007B  8C D8				mov		eax,ds
007D  8E C0				mov		es,eax
007F  29 C9				sub		ecx,ecx
0081  49				dec		ecx
0082  31 C0				xor		eax,eax
0084  F2 AE				repne scasb	
0086  F7 D1				not		ecx
0088  49				dec		ecx
0089  07				pop		es
008A  8D 59 01				lea		ebx,0x1[ecx]
008D  53				push		ebx
008E  E8 00 00 00 00			call		malloc
0093  83 C4 04				add		esp,0x00000004
0096  89 C1				mov		ecx,eax
0098  85 C0				test		eax,eax
009A  74 1C				je		L$2
009C  89 D9				mov		ecx,ebx
009E  89 C7				mov		edi,eax
00A0  06				push		es
00A1  8C D8				mov		eax,ds
00A3  8E C0				mov		es,eax
00A5  57				push		edi
00A6  89 C8				mov		eax,ecx
00A8  C1 E9 02				shr		ecx,0x02
00AB  F2 A5				repne movsd	
00AD  8A C8				mov		cl,al
00AF  80 E1 03				and		cl,0x03
00B2  F2 A4				repne movsb	
00B4  5F				pop		edi
00B5  07				pop		es
00B6  89 F9				mov		ecx,edi
00B8				L$2:
00B8  89 C8				mov		eax,ecx
00BA  5F				pop		edi
00BB  5E				pop		esi
00BC  5B				pop		ebx
00BD  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 0071

00BE				_mbsncat:
00BE  53				push		ebx
00BF  56				push		esi
00C0  57				push		edi
00C1  55				push		ebp
00C2  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
00C6  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00CD  74 47				je		L$3
00CF  89 DF				mov		edi,ebx
00D1  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
00D5  06				push		es
00D6  8C D8				mov		eax,ds
00D8  8E C0				mov		es,eax
00DA  29 C9				sub		ecx,ecx
00DC  49				dec		ecx
00DD  31 C0				xor		eax,eax
00DF  F2 AE				repne scasb	
00E1  F7 D1				not		ecx
00E3  49				dec		ecx
00E4  07				pop		es
00E5  55				push		ebp
00E6  8D 3C 0B				lea		edi,[ebx+ecx]
00E9  53				push		ebx
00EA  E8 00 00 00 00			call		_mbsnbcnt
00EF  83 C4 08				add		esp,0x00000008
00F2  89 C1				mov		ecx,eax
00F4  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
00F8  89 C2				mov		edx,eax
00FA  06				push		es
00FB  8C D8				mov		eax,ds
00FD  8E C0				mov		es,eax
00FF  57				push		edi
0100  89 C8				mov		eax,ecx
0102  C1 E9 02				shr		ecx,0x02
0105  F2 A5				repne movsd	
0107  8A C8				mov		cl,al
0109  80 E1 03				and		cl,0x03
010C  F2 A4				repne movsb	
010E  5F				pop		edi
010F  07				pop		es
0110  C6 04 3A 00			mov		byte ptr [edx+edi],0x00
0114  EB 13				jmp		L$4
0116				L$3:
0116  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
011A  51				push		ecx
011B  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
011F  56				push		esi
0120  53				push		ebx
0121  E8 00 00 00 00			call		strncat
0126  83 C4 0C				add		esp,0x0000000c
0129				L$4:
0129  89 D8				mov		eax,ebx
012B  5D				pop		ebp
012C  5F				pop		edi
012D  5E				pop		esi
012E  5B				pop		ebx
012F  C3				ret		

Routine Size: 114 bytes,    Routine Base: _TEXT + 00BE

0130				_mbsnbcat:
0130  53				push		ebx
0131  56				push		esi
0132  57				push		edi
0133  55				push		ebp
0134  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0138  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
013F  0F 84 C4 00 00 00			je		L$16
0145  80 7D 00 00			cmp		byte ptr [ebp],0x00
0149  0F 84 7E 00 00 00			je		L$15
014F  89 EE				mov		esi,ebp
0151  30 D2				xor		dl,dl
0153				L$5:
0153  8A 06				mov		al,byte ptr [esi]
0155  3A C2				cmp		al,dl
0157  74 12				je		L$7
0159  3C 00				cmp		al,0x00
015B  74 0C				je		L$6
015D  46				inc		esi
015E  8A 06				mov		al,byte ptr [esi]
0160  3A C2				cmp		al,dl
0162  74 07				je		L$7
0164  46				inc		esi
0165  3C 00				cmp		al,0x00
0167  75 EA				jne		L$5
0169				L$6:
0169  2B F6				sub		esi,esi
016B				L$7:
016B  8B 3D 00 00 00 00			mov		edi,dword ptr __IsDBCS
0171  8D 5E FF				lea		ebx,-0x1[esi]
0174  89 E8				mov		eax,ebp
0176  8B 35 00 00 00 00			mov		esi,dword ptr __IsDBCS
017C				L$8:
017C  80 38 00				cmp		byte ptr [eax],0x00
017F  74 45				je		L$14
0181  39 D8				cmp		eax,ebx
0183  75 21				jne		L$11
0185  85 F6				test		esi,esi
0187  74 15				je		L$9
0189  31 D2				xor		edx,edx
018B  8A 13				mov		dl,byte ptr [ebx]
018D  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
0193  80 E2 01				and		dl,0x01
0196  81 E2 FF 00 00 00			and		edx,0x000000ff
019C  EB 02				jmp		L$10
019E				L$9:
019E  31 D2				xor		edx,edx
01A0				L$10:
01A0  74 04				je		L$11
01A2  89 DD				mov		ebp,ebx
01A4  EB 20				jmp		L$14
01A6				L$11:
01A6  85 FF				test		edi,edi
01A8  74 15				je		L$12
01AA  31 D2				xor		edx,edx
01AC  8A 10				mov		dl,byte ptr [eax]
01AE  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
01B4  80 E2 01				and		dl,0x01
01B7  81 E2 FF 00 00 00			and		edx,0x000000ff
01BD  EB 02				jmp		L$13
01BF				L$12:
01BF  31 D2				xor		edx,edx
01C1				L$13:
01C1  40				inc		eax
01C2  01 D0				add		eax,edx
01C4  EB B6				jmp		L$8
01C6				L$14:
01C6  39 DD				cmp		ebp,ebx
01C8  74 03				je		L$15
01CA  8D 6B 01				lea		ebp,0x1[ebx]
01CD				L$15:
01CD  89 EF				mov		edi,ebp
01CF  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
01D3  06				push		es
01D4  8C D8				mov		eax,ds
01D6  8E C0				mov		es,eax
01D8  29 C9				sub		ecx,ecx
01DA  49				dec		ecx
01DB  31 C0				xor		eax,eax
01DD  F2 AE				repne scasb	
01DF  F7 D1				not		ecx
01E1  49				dec		ecx
01E2  07				pop		es
01E3  8D 3C 29				lea		edi,[ecx+ebp]
01E6  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
01EA  06				push		es
01EB  8C D8				mov		eax,ds
01ED  8E C0				mov		es,eax
01EF  57				push		edi
01F0  89 C8				mov		eax,ecx
01F2  C1 E9 02				shr		ecx,0x02
01F5  F2 A5				repne movsd	
01F7  8A C8				mov		cl,al
01F9  80 E1 03				and		cl,0x03
01FC  F2 A4				repne movsb	
01FE  5F				pop		edi
01FF  07				pop		es
0200  03 7C 24 1C			add		edi,dword ptr 0x1c[esp]
0204  C6 07 00				mov		byte ptr [edi],0x00
0207  EB 13				jmp		L$17
0209				L$16:
0209  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
020D  53				push		ebx
020E  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
0212  51				push		ecx
0213  55				push		ebp
0214  E8 00 00 00 00			call		strncat
0219  83 C4 0C				add		esp,0x0000000c
021C				L$17:
021C  89 E8				mov		eax,ebp
021E  5D				pop		ebp
021F  5F				pop		edi
0220  5E				pop		esi
0221  5B				pop		ebx
0222  C3				ret		

Routine Size: 243 bytes,    Routine Base: _TEXT + 0130

0223				_mbsncpy:
0223  53				push		ebx
0224  56				push		esi
0225  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0229  52				push		edx
022A  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
022E  53				push		ebx
022F  E8 00 00 00 00			call		_mbsnbcnt
0234  83 C4 08				add		esp,0x00000008
0237  50				push		eax
0238  53				push		ebx
0239  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
023D  56				push		esi
023E  E8 00 00 00 00			call		_mbsnbcpy
0243  83 C4 0C				add		esp,0x0000000c
0246  89 F0				mov		eax,esi
0248  5E				pop		esi
0249  5B				pop		ebx
024A  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 0223

024B				_mbsnbcpy:
024B  53				push		ebx
024C  56				push		esi
024D  57				push		edi
024E  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0252  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0256  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
025A  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0261  0F 84 88 00 00 00			je		L$23
0267  89 F7				mov		edi,esi
0269  06				push		es
026A  8C D8				mov		eax,ds
026C  8E C0				mov		es,eax
026E  29 C9				sub		ecx,ecx
0270  49				dec		ecx
0271  31 C0				xor		eax,eax
0273  F2 AE				repne scasb	
0275  F7 D1				not		ecx
0277  49				dec		ecx
0278  07				pop		es
0279  8B 3D 00 00 00 00			mov		edi,dword ptr __IsDBCS
027F  85 FF				test		edi,edi
0281  74 0F				je		L$18
0283  0F B6 3C 32			movzx		edi,byte ptr [edx+esi]
0287  8A 87 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[edi]
028D  24 01				and		al,0x01
028F  0F B6 F8				movzx		edi,al
0292				L$18:
0292  85 FF				test		edi,edi
0294  74 05				je		L$19
0296  39 CA				cmp		edx,ecx
0298  7D 01				jge		L$19
029A  4A				dec		edx
029B				L$19:
029B  8D 41 01				lea		eax,0x1[ecx]
029E  39 D0				cmp		eax,edx
02A0  7D 1C				jge		L$20
02A2  89 C1				mov		ecx,eax
02A4  89 DF				mov		edi,ebx
02A6  06				push		es
02A7  8C D8				mov		eax,ds
02A9  8E C0				mov		es,eax
02AB  57				push		edi
02AC  89 C8				mov		eax,ecx
02AE  C1 E9 02				shr		ecx,0x02
02B1  F2 A5				repne movsd	
02B3  8A C8				mov		cl,al
02B5  80 E1 03				and		cl,0x03
02B8  F2 A4				repne movsb	
02BA  5F				pop		edi
02BB  07				pop		es
02BC  EB 3C				jmp		L$25
02BE				L$20:
02BE  89 DF				mov		edi,ebx
02C0  57				push		edi
02C1				L$21:
02C1  8A 06				mov		al,byte ptr [esi]
02C3  88 07				mov		byte ptr [edi],al
02C5  3C 00				cmp		al,0x00
02C7  74 10				je		L$22
02C9  8A 46 01				mov		al,byte ptr 0x1[esi]
02CC  83 C6 02				add		esi,0x00000002
02CF  88 47 01				mov		byte ptr 0x1[edi],al
02D2  83 C7 02				add		edi,0x00000002
02D5  3C 00				cmp		al,0x00
02D7  75 E8				jne		L$21
02D9				L$22:
02D9  5F				pop		edi
02DA  39 D1				cmp		ecx,edx
02DC  74 1C				je		L$25
02DE  89 C8				mov		eax,ecx
02E0  29 D0				sub		eax,edx
02E2  50				push		eax
02E3  6A 00				push		0x00000000
02E5  01 D9				add		ecx,ebx
02E7  51				push		ecx
02E8  E8 00 00 00 00			call		memset
02ED  EB 08				jmp		L$24
02EF				L$23:
02EF  52				push		edx
02F0  56				push		esi
02F1  53				push		ebx
02F2  E8 00 00 00 00			call		strncpy
02F7				L$24:
02F7  83 C4 0C				add		esp,0x0000000c
02FA				L$25:
02FA  89 D8				mov		eax,ebx
02FC  5F				pop		edi
02FD  5E				pop		esi
02FE  5B				pop		ebx
02FF  C3				ret		

Routine Size: 181 bytes,    Routine Base: _TEXT + 024B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

