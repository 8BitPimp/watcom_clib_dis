Module: fopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000002DE bytes
0000				__open_flags:
0000  53				push		ebx
0001  56				push		esi
0002  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0006  31 C0				xor		eax,eax
0008  8A 06				mov		al,byte ptr [esi]
000A  50				push		eax
000B  31 DB				xor		ebx,ebx
000D  E8 00 00 00 00			call		tolower
0012  83 C4 04				add		esp,0x00000004
0015  88 C1				mov		cl,al
0017  3C 72				cmp		al,0x72
0019  74 17				je		L$1
001B  3C 77				cmp		al,0x77
001D  74 13				je		L$1
001F  3C 61				cmp		al,0x61
0021  74 0F				je		L$1
0023  6A 09				push		0x00000009
0025  E8 00 00 00 00			call		__set_errno
002A  83 C4 04				add		esp,0x00000004
002D  31 C0				xor		eax,eax
002F  5E				pop		esi
0030  5B				pop		ebx
0031  C3				ret		
0032				L$1:
0032  89 D8				mov		eax,ebx
0034  8A 56 01				mov		dl,byte ptr 0x1[esi]
0037  0C 03				or		al,0x03
0039  80 FA 2B				cmp		dl,0x2b
003C  75 21				jne		L$4
003E  89 C3				mov		ebx,eax
0040  8A 56 02				mov		dl,byte ptr 0x2[esi]
0043  0C 40				or		al,0x40
0045  80 FA 62				cmp		dl,0x62
0048  74 11				je		L$3
004A  80 FA 74				cmp		dl,0x74
004D  74 45				je		L$8
004F  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr _fmode,0x00000200
0059				L$2:
0059  75 39				jne		L$8
005B				L$3:
005B  89 C3				mov		ebx,eax
005D  EB 35				jmp		L$8
005F				L$4:
005F  89 DA				mov		edx,ebx
0061  8A 6E 01				mov		ch,byte ptr 0x1[esi]
0064  80 CA 40				or		dl,0x40
0067  80 FD 62				cmp		ch,0x62
006A  75 0F				jne		L$5
006C  8A 6E 02				mov		ch,byte ptr 0x2[esi]
006F  89 D3				mov		ebx,edx
0071  80 FD 2B				cmp		ch,0x2b
0074  75 1E				jne		L$8
0076  80 CA 03				or		dl,0x03
0079  EB 17				jmp		L$7
007B				L$5:
007B  80 FD 74				cmp		ch,0x74
007E  75 06				jne		L$6
0080  80 7E 02 2B			cmp		byte ptr 0x2[esi],0x2b
0084  EB D3				jmp		L$2
0086				L$6:
0086  81 3D 00 00 00 00 00 02 00 00
					cmp		dword ptr _fmode,0x00000200
