Module: strftime
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000373 bytes
0000				TwoDigits:
0000  53				push		ebx
0001  56				push		esi
0002  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0006  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000A  BE 0A 00 00 00			mov		esi,0x0000000a
000F  89 DA				mov		edx,ebx
0011  89 D8				mov		eax,ebx
0013  C1 FA 1F				sar		edx,0x1f
0016  F7 FE				idiv		esi
0018  89 DA				mov		edx,ebx
001A  83 C0 30				add		eax,0x00000030
001D  C1 FA 1F				sar		edx,0x1f
0020  88 01				mov		byte ptr [ecx],al
0022  89 D8				mov		eax,ebx
0024  F7 FE				idiv		esi
0026  C6 41 02 00			mov		byte ptr 0x2[ecx],0x00
002A  83 C2 30				add		edx,0x00000030
002D  88 51 01				mov		byte ptr 0x1[ecx],dl
0030  5E				pop		esi
0031  5B				pop		ebx
0032  C3				ret		
0033  90				nop		
0034				L$1:
0034  79 78 77 74 72 70 6E 6D 6A 68 64 63 62 61 5A 59 yxwtrpnmjhdcbaZY
0044  58 57 55 54 53 4D 49 48 44 42 41 25             XWUTSMIHDBA%
0050				L$2:
0050  E8 02 00 00                                     DD	offset L$37
0054  E8 02 00 00                                     DD	offset L$37
0058  47 01 00 00                                     DD	offset L$7
005C  67 01 00 00                                     DD	offset L$9
0060  8A 01 00 00                                     DD	offset L$12
0064  98 01 00 00                                     DD	offset L$13
0068  9E 01 00 00                                     DD	offset L$14
006C  DF 01 00 00                                     DD	offset L$18
0070  27 02 00 00                                     DD	offset L$25
0074  9B 02 00 00                                     DD	offset L$33
0078  35 02 00 00                                     DD	offset L$27
007C  62 02 00 00                                     DD	offset L$31
0080  9B 02 00 00                                     DD	offset L$33
0084  BD 02 00 00                                     DD	offset L$35
0088  D7 02 00 00                                     DD	offset L$36
008C  36 01 00 00                                     DD	offset L$6
0090  56 01 00 00                                     DD	offset L$8
0094  76 01 00 00                                     DD	offset L$10
0098  84 01 00 00                                     DD	offset L$11
009C  56 01 00 00                                     DD	offset L$8
00A0  BB 01 00 00                                     DD	offset L$16
00A4  D9 01 00 00                                     DD	offset L$17
00A8  F5 01 00 00                                     DD	offset L$21
00AC  0D 02 00 00                                     DD	offset L$23
00B0  FF 01 00 00                                     DD	offset L$22
00B4  2B 02 00 00                                     DD	offset L$26
00B8  4F 02 00 00                                     DD	offset L$30
00BC  8D 02 00 00                                     DD	offset L$32
00C0  A9 02 00 00                                     DD	offset L$34

Routine Size: 196 bytes,    Routine Base: _TEXT + 0000

