Module: mbsinc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000197 bytes
0000				_mbgetcode:
0000  53				push		ebx
0001  57				push		edi
0002  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0006  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
000A  8B 0D 00 00 00 00			mov		ecx,dword ptr __IsDBCS
0010  8D 58 01				lea		ebx,0x1[eax]
0013  85 C9				test		ecx,ecx
0015  74 4C				je		L$4
0017  31 C9				xor		ecx,ecx
0019  8A 08				mov		cl,byte ptr [eax]
001B  89 0A				mov		dword ptr [edx],ecx
001D  85 C9				test		ecx,ecx
001F  74 4D				je		L$5
0021  8B 3D 00 00 00 00			mov		edi,dword ptr __IsDBCS
0027  89 D8				mov		eax,ebx
0029  85 FF				test		edi,edi
002B  74 15				je		L$1
002D  31 DB				xor		ebx,ebx
002F  8A 1A				mov		bl,byte ptr [edx]
0031  8A 9B 01 00 00 00			mov		bl,byte ptr __MBCSIsTable+0x1[ebx]
0037  80 E3 01				and		bl,0x01
003A  81 E3 FF 00 00 00			and		ebx,0x000000ff
0040  EB 02				jmp		L$2
0042				L$1:
0042  31 DB				xor		ebx,ebx
0044				L$2:
0044  74 28				je		L$5
0046  8A 18				mov		bl,byte ptr [eax]
0048  84 DB				test		bl,bl
004A  74 11				je		L$3
004C  8B 0A				mov		ecx,dword ptr [edx]
004E  31 DB				xor		ebx,ebx
0050  C1 E1 08				shl		ecx,0x08
0053  8A 18				mov		bl,byte ptr [eax]
0055  09 D9				or		ecx,ebx
0057  40				inc		eax
0058  89 0A				mov		dword ptr [edx],ecx
005A  5F				pop		edi
005B  5B				pop		ebx
005C  C3				ret		
005D				L$3:
005D  48				dec		eax
005E  88 18				mov		byte ptr [eax],bl
0060  5F				pop		edi
0061  5B				pop		ebx
0062  C3				ret		
0063				L$4:
0063  8A 00				mov		al,byte ptr [eax]
0065  25 FF 00 00 00			and		eax,0x000000ff
006A  89 02				mov		dword ptr [edx],eax
006C  89 D8				mov		eax,ebx
006E				L$5:
006E  5F				pop		edi
006F  5B				pop		ebx
0070  C3				ret		

Routine Size: 113 bytes,    Routine Base: _TEXT + 0000

0071				_mbsnextc:
0071  53				push		ebx
0072  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0076  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
007C  85 D2				test		edx,edx
007E  74 3E				je		L$7
0080  31 D2				xor		edx,edx
0082  8A 10				mov		dl,byte ptr [eax]
0084  85 D2				test		edx,edx
0086  74 38				je		L$8
0088  8B 1D 00 00 00 00			mov		ebx,dword ptr __IsDBCS
008E  40				inc		eax
008F  85 DB				test		ebx,ebx
0091  74 13				je		L$6
0093  31 DB				xor		ebx,ebx
0095  88 D3				mov		bl,dl
0097  8A 9B 01 00 00 00			mov		bl,byte ptr __MBCSIsTable+0x1[ebx]
009D  80 E3 01				and		bl,0x01
00A0  81 E3 FF 00 00 00			and		ebx,0x000000ff
00A6				L$6:
00A6  85 DB				test		ebx,ebx
00A8  74 16				je		L$8
00AA  80 38 00				cmp		byte ptr [eax],0x00
00AD  74 11				je		L$8
00AF  89 D3				mov		ebx,edx
00B1  31 D2				xor		edx,edx
00B3  C1 E3 08				shl		ebx,0x08
00B6  8A 10				mov		dl,byte ptr [eax]
00B8  09 DA				or		edx,ebx
00BA  89 D0				mov		eax,edx
00BC  5B				pop		ebx
00BD  C3				ret		
00BE				L$7:
00BE  8A 10				mov		dl,byte ptr [eax]
00C0				L$8:
00C0  89 D0				mov		eax,edx
00C2  5B				pop		ebx
00C3  C3				ret		

