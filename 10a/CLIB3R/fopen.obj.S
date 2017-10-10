Module: fopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000272 bytes
0000				__open_flags_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  83 EC 04				sub		esp,0x00000004
0006  89 C2				mov		edx,eax
0008  31 C0				xor		eax,eax
000A  8A 02				mov		al,byte ptr [edx]
000C  31 DB				xor		ebx,ebx
000E  E8 00 00 00 00			call		tolower_
0013  88 04 24				mov		byte ptr [esp],al
0016  3C 72				cmp		al,0x72
0018  74 19				je		L$1
001A  3C 77				cmp		al,0x77
001C  74 15				je		L$1
001E  3C 61				cmp		al,0x61
0020  74 11				je		L$1
0022  B8 09 00 00 00			mov		eax,0x00000009
0027  E8 00 00 00 00			call		__set_errno_
002C  31 C0				xor		eax,eax
002E  E9 7A 00 00 00			jmp		L$12
0033				L$1:
0033  89 D8				mov		eax,ebx
0035  8A 4A 01				mov		cl,byte ptr 0x1[edx]
0038  0C 03				or		al,0x03
003A  80 F9 2B				cmp		cl,0x2b
003D  75 21				jne		L$4
003F  89 C3				mov		ebx,eax
0041  8A 4A 02				mov		cl,byte ptr 0x2[edx]
0044  0C 40				or		al,0x40
0046  80 F9 62				cmp		cl,0x62
0049  74 11				je		L$3
004B  80 F9 74				cmp		cl,0x74
004E  74 43				je		L$8
0050  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
005A				L$2:
005A  75 37				jne		L$8
005C				L$3:
005C  89 C3				mov		ebx,eax
005E  EB 33				jmp		L$8
0060				L$4:
0060  89 D9				mov		ecx,ebx
0062  80 C9 40				or		cl,0x40
0065  80 7A 01 62			cmp		byte ptr 0x1[edx],0x62
0069  75 0E				jne		L$5
006B  8A 42 02				mov		al,byte ptr 0x2[edx]
006E  89 CB				mov		ebx,ecx
0070  3C 2B				cmp		al,0x2b
0072  75 1F				jne		L$8
0074  80 C9 03				or		cl,0x03
0077  EB 18				jmp		L$7
0079				L$5:
0079  80 7A 01 74			cmp		byte ptr 0x1[edx],0x74
007D  75 06				jne		L$6
007F  80 7A 02 2B			cmp		byte ptr 0x2[edx],0x2b
0083  EB D5				jmp		L$2
0085				L$6:
0085  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr __fmode,0x00000200
008F  75 02				jne		L$8
0091				L$7:
0091  89 CB				mov		ebx,ecx
0093				L$8:
0093  8A 04 24				mov		al,byte ptr [esp]
0096  3C 77				cmp		al,0x77
0098  75 05				jne		L$9
009A  80 CB 02				or		bl,0x02
009D  EB 0C				jmp		L$11
009F				L$9:
009F  3C 61				cmp		al,0x61
00A1  75 05				jne		L$10
00A3  80 CB 82				or		bl,0x82
00A6  EB 03				jmp		L$11
00A8				L$10:
00A8  80 CB 01				or		bl,0x01
00AB				L$11:
00AB  89 D8				mov		eax,ebx
00AD				L$12:
00AD  83 C4 04				add		esp,0x00000004
00B0  5A				pop		edx
00B1  59				pop		ecx
00B2  5B				pop		ebx
00B3  C3				ret		
00B4				__doopen_:
00B4  56				push		esi
00B5  57				push		edi
00B6  89 C6				mov		esi,eax
00B8  80 61 0C FC			and		byte ptr 0xc[ecx],0xfc
00BC  89 D0				mov		eax,edx
00BE  E8 00 00 00 00			call		__open_flags_
00C3  8B 79 0C				mov		edi,dword ptr 0xc[ecx]
00C6  09 C7				or		edi,eax
00C8  31 C0				xor		eax,eax
00CA  89 79 0C				mov		dword ptr 0xc[ecx],edi
00CD  8A 02				mov		al,byte ptr [edx]
00CF  E8 00 00 00 00			call		tolower_
00D4  88 C2				mov		dl,al
00D6  3C 72				cmp		al,0x72
00D8  75 21				jne		L$16
00DA  8A 71 0C				mov		dh,byte ptr 0xc[ecx]
00DD  31 C0				xor		eax,eax
00DF  F6 C6 02				test		dh,0x02
00E2  74 05				je		L$13
00E4  B8 02 00 00 00			mov		eax,0x00000002
00E9				L$13:
00E9  F6 41 0C 40			test		byte ptr 0xc[ecx],0x40
00ED  74 05				je		L$14
00EF  80 CC 02				or		ah,0x02
00F2  EB 03				jmp		L$15
00F4				L$14:
00F4  80 CC 01				or		ah,0x01
00F7				L$15:
00F7  6A 00				push		0x00000000
00F9  EB 2D				jmp		L$21
00FB				L$16:
00FB  F6 41 0C 01			test		byte ptr 0xc[ecx],0x01
00FF  0F 95 C0				setne		al
0102  25 FF 00 00 00			and		eax,0x000000ff
0107  83 C0 21				add		eax,0x00000021
010A  80 FA 61				cmp		dl,0x61
010D  75 04				jne		L$17
010F  0C 10				or		al,0x10
0111  EB 02				jmp		L$18
0113				L$17:
0113  0C 40				or		al,0x40
0115				L$18:
0115  F6 41 0C 40			test		byte ptr 0xc[ecx],0x40
0119  74 05				je		L$19
011B  80 CC 02				or		ah,0x02
011E  EB 03				jmp		L$20
0120				L$19:
0120  80 CC 01				or		ah,0x01
0123				L$20:
0123  68 80 01 00 00			push		0x00000180
0128				L$21:
0128  53				push		ebx
0129  50				push		eax
012A  56				push		esi
012B  E8 00 00 00 00			call		sopen_
0130  83 C4 10				add		esp,0x00000010
0133  89 41 10				mov		dword ptr 0x10[ecx],eax
0136  83 79 10 FF			cmp		dword ptr 0x10[ecx],0xffffffff
013A  75 0C				jne		L$22
013C  89 C8				mov		eax,ecx
013E  E8 00 00 00 00			call		__freefp_
0143  31 C0				xor		eax,eax
0145  5F				pop		edi
0146  5E				pop		esi
0147  C3				ret		
0148				L$22:
0148  C7 41 04 00 00 00 00		mov		dword ptr 0x4[ecx],0x00000000
014F  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
0156  C7 41 14 00 00 00 00		mov		dword ptr 0x14[ecx],0x00000000
015D  80 FA 61				cmp		dl,0x61
0160  75 0E				jne		L$23
0162  BB 02 00 00 00			mov		ebx,0x00000002
0167  89 C8				mov		eax,ecx
0169  31 D2				xor		edx,edx
016B  E8 00 00 00 00			call		fseek_
0170				L$23:
0170  89 C8				mov		eax,ecx
0172  E8 00 00 00 00			call		__chktty_
0177  89 C8				mov		eax,ecx
0179  5F				pop		edi
017A  5E				pop		esi
017B  C3				ret		