00C4				strftime:
00C4  53				push		ebx
00C5  56				push		esi
00C6  57				push		edi
00C7  55				push		ebp
00C8  83 EC 14				sub		esp,0x00000014
00CB  8B 6C 24 30			mov		ebp,dword ptr 0x30[esp]
00CF  8B 5C 24 34			mov		ebx,dword ptr 0x34[esp]
00D3  31 D2				xor		edx,edx
00D5  8B 44 24 2C			mov		eax,dword ptr 0x2c[esp]
00D9  89 54 24 08			mov		dword ptr 0x8[esp],edx
00DD  89 44 24 0C			mov		dword ptr 0xc[esp],eax
00E1  89 54 24 10			mov		dword ptr 0x10[esp],edx
00E5				L$3:
00E5  8A 65 00				mov		ah,byte ptr [ebp]
00E8  89 E6				mov		esi,esp
00EA  84 E4				test		ah,ah
00EC  75 17				jne		L$4
00EE  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
00F2  85 FF				test		edi,edi
00F4  0F 84 54 02 00 00			je		L$40
00FA  31 C0				xor		eax,eax
00FC  8D 6F 01				lea		ebp,0x1[edi]
00FF  89 44 24 10			mov		dword ptr 0x10[esp],eax
0103  EB E0				jmp		L$3
0105				L$4:
0105  80 FC 25				cmp		ah,0x25
0108  74 10				je		L$5
010A  88 E0				mov		al,ah
010C  30 E0				xor		al,ah
010E  88 24 24				mov		byte ptr [esp],ah
0111  88 44 24 01			mov		byte ptr 0x1[esp],al
0115  E9 DA 01 00 00			jmp		L$38
011A				L$5:
011A  45				inc		ebp
011B  B9 1D 00 00 00			mov		ecx,0x0000001d
0120  BF 34 00 00 00			mov		edi,offset L$1
0125  8A 45 00				mov		al,byte ptr [ebp]
0128  06				push		es
0129  0E				push		cs
012A  07				pop		es
012B  F2 AE				repne scasb	
012D  07				pop		es
012E  2E FF 24 8D 50 00 00 00		jmp		dword ptr cs:L$2[ecx*4]
0136				L$6:
0136  8B 73 18				mov		esi,dword ptr 0x18[ebx]
0139  C1 E6 02				shl		esi,0x02
013C  81 C6 00 00 00 00			add		esi,offset awday_name
0142  E9 AD 01 00 00			jmp		L$38
0147				L$7:
0147  8B 73 18				mov		esi,dword ptr 0x18[ebx]
014A  8B 34 B5 00 00 00 00		mov		esi,dword ptr wday_name[esi*4]
0151  E9 9E 01 00 00			jmp		L$38
0156				L$8:
0156  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0159  C1 E6 02				shl		esi,0x02
015C  81 C6 00 00 00 00			add		esi,offset amon_name
0162  E9 8D 01 00 00			jmp		L$38
0167				L$9:
0167  8B 73 10				mov		esi,dword ptr 0x10[ebx]
016A  8B 34 B5 00 00 00 00		mov		esi,dword ptr mon_name[esi*4]
0171  E9 7E 01 00 00			jmp		L$38
0176				L$10:
0176  89 6C 24 10			mov		dword ptr 0x10[esp],ebp
017A  BD 8F 00 00 00			mov		ebp,offset DGROUP:L$62
017F  E9 61 FF FF FF			jmp		L$3
0184				L$11:
0184  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
0187  57				push		edi
0188  EB 59				jmp		L$20
018A				L$12:
018A  89 6C 24 10			mov		dword ptr 0x10[esp],ebp
018E  BD A4 00 00 00			mov		ebp,offset DGROUP:L$63
0193  E9 4D FF FF FF			jmp		L$3
0198				L$13:
0198  8B 4B 08				mov		ecx,dword ptr 0x8[ebx]
019B  51				push		ecx
019C  EB 45				jmp		L$20
019E				L$14:
019E  8B 43 08				mov		eax,dword ptr 0x8[ebx]
01A1  83 F8 0C				cmp		eax,0x0000000c
01A4  7E 03				jle		L$15
01A6  83 E8 0C				sub		eax,0x0000000c
01A9				L$15:
01A9  85 C0				test		eax,eax
01AB  0F 85 9B 00 00 00			jne		L$29
01B1  B8 0C 00 00 00			mov		eax,0x0000000c
01B6  E9 91 00 00 00			jmp		L$29
01BB				L$16:
01BB  6A 0A				push		0x0000000a
01BD  8D 44 24 04			lea		eax,0x4[esp]
01C1  50				push		eax
01C2  8B 43 1C				mov		eax,dword ptr 0x1c[ebx]
01C5  83 C0 65				add		eax,0x00000065
01C8  50				push		eax
01C9  E8 00 00 00 00			call		itoa
01CE  83 C4 0C				add		esp,0x0000000c
01D1  FE 0C 24				dec		byte ptr [esp]
01D4  E9 1B 01 00 00			jmp		L$38
01D9				L$17:
01D9  8B 43 10				mov		eax,dword ptr 0x10[ebx]
01DC  40				inc		eax
01DD  EB 6D				jmp		L$29
01DF				L$18:
01DF  8B 53 04				mov		edx,dword ptr 0x4[ebx]
01E2				L$19:
01E2  52				push		edx
01E3				L$20:
01E3  8D 44 24 04			lea		eax,0x4[esp]
01E7  50				push		eax
01E8  E8 00 00 00 00			call		TwoDigits
01ED  83 C4 08				add		esp,0x00000008
01F0  E9 FF 00 00 00			jmp		L$38
01F5				L$21:
01F5  BE AD 00 00 00			mov		esi,offset DGROUP:L$64
01FA  E9 F5 00 00 00			jmp		L$38
01FF				L$22:
01FF  89 6C 24 10			mov		dword ptr 0x10[esp],ebp
0203  BD AF 00 00 00			mov		ebp,offset DGROUP:L$65
0208  E9 D8 FE FF FF			jmp		L$3
020D				L$23:
020D  83 7B 08 0C			cmp		dword ptr 0x8[ebx],0x0000000c
0211  7D 0A				jge		L$24
0213  BE BB 00 00 00			mov		esi,offset DGROUP:L$66
0218  E9 D7 00 00 00			jmp		L$38
021D				L$24:
021D  BE BE 00 00 00			mov		esi,offset DGROUP:L$67
0222  E9 CD 00 00 00			jmp		L$38
0227				L$25:
0227  8B 03				mov		eax,dword ptr [ebx]
0229  EB 21				jmp		L$29
022B				L$26:
022B  BE C1 00 00 00			mov		esi,offset DGROUP:L$68
0230  E9 BF 00 00 00			jmp		L$38
0235				L$27:
0235  8B 53 1C				mov		edx,dword ptr 0x1c[ebx]
0238  8B 7B 18				mov		edi,dword ptr 0x18[ebx]
023B  83 C2 07				add		edx,0x00000007
023E  29 FA				sub		edx,edi
0240  BF 07 00 00 00			mov		edi,0x00000007
0245  89 D0				mov		eax,edx
0247				L$28:
0247  C1 FA 1F				sar		edx,0x1f
024A  F7 FF				idiv		edi
024C				L$29:
024C  50				push		eax
024D  EB 94				jmp		L$20
024F				L$30:
024F  8A 43 18				mov		al,byte ptr 0x18[ebx]
0252  30 F6				xor		dh,dh
0254  04 30				add		al,0x30
0256  88 74 24 01			mov		byte ptr 0x1[esp],dh
025A  88 04 24				mov		byte ptr [esp],al
025D  E9 92 00 00 00			jmp		L$38
0262				L$31:
0262  8B 43 1C				mov		eax,dword ptr 0x1c[ebx]
0265  89 C2				mov		edx,eax
0267  BF 07 00 00 00			mov		edi,0x00000007
026C  C1 FA 1F				sar		edx,0x1f
026F  F7 FF				idiv		edi
0271  2B 53 18				sub		edx,dword ptr 0x18[ebx]
0274  01 FA				add		edx,edi
0276  89 D0				mov		eax,edx
0278  C1 FA 1F				sar		edx,0x1f
027B  F7 FF				idiv		edi
027D  B8 06 00 00 00			mov		eax,0x00000006
0282  8B 4B 1C				mov		ecx,dword ptr 0x1c[ebx]
0285  29 D0				sub		eax,edx
0287  01 C8				add		eax,ecx
0289  89 C2				mov		edx,eax
028B  EB BA				jmp		L$28
028D				L$32:
028D  89 6C 24 10			mov		dword ptr 0x10[esp],ebp
0291  BD C3 00 00 00			mov		ebp,offset DGROUP:L$69
0296  E9 4A FE FF FF			jmp		L$3
029B				L$33:
029B  89 6C 24 10			mov		dword ptr 0x10[esp],ebp
029F  BD D0 00 00 00			mov		ebp,offset DGROUP:L$70
02A4  E9 3C FE FF FF			jmp		L$3
02A9				L$34:
02A9  8B 43 14				mov		eax,dword ptr 0x14[ebx]
02AC  89 C2				mov		edx,eax
02AE  BF 64 00 00 00			mov		edi,0x00000064
02B3  C1 FA 1F				sar		edx,0x1f
02B6  F7 FF				idiv		edi
02B8  E9 25 FF FF FF			jmp		L$19
02BD				L$35:
02BD  6A 0A				push		0x0000000a
02BF  8D 44 24 04			lea		eax,0x4[esp]
02C3  50				push		eax
02C4  8B 43 14				mov		eax,dword ptr 0x14[ebx]
02C7  05 6C 07 00 00			add		eax,0x0000076c
02CC  50				push		eax
02CD  E8 00 00 00 00			call		itoa
02D2  83 C4 0C				add		esp,0x0000000c
02D5  EB 1D				jmp		L$38
02D7				L$36:
02D7  E8 00 00 00 00			call		tzset
02DC  8B 73 20				mov		esi,dword ptr 0x20[ebx]
02DF  8B 34 B5 00 00 00 00		mov		esi,dword ptr tzname[esi*4]
02E6  EB 0C				jmp		L$38
02E8				L$37:
02E8  8A 45 00				mov		al,byte ptr [ebp]
02EB  30 ED				xor		ch,ch
02ED  88 04 24				mov		byte ptr [esp],al
02F0  88 6C 24 01			mov		byte ptr 0x1[esp],ch
02F4				L$38:
02F4  89 F7				mov		edi,esi
02F6  45				inc		ebp
02F7  06				push		es
02F8  8C D8				mov		eax,ds
02FA  8E C0				mov		es,eax
02FC  29 C9				sub		ecx,ecx
02FE  49				dec		ecx
02FF  31 C0				xor		eax,eax
0301  F2 AE				repne scasb	
0303  F7 D1				not		ecx
0305  49				dec		ecx
0306  07				pop		es
0307  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
030B  89 CA				mov		edx,ecx
030D  39 F9				cmp		ecx,edi
030F  76 02				jbe		L$39
0311  89 FA				mov		edx,edi
0313				L$39:
0313  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
0317  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
031B  89 D1				mov		ecx,edx
031D  01 C7				add		edi,eax
031F  06				push		es
0320  8C D8				mov		eax,ds
0322  8E C0				mov		es,eax
0324  57				push		edi
0325  89 C8				mov		eax,ecx
0327  C1 E9 02				shr		ecx,0x02
032A  F2 A5				repne movsd	
032C  8A C8				mov		cl,al
032E  80 E1 03				and		cl,0x03
0331  F2 A4				repne movsb	
0333  5F				pop		edi
0334  07				pop		es
0335  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0339  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
033D  29 D1				sub		ecx,edx
033F  01 D6				add		esi,edx
0341  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
0345  89 74 24 08			mov		dword ptr 0x8[esp],esi
0349  E9 97 FD FF FF			jmp		L$3
034E				L$40:
034E  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0352  3B 44 24 2C			cmp		eax,dword ptr 0x2c[esp]
0356  73 11				jae		L$41
0358  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
035C  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0360  01 D8				add		eax,ebx
0362  C6 00 00				mov		byte ptr [eax],0x00
0365  89 D8				mov		eax,ebx
0367  EB 02				jmp		L$42
0369				L$41:
0369  31 C0				xor		eax,eax
036B				L$42:
036B  83 C4 14				add		esp,0x00000014
036E  5D				pop		ebp
036F  5F				pop		edi
0370  5E				pop		esi
0371  5B				pop		ebx
0372  C3				ret		

