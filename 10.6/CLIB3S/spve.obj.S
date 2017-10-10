Module: spve
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000039B bytes
0000				__Slash_C:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006  C6 00 2F				mov		byte ptr [eax],0x2f
0009  C6 40 01 63			mov		byte ptr 0x1[eax],0x63
000D  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
0011  5D				pop		ebp
0012  C3				ret		
0013				file_exists:
0013  55				push		ebp
0014  89 E5				mov		ebp,esp
0016  6A 00				push		0x00000000
0018  FF 75 08				push		dword ptr 0x8[ebp]
001B  E8 00 00 00 00			call		access
0020  83 C4 08				add		esp,0x00000008
0023  85 C0				test		eax,eax
0025  0F 94 C0				sete		al
0028  0F B6 C0				movzx		eax,al
002B  5D				pop		ebp
002C  C3				ret		

Routine Size: 45 bytes,    Routine Base: _TEXT + 0000

002D				spawnve:
002D  68 DC 00 00 00			push		0x000000dc
0032  E8 00 00 00 00			call		__CHK
0037  53				push		ebx
0038  56				push		esi
0039  57				push		edi
003A  06				push		es
003B  C8 A8 00 00			enter		0x00a8,0x00
003F  83 ED 72				sub		ebp,0x00000072
0042  C6 45 6E 00			mov		byte ptr 0x6e[ebp],0x00
0046  83 BD 8A 00 00 00 02		cmp		dword ptr 0x8a[ebp],0x00000002
004D  72 11				jb		L$2
004F  6A 09				push		0x00000009
0051  E8 00 00 00 00			call		__set_errno
0056				L$1:
0056  B8 FF FF FF FF			mov		eax,0xffffffff
005B  E9 2F 03 00 00			jmp		L$22
0060				L$2:
0060  6A 00				push		0x00000000
0062  8D 45 4A				lea		eax,0x4a[ebp]
0065  50				push		eax
0066  8D 45 4E				lea		eax,0x4e[ebp]
0069  50				push		eax
006A  8D 45 52				lea		eax,0x52[ebp]
006D  50				push		eax
006E  8D 45 56				lea		eax,0x56[ebp]
0071  50				push		eax
0072  FF B5 96 00 00 00			push		dword ptr 0x96[ebp]
0078  FF B5 92 00 00 00			push		dword ptr 0x92[ebp]
007E  E8 00 00 00 00			call		__cenvarg
0083  83 C4 1C				add		esp,0x0000001c
0086  89 45 6A				mov		dword ptr 0x6a[ebp],eax
0089  83 F8 FF				cmp		eax,0xffffffff
008C  0F 84 00 03 00 00			je		L$23
0092  FF B5 8E 00 00 00			push		dword ptr 0x8e[ebp]
0098  E8 00 00 00 00			call		strlen
009D  83 C4 04				add		esp,0x00000004
00A0  8D B0 0E 01 00 00			lea		esi,0x10e[eax]
00A6  56				push		esi
00A7  E8 00 00 00 00			call		_nmalloc
00AC  83 C4 04				add		esp,0x00000004
00AF  89 45 5E				mov		dword ptr 0x5e[ebp],eax
00B2  85 C0				test		eax,eax
00B4  75 2C				jne		L$5
00B6  8D 5E 03				lea		ebx,0x3[esi]
00B9  80 E3 FC				and		bl,0xfc
00BC  E8 00 00 00 00			call		stackavail
00C1  39 C3				cmp		ebx,eax
00C3  73 08				jae		L$3
00C5  89 D8				mov		eax,ebx
00C7  29 C4				sub		esp,eax
00C9  89 E0				mov		eax,esp
00CB  EB 02				jmp		L$4
00CD				L$3:
00CD  31 C0				xor		eax,eax
00CF				L$4:
00CF  89 C3				mov		ebx,eax
00D1  85 C0				test		eax,eax
00D3  75 0F				jne		L$6
00D5  FF 75 56				push		dword ptr 0x56[ebp]
00D8  E8 00 00 00 00			call		free
00DD  E9 74 FF FF FF			jmp		L$1
00E2				L$5:
00E2  89 C3				mov		ebx,eax
00E4				L$6:
00E4  8D 45 36				lea		eax,0x36[ebp]
00E7  50				push		eax
00E8  8D 45 3A				lea		eax,0x3a[ebp]
00EB  50				push		eax
00EC  8D 45 3E				lea		eax,0x3e[ebp]
00EF  50				push		eax
00F0  8D 45 42				lea		eax,0x42[ebp]
00F3  50				push		eax
00F4  8D 86 F9 FE FF FF			lea		eax,-0x107[esi]
00FA  01 D8				add		eax,ebx
00FC  50				push		eax
00FD  FF B5 8E 00 00 00			push		dword ptr 0x8e[ebp]
0103  E8 00 00 00 00			call		_splitpath2
0108  83 C4 18				add		esp,0x00000018
010B  8D 45 CA				lea		eax,-0x36[ebp]
010E  50				push		eax
010F  FF 15 00 00 00 00			call		dword ptr __Save8087
0115  83 C4 04				add		esp,0x00000004
0118  FF 75 4A				push		dword ptr 0x4a[ebp]
011B  E8 00 00 00 00			call		_nmalloc
0120  83 C4 04				add		esp,0x00000004
0123  89 45 5A				mov		dword ptr 0x5a[ebp],eax
0126  85 C0				test		eax,eax
0128  75 4A				jne		L$9
012A  8B 45 4A				mov		eax,dword ptr 0x4a[ebp]
012D  83 C0 03				add		eax,0x00000003
0130  24 FC				and		al,0xfc
0132  89 C6				mov		esi,eax
0134  E8 00 00 00 00			call		stackavail
0139  39 C6				cmp		esi,eax
013B  73 0E				jae		L$7
013D  8B 45 4A				mov		eax,dword ptr 0x4a[ebp]
0140  83 C0 03				add		eax,0x00000003
0143  24 FC				and		al,0xfc
0145  29 C4				sub		esp,eax
0147  89 E0				mov		eax,esp
0149  EB 02				jmp		L$8
014B				L$7:
014B  31 C0				xor		eax,eax
014D				L$8:
014D  89 45 62				mov		dword ptr 0x62[ebp],eax
0150  85 C0				test		eax,eax
0152  75 23				jne		L$10
0154  6A 02				push		0x00000002
0156  E8 00 00 00 00			call		__set_errno
015B  83 C4 04				add		esp,0x00000004
015E  6A 0A				push		0x0000000a
0160  C7 45 6A FF FF FF FF		mov		dword ptr 0x6a[ebp],0xffffffff
0167  E8 00 00 00 00			call		__set_doserrno
016C  83 C4 04				add		esp,0x00000004
016F  E9 ED 01 00 00			jmp		L$21
0174				L$9:
0174  89 45 62				mov		dword ptr 0x62[ebp],eax
0177				L$10:
0177  FF 75 36				push		dword ptr 0x36[ebp]
017A  FF 75 3A				push		dword ptr 0x3a[ebp]
017D  FF 75 3E				push		dword ptr 0x3e[ebp]
0180  FF 75 42				push		dword ptr 0x42[ebp]
0183  53				push		ebx
0184  E8 00 00 00 00			call		_makepath
0189  83 C4 14				add		esp,0x00000014
018C  6A 01				push		0x00000001
018E  E8 00 00 00 00			call		__set_errno
0193  8B 45 36				mov		eax,dword ptr 0x36[ebp]
0196  83 C4 04				add		esp,0x00000004
0199  80 38 00				cmp		byte ptr [eax],0x00
019C  74 54				je		L$12
019E  68 00 00 00 00			push		offset DGROUP:L$24
01A3  50				push		eax
01A4  E8 00 00 00 00			call		stricmp
01A9  83 C4 08				add		esp,0x00000008
01AC  85 C0				test		eax,eax
01AE  75 1A				jne		L$11
01B0  53				push		ebx
01B1  C7 45 6A FF FF FF FF		mov		dword ptr 0x6a[ebp],0xffffffff
01B8  E8 00 00 00 00			call		file_exists
01BD  83 C4 04				add		esp,0x00000004
01C0  85 C0				test		eax,eax
01C2  0F 85 29 01 00 00			jne		L$18
01C8  EB 28				jmp		L$12
01CA				L$11:
01CA  6A 00				push		0x00000000
01CC  E8 00 00 00 00			call		__set_errno
01D1  83 C4 04				add		esp,0x00000004
01D4  FF B5 92 00 00 00			push		dword ptr 0x92[ebp]
01DA  FF 75 56				push		dword ptr 0x56[ebp]
01DD  FF 75 62				push		dword ptr 0x62[ebp]
01E0  53				push		ebx
01E1  FF B5 8A 00 00 00			push		dword ptr 0x8a[ebp]
01E7  E8 00 00 00 00			call		__dospawn
01EC  83 C4 14				add		esp,0x00000014
01EF  89 45 6A				mov		dword ptr 0x6a[ebp],eax
01F2				L$12:
01F2  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
01F8  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
01FC  74 10				je		L$13
01FE  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0204  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0208  0F 85 53 01 00 00			jne		L$21
020E				L$13:
020E  53				push		ebx
020F  E8 00 00 00 00			call		strlen
0214  8D 34 03				lea		esi,[ebx+eax]
0217  83 C4 04				add		esp,0x00000004
021A  89 75 66				mov		dword ptr 0x66[ebp],esi
021D  80 7D 6E 00			cmp		byte ptr 0x6e[ebp],0x00
0221  74 0C				je		L$14
0223  6A 01				push		0x00000001
0225  E8 00 00 00 00			call		__set_errno
022A  83 C4 04				add		esp,0x00000004
022D  EB 33				jmp		L$15
022F				L$14:
022F  1E				push		ds
0230  07				pop		es
0231  89 F7				mov		edi,esi
0233  BE 05 00 00 00			mov		esi,offset DGROUP:L$25
0238  6A 00				push		0x00000000
023A  A5				movsd		
023B  A4				movsb		
023C  E8 00 00 00 00			call		__set_errno
0241  83 C4 04				add		esp,0x00000004
0244  FF B5 92 00 00 00			push		dword ptr 0x92[ebp]
024A  FF 75 56				push		dword ptr 0x56[ebp]
024D  FF 75 62				push		dword ptr 0x62[ebp]
0250  53				push		ebx
0251  FF B5 8A 00 00 00			push		dword ptr 0x8a[ebp]
0257  E8 00 00 00 00			call		__dospawn
025C  83 C4 14				add		esp,0x00000014
025F  89 45 6A				mov		dword ptr 0x6a[ebp],eax
0262				L$15:
0262  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0268  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
026C  74 10				je		L$16
026E  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0274  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
0278  0F 85 E3 00 00 00			jne		L$21
027E				L$16:
027E  6A 00				push		0x00000000
0280  8B 7D 66				mov		edi,dword ptr 0x66[ebp]
0283  E8 00 00 00 00			call		__set_errno
0288  83 C4 04				add		esp,0x00000004
028B  1E				push		ds
028C  07				pop		es
028D  BE 0A 00 00 00			mov		esi,offset DGROUP:L$26
0292  FF B5 92 00 00 00			push		dword ptr 0x92[ebp]
0298  A5				movsd		
0299  A4				movsb		
029A  FF 75 56				push		dword ptr 0x56[ebp]
029D  FF 75 62				push		dword ptr 0x62[ebp]
02A0  53				push		ebx
02A1  FF B5 8A 00 00 00			push		dword ptr 0x8a[ebp]
02A7  E8 00 00 00 00			call		__dospawn
02AC  83 C4 14				add		esp,0x00000014
02AF  89 45 6A				mov		dword ptr 0x6a[ebp],eax
02B2  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
02B8  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
02BC  74 10				je		L$17
02BE  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
02C4  83 78 04 09			cmp		dword ptr 0x4[eax],0x00000009
02C8  0F 85 93 00 00 00			jne		L$21
02CE				L$17:
02CE  6A 00				push		0x00000000
02D0  8B 7D 66				mov		edi,dword ptr 0x66[ebp]
02D3  E8 00 00 00 00			call		__set_errno
02D8  83 C4 04				add		esp,0x00000004
02DB  1E				push		ds
02DC  07				pop		es
02DD  BE 00 00 00 00			mov		esi,offset DGROUP:L$24
02E2  53				push		ebx
02E3  A5				movsd		
02E4  A4				movsb		
02E5  E8 00 00 00 00			call		file_exists
02EA  83 C4 04				add		esp,0x00000004
02ED  85 C0				test		eax,eax
02EF  74 70				je		L$21
02F1				L$18:
02F1  FF 75 56				push		dword ptr 0x56[ebp]
02F4  E8 00 00 00 00			call		free
02F9  83 C4 04				add		esp,0x00000004
02FC  6A 01				push		0x00000001
02FE  FF 75 62				push		dword ptr 0x62[ebp]
0301  FF B5 92 00 00 00			push		dword ptr 0x92[ebp]
0307  53				push		ebx
0308  C7 45 56 00 00 00 00		mov		dword ptr 0x56[ebp],0x00000000
030F  E8 00 00 00 00			call		__ccmdline
0314  83 C4 10				add		esp,0x00000010
0317  6A 00				push		0x00000000
0319  FF 75 62				push		dword ptr 0x62[ebp]
031C  53				push		ebx
031D  0F B6 45 6E			movzx		eax,byte ptr 0x6e[ebp]
0321  50				push		eax
0322  8D 45 46				lea		eax,0x46[ebp]
0325  50				push		eax
0326  E8 00 00 00 00			call		__Slash_C
032B  83 C4 08				add		esp,0x00000008
032E  50				push		eax
032F  80 7D 6E 00			cmp		byte ptr 0x6e[ebp],0x00
0333  74 07				je		L$19
0335  B8 17 00 00 00			mov		eax,offset DGROUP:L$28
033A  EB 05				jmp		L$20
033C				L$19:
033C  B8 1B 00 00 00			mov		eax,offset DGROUP:L$29
0341				L$20:
0341  50				push		eax
0342  68 0F 00 00 00			push		offset DGROUP:L$27
0347  E8 00 00 00 00			call		getenv
034C  83 C4 04				add		esp,0x00000004
034F  50				push		eax
0350  FF B5 8A 00 00 00			push		dword ptr 0x8a[ebp]
0356  E8 00 00 00 00			call		spawnl
035B  83 C4 1C				add		esp,0x0000001c
035E  89 45 6A				mov		dword ptr 0x6a[ebp],eax
0361				L$21:
0361  FF 75 5A				push		dword ptr 0x5a[ebp]
0364  E8 00 00 00 00			call		_nfree
0369  83 C4 04				add		esp,0x00000004
036C  FF 75 5E				push		dword ptr 0x5e[ebp]
036F  E8 00 00 00 00			call		_nfree
0374  83 C4 04				add		esp,0x00000004
0377  FF 75 56				push		dword ptr 0x56[ebp]
037A  E8 00 00 00 00			call		free
037F  83 C4 04				add		esp,0x00000004
0382  8D 45 CA				lea		eax,-0x36[ebp]
0385  50				push		eax
0386  FF 15 00 00 00 00			call		dword ptr __Rest8087
038C  8B 45 6A				mov		eax,dword ptr 0x6a[ebp]
038F				L$22:
038F  83 C4 04				add		esp,0x00000004
0392				L$23:
0392  8D 65 72				lea		esp,0x72[ebp]
0395  5D				pop		ebp
0396  07				pop		es
0397  5F				pop		edi
0398  5E				pop		esi
0399  5B				pop		ebx
039A  C3				ret		

Routine Size: 878 bytes,    Routine Base: _TEXT + 002D

No disassembly errors

Segment: CONST DWORD USE32 00000023 bytes
0000				L$24:
0000  2E 62 61 74 00                                  .bat.
0005				L$25:
0005  2E 63 6F 6D 00                                  .com.
000A				L$26:
000A  2E 65 78 65 00                                  .exe.
000F				L$27:
000F  43 4F 4D 53 50 45 43 00                         COMSPEC.
0017				L$28:
0017  43 4D 44 00                                     CMD.
001B				L$29:
001B  43 4F 4D 4D 41 4E 44 00                         COMMAND.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