Routine Size: 380 bytes,    Routine Base: _TEXT + 0000

017C				_fsopen_:
017C  51				push		ecx
017D  56				push		esi
017E  89 C6				mov		esi,eax
0180  31 C0				xor		eax,eax
0182  E8 00 00 00 00			call		__allocfp_
0187  89 C1				mov		ecx,eax
0189  85 C0				test		eax,eax
018B  74 07				je		L$24
018D  89 F0				mov		eax,esi
018F  E8 00 00 00 00			call		__doopen_
0194				L$24:
0194  5E				pop		esi
0195  59				pop		ecx
0196  C3				ret		

Routine Size: 27 bytes,    Routine Base: _TEXT + 017C

0197				fopen_:
0197  53				push		ebx
0198  31 DB				xor		ebx,ebx
019A  E8 00 00 00 00			call		_fsopen_
019F  5B				pop		ebx
01A0  C3				ret		
01A1				close_file_:
01A1  53				push		ebx
01A2  51				push		ecx
01A3  52				push		edx
01A4  89 C3				mov		ebx,eax
01A6  FF 15 00 00 00 00			call		dword ptr __AccessIOB
01AC  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
01B1				L$25:
01B1  85 C0				test		eax,eax
01B3  74 29				je		L$28
01B5  8B 50 04				mov		edx,dword ptr 0x4[eax]
01B8  39 D3				cmp		ebx,edx
01BA  75 1E				jne		L$27
01BC  F6 42 0C 03			test		byte ptr 0xc[edx],0x03
01C0  74 0C				je		L$26
01C2  89 D0				mov		eax,edx
01C4  BA 01 00 00 00			mov		edx,0x00000001
01C9  E8 00 00 00 00			call		__doclose_
01CE				L$26:
01CE  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
01D4  89 D8				mov		eax,ebx
01D6  5A				pop		edx
01D7  59				pop		ecx
01D8  5B				pop		ebx
01D9  C3				ret		
01DA				L$27:
01DA  8B 00				mov		eax,dword ptr [eax]
01DC  EB D3				jmp		L$25
01DE				L$28:
01DE  BA 00 00 00 00			mov		edx,offset ___ClosedStreams
01E3				L$29:
01E3  8B 02				mov		eax,dword ptr [edx]
01E5  85 C0				test		eax,eax
01E7  74 1C				je		L$31
01E9  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
01EC  75 13				jne		L$30
01EE  8B 08				mov		ecx,dword ptr [eax]
01F0  89 0A				mov		dword ptr [edx],ecx
01F2  8B 15 00 00 00 00			mov		edx,dword ptr ___OpenStreams
01F8  A3 00 00 00 00			mov		dword ptr ___OpenStreams,eax
01FD  89 10				mov		dword ptr [eax],edx
01FF  EB CD				jmp		L$26
0201				L$30:
0201  89 C2				mov		edx,eax
0203  EB DE				jmp		L$29
0205				L$31:
0205  B8 04 00 00 00			mov		eax,0x00000004
020A  E8 00 00 00 00			call		__set_errno_
020F  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
0215  31 C0				xor		eax,eax
0217  5A				pop		edx
0218  59				pop		ecx
0219  5B				pop		ebx
021A  C3				ret		