Routine Size: 687 bytes,    Routine Base: _TEXT + 00C4

No disassembly errors

Segment: CONST DWORD USE32 000000D9 bytes
0000				L$43:
0000  53 75 6E 64 61 79 00                            Sunday.
0007				L$44:
0007  4D 6F 6E 64 61 79 00                            Monday.
000E				L$45:
000E  54 75 65 73 64 61 79 00                         Tuesday.
0016				L$46:
0016  57 65 64 6E 65 73 64 61 79 00                   Wednesday.
0020				L$47:
0020  54 68 75 72 73 64 61 79 00                      Thursday.
0029				L$48:
0029  46 72 69 64 61 79 00                            Friday.
0030				L$49:
0030  53 61 74 75 72 64 61 79 00                      Saturday.
0039				L$50:
0039  4A 61 6E 75 61 72 79 00                         January.
0041				L$51:
0041  46 65 62 72 75 61 72 79 00                      February.
004A				L$52:
004A  4D 61 72 63 68 00                               March.
0050				L$53:
0050  41 70 72 69 6C 00                               April.
0056				L$54:
0056  4D 61 79 00                                     May.
005A				L$55:
005A  4A 75 6E 65 00                                  June.
005F				L$56:
005F  4A 75 6C 79 00                                  July.
0064				L$57:
0064  41 75 67 75 73 74 00                            August.
006B				L$58:
006B  53 65 70 74 65 6D 62 65 72 00                   September.
0075				L$59:
0075  4F 63 74 6F 62 65 72 00                         October.
007D				L$60:
007D  4E 6F 76 65 6D 62 65 72 00                      November.
0086				L$61:
0086  44 65 63 65 6D 62 65 72 00                      December.
008F				L$62:
008F  25 61 20 25 62 20 25 64 20 25 48 3A 25 4D 3A 25 %a %b %d %H:%M:%
009F  53 20 25 59 00                                  S %Y.
00A4				L$63:
00A4  25 6D 2F 25 64 2F 25 79 00                      %m/%d/%y.
00AD				L$64:
00AD  0A 00                                           ..
00AF				L$65:
00AF  25 49 3A 25 4D 3A 25 53 20 25 70 00             %I:%M:%S %p.
00BB				L$66:
00BB  41 4D 00                                        AM.
00BE				L$67:
00BE  50 4D 00                                        PM.
00C1				L$68:
00C1  09 00                                           ..
00C3				L$69:
00C3  25 61 20 25 62 20 25 64 2C 20 25 59 00          %a %b %d, %Y.
00D0				L$70:
00D0  25 48 3A 25 4D 3A 25 53 00                      %H:%M:%S.

