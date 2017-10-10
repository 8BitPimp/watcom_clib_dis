Module: makepath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000023D bytes
0000				pickup:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0008  83 FA 5C				cmp		edx,0x0000005c
000B  74 05				je		L$1
000D  83 FA 2F				cmp		edx,0x0000002f
0010  75 09				jne		L$3
0012				L$1:
0012  83 38 00				cmp		dword ptr [eax],0x00000000
0015  75 02				jne		L$2
0017  89 10				mov		dword ptr [eax],edx
0019				L$2:
0019  8B 10				mov		edx,dword ptr [eax]
001B				L$3:
001B  89 D0				mov		eax,edx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E				_makepath:
001E  53				push		ebx
001F  56				push		esi
0020  57				push		edi
0021  55				push		ebp
0022  83 EC 08				sub		esp,0x00000008
0025  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0029  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
002D  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
0031  31 D2				xor		edx,edx
0033  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
0037  89 14 24				mov		dword ptr [esp],edx
003A  85 C0				test		eax,eax
003C  74 0D				je		L$4
003E  8A 10				mov		dl,byte ptr [eax]
0040  84 D2				test		dl,dl
0042  74 07				je		L$4
0044  88 13				mov		byte ptr [ebx],dl
0046  43				inc		ebx
0047  C6 03 3A				mov		byte ptr [ebx],0x3a
004A  43				inc		ebx
004B				L$4:
004B  C6 03 00				mov		byte ptr [ebx],0x00
004E  85 ED				test		ebp,ebp
0050  0F 84 C5 00 00 00			je		L$14
0056  80 7D 00 00			cmp		byte ptr [ebp],0x00
005A  0F 84 BB 00 00 00			je		L$14
0060				L$5:
0060  89 E0				mov		eax,esp
0062  50				push		eax
0063  55				push		ebp
0064  E8 00 00 00 00			call		_mbptov
0069  83 C4 04				add		esp,0x00000004
006C  50				push		eax
006D  E8 00 00 00 00			call		pickup
0072  83 C4 08				add		esp,0x00000008
0075  50				push		eax
0076  E8 00 00 00 00			call		__mbvtop
007B  83 C4 04				add		esp,0x00000004
007E  89 DF				mov		edi,ebx
0080  89 C6				mov		esi,eax
0082  57				push		edi
0083				L$6:
0083  8A 06				mov		al,byte ptr [esi]
0085  88 07				mov		byte ptr [edi],al
0087  3C 00				cmp		al,0x00
0089  74 10				je		L$7
008B  8A 46 01				mov		al,byte ptr 0x1[esi]
008E  83 C6 02				add		esi,0x00000002
0091  88 47 01				mov		byte ptr 0x1[edi],al
0094  83 C7 02				add		edi,0x00000002
0097  3C 00				cmp		al,0x00
0099  75 E8				jne		L$6
009B				L$7:
009B  5F				pop		edi
009C  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00A3  74 13				je		L$8
00A5  31 C0				xor		eax,eax
00A7  8A 03				mov		al,byte ptr [ebx]
00A9  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
00AF  24 01				and		al,0x01
00B1  25 FF 00 00 00			and		eax,0x000000ff
00B6  EB 02				jmp		L$9
00B8				L$8:
00B8  31 C0				xor		eax,eax
00BA				L$9:
00BA  43				inc		ebx
00BB  8B 35 00 00 00 00			mov		esi,dword ptr __IsDBCS
00C1  01 C3				add		ebx,eax
00C3  85 F6				test		esi,esi
00C5  74 14				je		L$10
00C7  31 C0				xor		eax,eax
00C9  8A 45 00				mov		al,byte ptr [ebp]
00CC  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
00D2  24 01				and		al,0x01
00D4  25 FF 00 00 00			and		eax,0x000000ff
00D9  EB 02				jmp		L$11
00DB				L$10:
00DB  31 C0				xor		eax,eax
00DD				L$11:
00DD  45				inc		ebp
00DE  01 C5				add		ebp,eax
00E0  80 7D 00 00			cmp		byte ptr [ebp],0x00
00E4  0F 85 76 FF FF FF			jne		L$5
00EA  83 3C 24 00			cmp		dword ptr [esp],0x00000000
00EE  75 07				jne		L$12
00F0  C7 04 24 5C 00 00 00		mov		dword ptr [esp],0x0000005c
00F7				L$12:
00F7  53				push		ebx
00F8  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00FC  50				push		eax
00FD  E8 00 00 00 00			call		_mbsdec
0102  83 C4 08				add		esp,0x00000008
0105  8A 00				mov		al,byte ptr [eax]
0107  8B 14 24				mov		edx,dword ptr [esp]
010A  25 FF 00 00 00			and		eax,0x000000ff
010F  39 D0				cmp		eax,edx
0111  75 03				jne		L$13
0113  4B				dec		ebx
0114  EB 05				jmp		L$14
0116				L$13:
0116  8A 04 24				mov		al,byte ptr [esp]
0119  88 03				mov		byte ptr [ebx],al
011B				L$14:
011B  83 3C 24 00			cmp		dword ptr [esp],0x00000000
011F  75 07				jne		L$15
0121  C7 04 24 5C 00 00 00		mov		dword ptr [esp],0x0000005c
0128				L$15:
0128  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
012C  8D 6B 01				lea		ebp,0x1[ebx]
012F  85 FF				test		edi,edi
0131  0F 84 BE 00 00 00			je		L$22
0137  57				push		edi
0138  E8 00 00 00 00			call		_mbptov
013D  83 C4 04				add		esp,0x00000004
0140  89 E2				mov		edx,esp
0142  52				push		edx
0143  50				push		eax
0144  E8 00 00 00 00			call		pickup
0149  83 C4 08				add		esp,0x00000008
014C  8B 34 24				mov		esi,dword ptr [esp]
014F  39 F0				cmp		eax,esi
0151  74 0A				je		L$16
0153  31 C0				xor		eax,eax
0155  8A 03				mov		al,byte ptr [ebx]
0157  39 F0				cmp		eax,esi
0159  75 02				jne		L$16
015B  89 EB				mov		ebx,ebp
015D				L$16:
015D  89 E0				mov		eax,esp
015F  50				push		eax
0160  8B 6C 24 2C			mov		ebp,dword ptr 0x2c[esp]
0164  55				push		ebp
0165  E8 00 00 00 00			call		_mbptov
016A  83 C4 04				add		esp,0x00000004
016D  50				push		eax
016E  E8 00 00 00 00			call		pickup
0173  83 C4 08				add		esp,0x00000008
0176  50				push		eax
0177  E8 00 00 00 00			call		__mbvtop
017C  83 C4 04				add		esp,0x00000004
017F  89 DF				mov		edi,ebx
0181  89 C6				mov		esi,eax
0183  57				push		edi
0184				L$17:
0184  8A 06				mov		al,byte ptr [esi]
0186  88 07				mov		byte ptr [edi],al
0188  3C 00				cmp		al,0x00
018A  74 10				je		L$18
018C  8A 46 01				mov		al,byte ptr 0x1[esi]
018F  83 C6 02				add		esi,0x00000002
0192  88 47 01				mov		byte ptr 0x1[edi],al
0195  83 C7 02				add		edi,0x00000002
0198  3C 00				cmp		al,0x00
019A  75 E8				jne		L$17
019C				L$18:
019C  5F				pop		edi
019D  A1 00 00 00 00			mov		eax,dword ptr __IsDBCS
01A2  85 C0				test		eax,eax
01A4  74 11				je		L$19
01A6  31 C0				xor		eax,eax
01A8  8A 03				mov		al,byte ptr [ebx]
01AA  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
01B0  24 01				and		al,0x01
01B2  25 FF 00 00 00			and		eax,0x000000ff
01B7				L$19:
01B7  43				inc		ebx
01B8  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
01BE  01 C3				add		ebx,eax
01C0  85 D2				test		edx,edx
01C2  74 17				je		L$20
01C4  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
01C8  31 C0				xor		eax,eax
01CA  8A 02				mov		al,byte ptr [edx]
01CC  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
01D2  24 01				and		al,0x01
01D4  25 FF 00 00 00			and		eax,0x000000ff
01D9  EB 02				jmp		L$21
01DB				L$20:
01DB  31 C0				xor		eax,eax
01DD				L$21:
01DD  8B 6C 24 28			mov		ebp,dword ptr 0x28[esp]
01E1  45				inc		ebp
01E2  01 C5				add		ebp,eax
01E4  8A 6D 00				mov		ch,byte ptr [ebp]
01E7  89 6C 24 28			mov		dword ptr 0x28[esp],ebp
01EB  84 ED				test		ch,ch
01ED  0F 85 6A FF FF FF			jne		L$16
01F3  EB 0D				jmp		L$23
01F5				L$22:
01F5  31 C0				xor		eax,eax
01F7  8B 14 24				mov		edx,dword ptr [esp]
01FA  8A 03				mov		al,byte ptr [ebx]
01FC  39 D0				cmp		eax,edx
01FE  75 02				jne		L$23
0200  89 EB				mov		ebx,ebp
0202				L$23:
0202  8B 4C 24 2C			mov		ecx,dword ptr 0x2c[esp]
0206  85 C9				test		ecx,ecx
0208  74 28				je		L$26
020A  8A 11				mov		dl,byte ptr [ecx]
020C  84 D2				test		dl,dl
020E  74 22				je		L$26
0210  31 C0				xor		eax,eax
0212  88 D0				mov		al,dl
0214  83 F8 2E				cmp		eax,0x0000002e
0217  74 04				je		L$25
0219  C6 03 2E				mov		byte ptr [ebx],0x2e
021C				L$24:
021C  43				inc		ebx
021D				L$25:
021D  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
0221  8A 30				mov		dh,byte ptr [eax]
0223  84 F6				test		dh,dh
0225  74 0B				je		L$26
0227  8D 70 01				lea		esi,0x1[eax]
022A  88 33				mov		byte ptr [ebx],dh
022C  89 74 24 2C			mov		dword ptr 0x2c[esp],esi
0230  EB EA				jmp		L$24
0232				L$26:
0232  C6 03 00				mov		byte ptr [ebx],0x00
0235  83 C4 08				add		esp,0x00000008
0238  5D				pop		ebp
0239  5F				pop		edi
023A  5E				pop		esi
023B  5B				pop		ebx
023C  C3				ret		

Routine Size: 543 bytes,    Routine Base: _TEXT + 001E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