Routine Size: 132 bytes,    Routine Base: _TEXT + 0197

021B				freopen_:
021B  51				push		ecx
021C  56				push		esi
021D  57				push		edi
021E  55				push		ebp
021F  89 C7				mov		edi,eax
0221  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0224  89 F0				mov		eax,esi
0226  FF 15 00 00 00 00			call		dword ptr __AccessFileH
022C  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsRemoveWindowedHandle,0x00000000
0233  74 08				je		L$32
0235  89 F0				mov		eax,esi
0237  FF 15 00 00 00 00			call		dword ptr __WindowsRemoveWindowedHandle
023D				L$32:
023D  89 D8				mov		eax,ebx
023F  E8 00 00 00 00			call		close_file_
0244  89 C1				mov		ecx,eax
0246  89 C3				mov		ebx,eax
0248  85 C0				test		eax,eax
024A  74 17				je		L$33
024C  8B 68 0C				mov		ebp,dword ptr 0xc[eax]
024F  81 E5 00 40 00 00			and		ebp,0x00004000
0255  31 CB				xor		ebx,ecx
0257  89 68 0C				mov		dword ptr 0xc[eax],ebp
025A  89 F8				mov		eax,edi
025C  E8 00 00 00 00			call		__doopen_
0261  89 C3				mov		ebx,eax
0263				L$33:
0263  89 F0				mov		eax,esi
0265  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
026B  89 D8				mov		eax,ebx
026D  5D				pop		ebp
026E  5F				pop		edi
026F  5E				pop		esi
0270  59				pop		ecx
0271  C3				ret		

Routine Size: 87 bytes,    Routine Base: _TEXT + 021B

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