Segment: CONST2 DWORD USE32 00000098 bytes
0000				awday_name:
0000  53 75 6E 00 4D 6F 6E 00 54 75 65 00 57 65 64 00 Sun.Mon.Tue.Wed.
0010  54 68 75 00 46 72 69 00 53 61 74 00             Thu.Fri.Sat.
001C				wday_name:
001C  00 00 00 00                                     DD	offset DGROUP:L$43
0020  07 00 00 00                                     DD	offset DGROUP:L$44
0024  0E 00 00 00                                     DD	offset DGROUP:L$45
0028  16 00 00 00                                     DD	offset DGROUP:L$46
002C  20 00 00 00                                     DD	offset DGROUP:L$47
0030  29 00 00 00                                     DD	offset DGROUP:L$48
0034  30 00 00 00                                     DD	offset DGROUP:L$49
0038				amon_name:
0038  4A 61 6E 00 46 65 62 00 4D 61 72 00 41 70 72 00 Jan.Feb.Mar.Apr.
0048  4D 61 79 00 4A 75 6E 00 4A 75 6C 00 41 75 67 00 May.Jun.Jul.Aug.
0058  53 65 70 00 4F 63 74 00 4E 6F 76 00 44 65 63 00 Sep.Oct.Nov.Dec.
0068				mon_name:
0068  39 00 00 00                                     DD	offset DGROUP:L$50
006C  41 00 00 00                                     DD	offset DGROUP:L$51
0070  4A 00 00 00                                     DD	offset DGROUP:L$52
0074  50 00 00 00                                     DD	offset DGROUP:L$53
0078  56 00 00 00                                     DD	offset DGROUP:L$54
007C  5A 00 00 00                                     DD	offset DGROUP:L$55
0080  5F 00 00 00                                     DD	offset DGROUP:L$56
0084  64 00 00 00                                     DD	offset DGROUP:L$57
0088  6B 00 00 00                                     DD	offset DGROUP:L$58
008C  75 00 00 00                                     DD	offset DGROUP:L$59
0090  7D 00 00 00                                     DD	offset DGROUP:L$60
0094  86 00 00 00                                     DD	offset DGROUP:L$61

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

