Module: ustrftim
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000367 bytes
0000				TwoDigits:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0007  8B 45 10				mov		eax,dword ptr 0x10[ebp]
000A  B9 0A 00 00 00			mov		ecx,0x0000000a
000F  99				cdq		
0010  F7 F9				idiv		ecx
0012  83 C0 30				add		eax,0x00000030
0015  66 89 03				mov		word ptr [ebx],ax
0018  8B 45 10				mov		eax,dword ptr 0x10[ebp]
001B  99				cdq		
001C  F7 F9				idiv		ecx
001E  66 C7 43 04 00 00			mov		word ptr 0x4[ebx],0x0000
0024  83 C2 30				add		edx,0x00000030
0027  66 89 53 02			mov		word ptr 0x2[ebx],dx
002B  5D				pop		ebp
002C  5B				pop		ebx
002D  C3				ret		
002E				L$1:
002E  54 53 52 4F 4D 4B 49 48 45 43 3F 3E 3D 3C 35 34 TSROMKIHEC?>=<54
003E  33 32 30 2F 2E 28 24 23 1F 1D 1C 00             320/.($#....
004A				L$2:
004A  D6 02 00 00                                     DD	offset L$40
004E  D6 02 00 00                                     DD	offset L$40
0052  31 01 00 00                                     DD	offset L$7
0056  4D 01 00 00                                     DD	offset L$10
005A  9F 01 00 00                                     DD	offset L$15
005E  A6 01 00 00                                     DD	offset L$16
0062  AE 01 00 00                                     DD	offset L$17
0066  EF 01 00 00                                     DD	offset L$22
006A  28 02 00 00                                     DD	offset L$27
006E  91 02 00 00                                     DD	offset L$36
0072  38 02 00 00                                     DD	offset L$29
0076  66 02 00 00                                     DD	offset L$34
007A  91 02 00 00                                     DD	offset L$36
007E  A9 02 00 00                                     DD	offset L$38
0082  C2 02 00 00                                     DD	offset L$39
0086  1C 01 00 00                                     DD	offset L$5
008A  43 01 00 00                                     DD	offset L$9
008E  59 01 00 00                                     DD	offset L$11
0092  97 01 00 00                                     DD	offset L$14
0096  43 01 00 00                                     DD	offset L$9
009A  CB 01 00 00                                     DD	offset L$19
009E  E9 01 00 00                                     DD	offset L$21
00A2  F4 01 00 00                                     DD	offset L$23
00A6  0A 02 00 00                                     DD	offset L$25
00AA  00 02 00 00                                     DD	offset L$24
00AE  2C 02 00 00                                     DD	offset L$28
00B2  5B 02 00 00                                     DD	offset L$33
00B6  87 02 00 00                                     DD	offset L$35
00BA  9B 02 00 00                                     DD	offset L$37

Routine Size: 190 bytes,    Routine Base: _TEXT + 0000

00BE				_ustrftime:
00BE  53				push		ebx
00BF  56				push		esi
00C0  57				push		edi
00C1  C8 5C 00 00			enter		0x005c,0x00
00C5  8B 75 1C				mov		esi,dword ptr 0x1c[ebp]
00C8  8B 5D 20				mov		ebx,dword ptr 0x20[ebp]
00CB  C7 45 F0 00 00 00 00		mov		dword ptr -0x10[ebp],0x00000000
00D2  8B 45 18				mov		eax,dword ptr 0x18[ebp]
00D5  C7 45 F4 00 00 00 00		mov		dword ptr -0xc[ebp],0x00000000
00DC  89 45 F8				mov		dword ptr -0x8[ebp],eax
00DF  E9 8B 00 00 00			jmp		L$13
00E4				L$3:
00E4  66 83 3E 25			cmp		word ptr [esi],0x0025
00E8  74 08				je		L$4
00EA  66 8B 06				mov		ax,word ptr [esi]
00ED  E9 E7 01 00 00			jmp		L$41
00F2				L$4:
00F2  46				inc		esi
00F3  46				inc		esi
00F4  66 8B 06				mov		ax,word ptr [esi]
00F7  83 E8 25				sub		eax,0x00000025
00FA  66 3D 54 00			cmp		ax,0x0054
00FE  0F 87 D2 01 00 00			ja		L$40
0104  B9 1D 00 00 00			mov		ecx,0x0000001d
0109  BF 2E 00 00 00			mov		edi,offset L$1
010E  06				push		es
010F  0E				push		cs
0110  07				pop		es
0111  F2 AE				repne scasb	
0113  07				pop		es
0114  2E FF 24 8D 4A 00 00 00		jmp		dword ptr cs:L$2[ecx*4]
011C				L$5:
011C  8B 43 18				mov		eax,dword ptr 0x18[ebx]
011F  BA 00 00 00 00			mov		edx,offset awday_name
0124				L$6:
0124  C1 E0 02				shl		eax,0x02
0127  01 C2				add		edx,eax
0129  89 55 FC				mov		dword ptr -0x4[ebp],edx
012C  E9 B2 01 00 00			jmp		L$42
0131				L$7:
0131  8B 43 18				mov		eax,dword ptr 0x18[ebx]
0134  8B 04 85 00 00 00 00		mov		eax,dword ptr wday_name[eax*4]
013B				L$8:
013B  89 45 FC				mov		dword ptr -0x4[ebp],eax
013E  E9 A0 01 00 00			jmp		L$42
0143				L$9:
0143  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0146  BA 00 00 00 00			mov		edx,offset amon_name
014B  EB D7				jmp		L$6
014D				L$10:
014D  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0150  8B 04 85 00 00 00 00		mov		eax,dword ptr mon_name[eax*4]
0157  EB E2				jmp		L$8
0159				L$11:
0159  68 8F 00 00 00			push		offset DGROUP:L$68
015E				L$12:
015E  8D 45 A4				lea		eax,-0x5c[ebp]
0161  50				push		eax
0162  89 75 F4				mov		dword ptr -0xc[ebp],esi
0165  E8 00 00 00 00			call		_atouni
016A  83 C4 08				add		esp,0x00000008
016D  89 C6				mov		esi,eax
016F				L$13:
016F  8D 45 E0				lea		eax,-0x20[ebp]
0172  89 45 FC				mov		dword ptr -0x4[ebp],eax
0175  66 83 3E 00			cmp		word ptr [esi],0x0000
0179  0F 85 65 FF FF FF			jne		L$3
017F  83 7D F4 00			cmp		dword ptr -0xc[ebp],0x00000000
0183  0F 84 BD 01 00 00			je		L$47
0189  8B 75 F4				mov		esi,dword ptr -0xc[ebp]
018C  C7 45 F4 00 00 00 00		mov		dword ptr -0xc[ebp],0x00000000
0193  46				inc		esi
0194  46				inc		esi
0195  EB D8				jmp		L$13
0197				L$14:
0197  FF 73 0C				push		dword ptr 0xc[ebx]
019A  E9 AB 00 00 00			jmp		L$32
019F				L$15:
019F  68 A4 00 00 00			push		offset DGROUP:L$69
01A4  EB B8				jmp		L$12
01A6				L$16:
01A6  FF 73 08				push		dword ptr 0x8[ebx]
01A9  E9 9C 00 00 00			jmp		L$32
01AE				L$17:
01AE  8B 43 08				mov		eax,dword ptr 0x8[ebx]
01B1  83 F8 0C				cmp		eax,0x0000000c
01B4  7E 03				jle		L$18
01B6  83 E8 0C				sub		eax,0x0000000c
01B9				L$18:
01B9  85 C0				test		eax,eax
01BB  0F 85 88 00 00 00			jne		L$31
01C1  B8 0C 00 00 00			mov		eax,0x0000000c
01C6  E9 7E 00 00 00			jmp		L$31
01CB				L$19:
01CB  6A 0A				push		0x0000000a
01CD  8D 45 E0				lea		eax,-0x20[ebp]
01D0  50				push		eax
01D1  8B 43 1C				mov		eax,dword ptr 0x1c[ebx]
01D4  83 C0 65				add		eax,0x00000065
01D7  50				push		eax
01D8  E8 00 00 00 00			call		_uitoa
01DD  66 FF 4D E0			dec		word ptr -0x20[ebp]
01E1				L$20:
01E1  83 C4 0C				add		esp,0x0000000c
01E4  E9 FA 00 00 00			jmp		L$42
01E9				L$21:
01E9  8B 43 10				mov		eax,dword ptr 0x10[ebx]
01EC  40				inc		eax
01ED  EB 5A				jmp		L$31
01EF				L$22:
01EF  FF 73 04				push		dword ptr 0x4[ebx]
01F2  EB 56				jmp		L$32
01F4				L$23:
01F4  C7 45 FC AD 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$70
01FB  E9 E3 00 00 00			jmp		L$42
0200				L$24:
0200  68 AF 00 00 00			push		offset DGROUP:L$71
0205  E9 54 FF FF FF			jmp		L$12
020A				L$25:
020A  83 7B 08 0C			cmp		dword ptr 0x8[ebx],0x0000000c
020E  7D 0C				jge		L$26
0210  C7 45 FC BB 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$72
0217  E9 C7 00 00 00			jmp		L$42
021C				L$26:
021C  C7 45 FC BE 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$73
0223  E9 BB 00 00 00			jmp		L$42
0228				L$27:
0228  FF 33				push		dword ptr [ebx]
022A  EB 1E				jmp		L$32
022C				L$28:
022C  C7 45 FC C1 00 00 00		mov		dword ptr -0x4[ebp],offset DGROUP:L$74
0233  E9 AB 00 00 00			jmp		L$42
0238				L$29:
0238  8B 43 1C				mov		eax,dword ptr 0x1c[ebx]
023B  83 C0 07				add		eax,0x00000007
023E  2B 43 18				sub		eax,dword ptr 0x18[ebx]
0241  BF 07 00 00 00			mov		edi,0x00000007
0246				L$30:
0246  99				cdq		
0247  F7 FF				idiv		edi
0249				L$31:
0249  50				push		eax
024A				L$32:
024A  8D 45 E0				lea		eax,-0x20[ebp]
024D  50				push		eax
024E  E8 00 00 00 00			call		TwoDigits
0253  83 C4 08				add		esp,0x00000008
0256  E9 88 00 00 00			jmp		L$42
025B				L$33:
025B  66 8B 43 18			mov		ax,word ptr 0x18[ebx]
025F  05 30 00 00 00			add		eax,0x00000030
0264  EB 73				jmp		L$41
0266				L$34:
0266  8B 43 1C				mov		eax,dword ptr 0x1c[ebx]
0269  BF 07 00 00 00			mov		edi,0x00000007
026E  99				cdq		
026F  F7 FF				idiv		edi
0271  89 D0				mov		eax,edx
0273  2B 43 18				sub		eax,dword ptr 0x18[ebx]
0276  01 F8				add		eax,edi
0278  99				cdq		
0279  F7 FF				idiv		edi
027B  B8 06 00 00 00			mov		eax,0x00000006
0280  29 D0				sub		eax,edx
0282  03 43 1C				add		eax,dword ptr 0x1c[ebx]
0285  EB BF				jmp		L$30
0287				L$35:
0287  68 C3 00 00 00			push		offset DGROUP:L$75
028C  E9 CD FE FF FF			jmp		L$12
0291				L$36:
0291  68 D0 00 00 00			push		offset DGROUP:L$76
0296  E9 C3 FE FF FF			jmp		L$12
029B				L$37:
029B  8B 43 14				mov		eax,dword ptr 0x14[ebx]
029E  BF 64 00 00 00			mov		edi,0x00000064
02A3  99				cdq		
02A4  F7 FF				idiv		edi
02A6  52				push		edx
02A7  EB A1				jmp		L$32
02A9				L$38:
02A9  6A 0A				push		0x0000000a
02AB  8D 45 E0				lea		eax,-0x20[ebp]
02AE  50				push		eax
02AF  8B 43 14				mov		eax,dword ptr 0x14[ebx]
02B2  05 6C 07 00 00			add		eax,0x0000076c
02B7  50				push		eax
02B8  E8 00 00 00 00			call		_uitoa
02BD  E9 1F FF FF FF			jmp		L$20
02C2				L$39:
02C2  E8 00 00 00 00			call		tzset
02C7  8B 43 20				mov		eax,dword ptr 0x20[ebx]
02CA  8B 04 85 00 00 00 00		mov		eax,dword ptr tzname[eax*4]
02D1  E9 65 FE FF FF			jmp		L$8
02D6				L$40:
02D6  66 8B 06				mov		ax,word ptr [esi]
02D9				L$41:
02D9  66 C7 45 E2 00 00			mov		word ptr -0x1e[ebp],0x0000
02DF  66 89 45 E0			mov		word ptr -0x20[ebp],ax
02E3				L$42:
02E3  8D 45 E0				lea		eax,-0x20[ebp]
02E6  3B 45 FC				cmp		eax,dword ptr -0x4[ebp]
02E9  74 21				je		L$45
02EB				L$43:
02EB  8B 55 FC				mov		edx,dword ptr -0x4[ebp]
02EE  80 3A 00				cmp		byte ptr [edx],0x00
02F1  74 0E				je		L$44
02F3  66 0F B6 12			movzx		dx,byte ptr [edx]
02F7  FF 45 FC				inc		dword ptr -0x4[ebp]
02FA  66 89 10				mov		word ptr [eax],dx
02FD  40				inc		eax
02FE  40				inc		eax
02FF  EB EA				jmp		L$43
0301				L$44:
0301  66 C7 00 00 00			mov		word ptr [eax],0x0000
0306  8D 45 E0				lea		eax,-0x20[ebp]
0309  89 45 FC				mov		dword ptr -0x4[ebp],eax
030C				L$45:
030C  FF 75 FC				push		dword ptr -0x4[ebp]
030F  46				inc		esi
0310  46				inc		esi
0311  E8 00 00 00 00			call		_ustrlen
0316  83 C4 04				add		esp,0x00000004
0319  89 C7				mov		edi,eax
031B  3B 45 F8				cmp		eax,dword ptr -0x8[ebp]
031E  76 03				jbe		L$46
0320  8B 7D F8				mov		edi,dword ptr -0x8[ebp]
0323				L$46:
0323  8D 04 3F				lea		eax,[edi+edi]
0326  50				push		eax
0327  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
032A  01 C0				add		eax,eax
032C  FF 75 FC				push		dword ptr -0x4[ebp]
032F  03 45 14				add		eax,dword ptr 0x14[ebp]
0332  50				push		eax
0333  29 7D F8				sub		dword ptr -0x8[ebp],edi
0336  01 7D F0				add		dword ptr -0x10[ebp],edi
0339  E8 00 00 00 00			call		memcpy
033E  83 C4 0C				add		esp,0x0000000c
0341  E9 29 FE FF FF			jmp		L$13
0346				L$47:
0346  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
0349  3B 45 18				cmp		eax,dword ptr 0x18[ebp]
034C  73 12				jae		L$48
034E  01 C0				add		eax,eax
0350  03 45 14				add		eax,dword ptr 0x14[ebp]
0353  66 C7 00 00 00			mov		word ptr [eax],0x0000
0358  8B 45 F0				mov		eax,dword ptr -0x10[ebp]
035B  C9				leave		
035C  5F				pop		edi
035D  5E				pop		esi
035E  5B				pop		ebx
035F  C3				ret		
0360				L$48:
0360  31 C0				xor		eax,eax
0362  C9				leave		
0363  5F				pop		edi
0364  5E				pop		esi
0365  5B				pop		ebx
0366  C3				ret		

Routine Size: 681 bytes,    Routine Base: _TEXT + 00BE

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000				L$49:
0000  53 75 6E 64 61 79 00                            Sunday.
0007				L$50:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E				L$51:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016				L$52:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020				L$53:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029				L$54:
0029  46 72 69 64 61 79 00                            Friday.
0030				L$55:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039				L$56:
0039  4A 61 6E 75 61 72 79 00                         January.
0041				L$57:
0041  46 65 62 72 75 61 72 79 00                      February.
004A				L$58:
004A  4D 61 72 63 68 00                               March.
0050				L$59:
0050  41 70 72 69 6C 00                               April.
0056				L$60:
0056  4D 61 79 00                                     May.
005A				L$61:
005A  4A 75 6E 65 00                                  June.
005F				L$62:
005F  4A 75 6C 79 00                                  July.
0064				L$63:
0064  41 75 67 75 73 74 00                            August.
006B				L$64:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075				L$65:
0075  4F 63 74 6F 62 65 72 00                         October.
007D				L$66:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086				L$67:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F				L$68:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4				L$69:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD				L$70:
00AD  0A 00                                           ..
00AF				L$71:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB				L$72:
00BB  41 4D 00                                        AM.
00BE				L$73:
00BE  50 4D 00                                        PM.
00C1				L$74:
00C1  09 00                                           ..
00C3				L$75:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0				L$76:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000				awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C				wday_name:
001C  00 00 00 00                                     DD	offset DGROUP:L$49
0020  07 00 00 00                                     DD	offset DGROUP:L$50
0024  0E 00 00 00                                     DD	offset DGROUP:L$51
0028  16 00 00 00                                     DD	offset DGROUP:L$52
002C  20 00 00 00                                     DD	offset DGROUP:L$53
0030  29 00 00 00                                     DD	offset DGROUP:L$54
0034  30 00 00 00                                     DD	offset DGROUP:L$55
0038				amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068				mon_name:
0068  39 00 00 00                                     DD	offset DGROUP:L$56
006C  41 00 00 00                                     DD	offset DGROUP:L$57
0070  4A 00 00 00                                     DD	offset DGROUP:L$58
0074  50 00 00 00                                     DD	offset DGROUP:L$59
0078  56 00 00 00                                     DD	offset DGROUP:L$60
007C  5A 00 00 00                                     DD	offset DGROUP:L$61
0080  5F 00 00 00                                     DD	offset DGROUP:L$62
0084  64 00 00 00                                     DD	offset DGROUP:L$63
0088  6B 00 00 00                                     DD	offset DGROUP:L$64
008C  75 00 00 00                                     DD	offset DGROUP:L$65
0090  7D 00 00 00                                     DD	offset DGROUP:L$66
0094  86 00 00 00                                     DD	offset DGROUP:L$67

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