Routine Size: 83 bytes,    Routine Base: _TEXT + 0071

00C4				_mbsinc:
00C4  53				push		ebx
00C5  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00C9  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
00CF  8D 58 01				lea		ebx,0x1[eax]
00D2  85 D2				test		edx,edx
00D4  74 31				je		L$11
00D6  31 D2				xor		edx,edx
00D8  8A 10				mov		dl,byte ptr [eax]
00DA  85 D2				test		edx,edx
00DC  74 2B				je		L$12
00DE  89 D8				mov		eax,ebx
00E0  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00E7  74 17				je		L$9
00E9  81 E2 FF 00 00 00			and		edx,0x000000ff
00EF  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
00F5  80 E2 01				and		dl,0x01
00F8  81 E2 FF 00 00 00			and		edx,0x000000ff
00FE  EB 02				jmp		L$10
0100				L$9:
0100  31 D2				xor		edx,edx
0102				L$10:
0102  74 05				je		L$12
0104  40				inc		eax
0105  5B				pop		ebx
0106  C3				ret		
0107				L$11:
0107  89 D8				mov		eax,ebx
0109				L$12:
0109  5B				pop		ebx
010A  C3				ret		

Routine Size: 71 bytes,    Routine Base: _TEXT + 00C4

010B				_mbsdec:
010B  53				push		ebx
010C  56				push		esi
010D  57				push		edi
010E  8B 35 00 00 00 00			mov		esi,dword ptr __IsDBCS
0114  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0118  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
011C  39 FB				cmp		ebx,edi
011E  72 07				jb		L$13
0120  31 D2				xor		edx,edx
0122  E9 64 00 00 00			jmp		L$20
0127				L$13:
0127  8D 57 FF				lea		edx,-0x1[edi]
012A  85 F6				test		esi,esi
012C  74 5D				je		L$20
012E  89 D0				mov		eax,edx
0130  74 19				je		L$14
0132  8A 12				mov		dl,byte ptr [edx]
0134  81 E2 FF 00 00 00			and		edx,0x000000ff
013A  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
0140  80 E2 01				and		dl,0x01
0143  81 E2 FF 00 00 00			and		edx,0x000000ff
0149  EB 02				jmp		L$15
014B				L$14:
014B  31 D2				xor		edx,edx
014D				L$15:
014D  74 05				je		L$16
014F  8D 50 FF				lea		edx,-0x1[eax]
0152  EB 37				jmp		L$20
0154				L$16:
0154  48				dec		eax
0155  39 C3				cmp		ebx,eax
0157  77 1D				ja		L$19
0159  85 F6				test		esi,esi
015B  74 15				je		L$17
015D  31 D2				xor		edx,edx
015F  8A 10				mov		dl,byte ptr [eax]
0161  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
0167  80 E2 01				and		dl,0x01
016A  81 E2 FF 00 00 00			and		edx,0x000000ff
0170  EB 02				jmp		L$18
0172				L$17:
0172  31 D2				xor		edx,edx
0174				L$18:
0174  75 DE				jne		L$16
0176				L$19:
0176  89 FA				mov		edx,edi
0178  29 C2				sub		edx,eax
017A  BB 02 00 00 00			mov		ebx,0x00000002
017F  89 D0				mov		eax,edx
0181  C1 FA 1F				sar		edx,0x1f
0184  F7 FB				idiv		ebx
0186  4F				dec		edi
0187  29 D7				sub		edi,edx
0189  89 FA				mov		edx,edi
018B				L$20:
018B  89 D0				mov		eax,edx
018D  89 35 00 00 00 00			mov		dword ptr __IsDBCS,esi
0193  5F				pop		edi
0194  5E				pop		esi
0195  5B				pop		ebx
0196  C3				ret		

Routine Size: 140 bytes,    Routine Base: _TEXT + 010B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