0090  75 02				jne		L$8
0092				L$7:
0092  89 D3				mov		ebx,edx
0094				L$8:
0094  80 F9 77				cmp		cl,0x77
0097  75 08				jne		L$9
0099  80 CB 02				or		bl,0x02
009C  89 D8				mov		eax,ebx
009E  5E				pop		esi
009F  5B				pop		ebx
00A0  C3				ret		
00A1				L$9:
00A1  80 F9 61				cmp		cl,0x61
00A4  75 08				jne		L$10
00A6  80 CB 82				or		bl,0x82
00A9  89 D8				mov		eax,ebx
00AB  5E				pop		esi
00AC  5B				pop		ebx
00AD  C3				ret		
00AE				L$10:
00AE  80 CB 01				or		bl,0x01
00B1  89 D8				mov		eax,ebx
00B3  5E				pop		esi
00B4  5B				pop		ebx
00B5  C3				ret		
00B6				__doopen:
00B6  53				push		ebx
00B7  56				push		esi
00B8  57				push		edi
00B9  55				push		ebp
00BA  83 EC 04				sub		esp,0x00000004
00BD  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
00C1  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
00C4  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
00C8  80 E4 FC				and		ah,0xfc
00CB  52				push		edx
00CC  88 63 0C				mov		byte ptr 0xc[ebx],ah
00CF  E8 00 00 00 00			call		__open_flags
00D4  83 C4 04				add		esp,0x00000004
00D7  8B 4B 0C				mov		ecx,dword ptr 0xc[ebx]
00DA  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
00DE  09 C1				or		ecx,eax
00E0  31 C0				xor		eax,eax
00E2  89 4B 0C				mov		dword ptr 0xc[ebx],ecx
00E5  8A 02				mov		al,byte ptr [edx]
00E7  50				push		eax
00E8  E8 00 00 00 00			call		tolower
00ED  83 C4 04				add		esp,0x00000004
00F0  88 04 24				mov		byte ptr [esp],al
00F3  3C 72				cmp		al,0x72
00F5  75 2C				jne		L$14
00F7  8A 6B 0C				mov		ch,byte ptr 0xc[ebx]
00FA  31 C0				xor		eax,eax
00FC  F6 C5 02				test		ch,0x02
00FF  74 05				je		L$11
0101  B8 02 00 00 00			mov		eax,0x00000002
0106				L$11:
0106  F6 43 0C 40			test		byte ptr 0xc[ebx],0x40
010A  74 05				je		L$12
010C  80 CC 02				or		ah,0x02
010F  EB 03				jmp		L$13
0111				L$12:
0111  80 CC 01				or		ah,0x01
0114				L$13:
0114  6A 00				push		0x00000000
0116  8B 6C 24 24			mov		ebp,dword ptr 0x24[esp]
011A  55				push		ebp
011B  50				push		eax
011C  8B 44 24 24			mov		eax,dword ptr 0x24[esp]
0120  50				push		eax
0121  EB 3B				jmp		L$19
0123				L$14:
0123  F6 43 0C 01			test		byte ptr 0xc[ebx],0x01
0127  0F 95 C0				setne		al
012A  25 FF 00 00 00			and		eax,0x000000ff
012F  8A 34 24				mov		dh,byte ptr [esp]
0132  83 C0 21				add		eax,0x00000021
0135  80 FE 61				cmp		dh,0x61
0138  75 04				jne		L$15
013A  0C 10				or		al,0x10
013C  EB 02				jmp		L$16
013E				L$15:
013E  0C 40				or		al,0x40
0140				L$16:
0140  F6 43 0C 40			test		byte ptr 0xc[ebx],0x40
0144  74 05				je		L$17
0146  80 CC 02				or		ah,0x02
0149  EB 03				jmp		L$18
014B				L$17:
014B  80 CC 01				or		ah,0x01
014E				L$18:
014E  68 80 01 00 00			push		0x00000180
0153  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0157  56				push		esi
0158  50				push		eax
0159  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
015D  57				push		edi
015E				L$19:
015E  E8 00 00 00 00			call		sopen
0163  83 C4 10				add		esp,0x00000010
0166  89 43 10				mov		dword ptr 0x10[ebx],eax
0169  83 7B 10 FF			cmp		dword ptr 0x10[ebx],0xffffffff
016D  75 0D				jne		L$20
016F  53				push		ebx
0170  E8 00 00 00 00			call		__freefp
0175  83 C4 04				add		esp,0x00000004
0178  31 C0				xor		eax,eax
017A  EB 35				jmp		L$22
017C				L$20:
017C  C7 43 04 00 00 00 00		mov		dword ptr 0x4[ebx],0x00000000
0183  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
018A  8A 34 24				mov		dh,byte ptr [esp]
018D  C7 43 14 00 00 00 00		mov		dword ptr 0x14[ebx],0x00000000
0194  80 FE 61				cmp		dh,0x61
0197  75 0D				jne		L$21
0199  6A 02				push		0x00000002
019B  6A 00				push		0x00000000
019D  53				push		ebx
019E  E8 00 00 00 00			call		fseek
01A3  83 C4 0C				add		esp,0x0000000c
01A6				L$21:
01A6  53				push		ebx
01A7  E8 00 00 00 00			call		__chktty
01AC  83 C4 04				add		esp,0x00000004
01AF  89 D8				mov		eax,ebx
01B1				L$22:
01B1  83 C4 04				add		esp,0x00000004
01B4  5D				pop		ebp
01B5  5F				pop		edi
01B6  5E				pop		esi
01B7  5B				pop		ebx
01B8  C3				ret		

Routine Size: 441 bytes,    Routine Base: _TEXT + 0000

01B9				_fsopen:
01B9  53				push		ebx
01BA  6A 00				push		0x00000000
01BC  E8 00 00 00 00			call		__allocfp
01C1  83 C4 04				add		esp,0x00000004
01C4  89 C2				mov		edx,eax
01C6  85 C0				test		eax,eax
01C8  74 1A				je		L$23
01CA  50				push		eax
01CB  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
01CF  52				push		edx
01D0  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
01D4  53				push		ebx
01D5  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
01D9  51				push		ecx
01DA  E8 00 00 00 00			call		__doopen
01DF  83 C4 10				add		esp,0x00000010
01E2  89 C2				mov		edx,eax
01E4				L$23:
01E4  89 D0				mov		eax,edx
01E6  5B				pop		ebx
01E7  C3				ret		

Routine Size: 47 bytes,    Routine Base: _TEXT + 01B9

01E8				fopen:
01E8  53				push		ebx
01E9  6A 00				push		0x00000000
01EB  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
01EF  52				push		edx
01F0  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
01F4  53				push		ebx
01F5  E8 00 00 00 00			call		_fsopen
01FA  83 C4 0C				add		esp,0x0000000c
01FD  5B				pop		ebx
01FE  C3				ret		
01FF				close_file:
01FF  53				push		ebx
0200  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0204  FF 15 00 00 00 00			call		dword ptr _AccessIOB
020A  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
020F				L$24:
020F  85 C0				test		eax,eax
0211  74 26				je		L$27
0213  8B 50 04				mov		edx,dword ptr 0x4[eax]
0216  39 D3				cmp		ebx,edx
0218  75 1B				jne		L$26
021A  F6 42 0C 03			test		byte ptr 0xc[edx],0x03
021E  74 0B				je		L$25
0220  6A 01				push		0x00000001
0222  52				push		edx
0223  E8 00 00 00 00			call		__doclose
0228  83 C4 08				add		esp,0x00000008
022B				L$25:
022B  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
0231  89 D8				mov		eax,ebx
0233  5B				pop		ebx
0234  C3				ret		
0235				L$26:
0235  8B 00				mov		eax,dword ptr [eax]
0237  EB D6				jmp		L$24
0239				L$27:
0239  BA 00 00 00 00			mov		edx,offset __ClosedStreams
023E				L$28:
023E  8B 02				mov		eax,dword ptr [edx]
0240  85 C0				test		eax,eax
0242  74 1C				je		L$30
0244  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0247  75 13				jne		L$29
0249  8B 08				mov		ecx,dword ptr [eax]
024B  89 0A				mov		dword ptr [edx],ecx
024D  8B 15 00 00 00 00			mov		edx,dword ptr __OpenStreams
0253  A3 00 00 00 00			mov		dword ptr __OpenStreams,eax
0258  89 10				mov		dword ptr [eax],edx
025A  EB CF				jmp		L$25
025C				L$29:
025C  89 C2				mov		edx,eax
025E  EB DE				jmp		L$28
0260				L$30:
0260  6A 04				push		0x00000004
0262  E8 00 00 00 00			call		__set_errno
0267  83 C4 04				add		esp,0x00000004
026A  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
0270  31 C0				xor		eax,eax
0272  5B				pop		ebx
0273  C3				ret		

Routine Size: 140 bytes,    Routine Base: _TEXT + 01E8

0274				freopen:
0274  53				push		ebx
0275  56				push		esi
0276  57				push		edi
0277  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
027B  8B 73 10				mov		esi,dword ptr 0x10[ebx]
027E  56				push		esi
027F  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0285  8B 15 00 00 00 00			mov		edx,dword ptr _WindowsRemoveWindowedHandle
028B  83 C4 04				add		esp,0x00000004
028E  85 D2				test		edx,edx
0290  74 0A				je		L$31
0292  56				push		esi
0293  FF 15 00 00 00 00			call		dword ptr _WindowsRemoveWindowedHandle
0299  83 C4 04				add		esp,0x00000004
029C				L$31:
029C  53				push		ebx
029D  E8 00 00 00 00			call		close_file
02A2  83 C4 04				add		esp,0x00000004
02A5  89 C3				mov		ebx,eax
02A7  85 C0				test		eax,eax
02A9  74 23				je		L$32
02AB  50				push		eax
02AC  6A 00				push		0x00000000
02AE  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
02B2  8B 58 0C				mov		ebx,dword ptr 0xc[eax]
02B5  51				push		ecx
02B6  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
02BA  81 E3 00 40 00 00			and		ebx,0x00004000
02C0  57				push		edi
02C1  89 58 0C				mov		dword ptr 0xc[eax],ebx
02C4  E8 00 00 00 00			call		__doopen
02C9  83 C4 10				add		esp,0x00000010
02CC  89 C3				mov		ebx,eax
02CE				L$32:
02CE  56				push		esi
02CF  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
02D5  83 C4 04				add		esp,0x00000004
02D8  89 D8				mov		eax,ebx
02DA  5F				pop		edi
02DB  5E				pop		esi
02DC  5B				pop		ebx
02DD  C3				ret		

Routine Size: 106 bytes,    Routine Base: _TEXT + 0274

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

