Module: tzset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000039D bytes
0000				tryOSTimeZone_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  81 EC AC 00 00 00			sub		esp,0x000000ac
000A  89 E0				mov		eax,esp
000C  50				push		eax
000D  E8 00 00 00 00			call		_GetTimeZoneInformation
0012  83 F8 01				cmp		eax,0x00000001
0015  0F 82 A1 00 00 00			jb		L$9
001B  76 35				jbe		L$1
001D  83 F8 02				cmp		eax,0x00000002
0020  0F 85 96 00 00 00			jne		L$9
0026  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr _daylight,0x00000001
0030  8B 94 24 A8 00 00 00		mov		edx,dword ptr 0xa8[esp]
0037  89 D0				mov		eax,edx
0039  C1 E0 04				shl		eax,0x04
003C  29 D0				sub		eax,edx
003E  C1 E0 02				shl		eax,0x02
0041  89 C3				mov		ebx,eax
0043  A3 00 00 00 00			mov		dword ptr ___dst_adjust,eax
0048  F7 DB				neg		ebx
004A  89 1D 00 00 00 00			mov		dword ptr ___dst_adjust,ebx
0050  EB 08				jmp		L$2
0052				L$1:
0052  31 C9				xor		ecx,ecx
0054  89 0D 00 00 00 00			mov		dword ptr _daylight,ecx
005A				L$2:
005A  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
005E  8B 34 24				mov		esi,dword ptr [esp]
0061  01 F2				add		edx,esi
0063  89 D0				mov		eax,edx
0065  C1 E0 04				shl		eax,0x04
0068  29 D0				sub		eax,edx
006A  B3 20				mov		bl,0x20
006C  C1 E0 02				shl		eax,0x02
006F  8D 54 24 04			lea		edx,0x4[esp]
0073  A3 00 00 00 00			mov		dword ptr _timezone,eax
0078  B8 00 00 00 00			mov		eax,offset _stzone
007D  EB 0F				jmp		L$5
007F				L$3:
007F  80 FB 20				cmp		bl,0x20
0082  75 05				jne		L$4
0084  8A 1A				mov		bl,byte ptr [edx]
0086  88 18				mov		byte ptr [eax],bl
0088  40				inc		eax
0089				L$4:
0089  8A 1A				mov		bl,byte ptr [edx]
008B  83 C2 02				add		edx,0x00000002
008E				L$5:
008E  66 83 3A 00			cmp		word ptr [edx],0x0000
0092  75 EB				jne		L$3
0094  B3 20				mov		bl,0x20
0096  8D 54 24 58			lea		edx,0x58[esp]
009A  C6 00 00				mov		byte ptr [eax],0x00
009D  B8 00 00 00 00			mov		eax,offset _dtzone
00A2  EB 0F				jmp		L$8
00A4				L$6:
00A4  80 FB 20				cmp		bl,0x20
00A7  75 05				jne		L$7
00A9  8A 1A				mov		bl,byte ptr [edx]
00AB  88 18				mov		byte ptr [eax],bl
00AD  40				inc		eax
00AE				L$7:
00AE  8A 1A				mov		bl,byte ptr [edx]
00B0  83 C2 02				add		edx,0x00000002
00B3				L$8:
00B3  66 83 3A 00			cmp		word ptr [edx],0x0000
00B7  75 EB				jne		L$6
00B9  C6 00 00				mov		byte ptr [eax],0x00
00BC				L$9:
00BC  81 C4 AC 00 00 00			add		esp,0x000000ac
00C2  5E				pop		esi
00C3  5A				pop		edx
00C4  59				pop		ecx
00C5  5B				pop		ebx
00C6  C3				ret		

Routine Size: 199 bytes,    Routine Base: _TEXT + 0000

00C7				tzset_:
00C7  B8 00 00 00 00			mov		eax,offset DGROUP:L$31
00CC  E8 00 00 00 00			call		getenv_
00D1  85 C0				test		eax,eax
00D3  0F 84 00 00 00 00			je		tryOSTimeZone_

Routine Size: 18 bytes,    Routine Base: _TEXT + 00C7

00D9				__parse_tz_:
00D9  53				push		ebx
00DA  51				push		ecx
00DB  52				push		edx
00DC  83 EC 04				sub		esp,0x00000004
00DF  31 D2				xor		edx,edx
00E1  BB 00 00 00 00			mov		ebx,offset _timezone
00E6  89 15 00 00 00 00			mov		dword ptr _daylight,edx
00EC  BA 00 00 00 00			mov		edx,offset _stzone
00F1  E8 00 00 00 00			call		parse_offset_
00F6  89 C2				mov		edx,eax
00F8  8A 20				mov		ah,byte ptr [eax]
00FA  84 E4				test		ah,ah
00FC  0F 85 39 02 00 00			jne		L$28
0102  88 25 00 00 00 00			mov		byte ptr _dtzone,ah
0108  E9 89 02 00 00			jmp		L$30
010D				parse_time_:
010D  53				push		ebx
010E  51				push		ecx
010F  89 D1				mov		ecx,edx
0111  31 D2				xor		edx,edx
0113				L$10:
0113  8A 18				mov		bl,byte ptr [eax]
0115  80 FB 30				cmp		bl,0x30
0118  72 14				jb		L$11
011A  80 FB 39				cmp		bl,0x39
011D  77 0F				ja		L$11
011F  6B D2 0A				imul		edx,0x0000000a
0122  31 DB				xor		ebx,ebx
0124  8A 18				mov		bl,byte ptr [eax]
0126  01 DA				add		edx,ebx
0128  40				inc		eax
0129  83 EA 30				sub		edx,0x00000030
012C  EB E5				jmp		L$10
012E				L$11:
012E  89 11				mov		dword ptr [ecx],edx
0130  59				pop		ecx
0131  5B				pop		ebx
0132  C3				ret		
0133				parse_offset_:
0133  51				push		ecx
0134  56				push		esi
0135  57				push		edi
0136  55				push		ebp
0137  83 EC 14				sub		esp,0x00000014
013A  89 C5				mov		ebp,eax
013C  89 54 24 10			mov		dword ptr 0x10[esp],edx
0140  80 38 3A				cmp		byte ptr [eax],0x3a
0143  75 01				jne		L$12
0145  45				inc		ebp
0146				L$12:
0146  89 EE				mov		esi,ebp
0148				L$13:
0148  8A 55 00				mov		dl,byte ptr [ebp]
014B  84 D2				test		dl,dl
014D  74 1C				je		L$15
014F  80 FA 2C				cmp		dl,0x2c
0152  74 17				je		L$15
0154  80 FA 2D				cmp		dl,0x2d
0157  74 12				je		L$15
0159  80 FA 2B				cmp		dl,0x2b
015C  74 0D				je		L$15
015E  80 FA 30				cmp		dl,0x30
0161  72 05				jb		L$14
0163  80 FA 39				cmp		dl,0x39
0166  76 03				jbe		L$15
0168				L$14:
0168  45				inc		ebp
0169  EB DD				jmp		L$13
016B				L$15:
016B  89 E8				mov		eax,ebp
016D  29 F0				sub		eax,esi
016F  89 44 24 0C			mov		dword ptr 0xc[esp],eax
0173  83 F8 1E				cmp		eax,0x0000001e
0176  7E 08				jle		L$16
0178  C7 44 24 0C 1E 00 00 00		mov		dword ptr 0xc[esp],0x0000001e
0180				L$16:
0180  8B 7C 24 10			mov		edi,dword ptr 0x10[esp]
0184  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0188  06				push		es
0189  8C D8				mov		eax,ds
018B  8E C0				mov		es,eax
018D  57				push		edi
018E  89 C8				mov		eax,ecx
0190  C1 E9 02				shr		ecx,0x02
0193  F2 A5				repne movsd	
0195  8A C8				mov		cl,al
0197  80 E1 03				and		cl,0x03
019A  F2 A4				repne movsb	
019C  5F				pop		edi
019D  07				pop		es
019E  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
01A2  8D 04 0F				lea		eax,[edi+ecx]
01A5  31 F6				xor		esi,esi
01A7  C6 00 00				mov		byte ptr [eax],0x00
01AA  8D 45 01				lea		eax,0x1[ebp]
01AD  80 FA 2D				cmp		dl,0x2d
01B0  75 07				jne		L$17
01B2  BE 01 00 00 00			mov		esi,0x00000001
01B7  EB 05				jmp		L$18
01B9				L$17:
01B9  80 FA 2B				cmp		dl,0x2b
01BC  75 02				jne		L$19
01BE				L$18:
01BE  89 C5				mov		ebp,eax
01C0				L$19:
01C0  8A 45 00				mov		al,byte ptr [ebp]
01C3  3C 30				cmp		al,0x30
01C5  0F 82 74 00 00 00			jb		L$21
01CB  3C 39				cmp		al,0x39
01CD  77 70				ja		L$21
01CF  8D 54 24 08			lea		edx,0x8[esp]
01D3  31 FF				xor		edi,edi
01D5  89 E8				mov		eax,ebp
01D7  89 3C 24				mov		dword ptr [esp],edi
01DA  89 7C 24 04			mov		dword ptr 0x4[esp],edi
01DE  89 7C 24 08			mov		dword ptr 0x8[esp],edi
01E2  E8 00 00 00 00			call		parse_time_
01E7  89 C2				mov		edx,eax
01E9  8A 08				mov		cl,byte ptr [eax]
01EB  89 C5				mov		ebp,eax
01ED  80 F9 3A				cmp		cl,0x3a
01F0  75 1E				jne		L$20
01F2  8D 54 24 04			lea		edx,0x4[esp]
01F6  40				inc		eax
01F7  E8 00 00 00 00			call		parse_time_
01FC  89 C2				mov		edx,eax
01FE  8A 28				mov		ch,byte ptr [eax]
0200  89 C5				mov		ebp,eax
0202  38 CD				cmp		ch,cl
0204  75 0A				jne		L$20
0206  89 E2				mov		edx,esp
0208  40				inc		eax
0209  E8 00 00 00 00			call		parse_time_
020E  89 C5				mov		ebp,eax
0210				L$20:
0210  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0214  89 D0				mov		eax,edx
0216  C1 E0 04				shl		eax,0x04
0219  29 D0				sub		eax,edx
021B  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
021F  C1 E0 02				shl		eax,0x02
0222  01 C2				add		edx,eax
0224  89 D0				mov		eax,edx
0226  C1 E0 04				shl		eax,0x04
0229  29 D0				sub		eax,edx
022B  8B 14 24				mov		edx,dword ptr [esp]
022E  C1 E0 02				shl		eax,0x02
0231  01 C2				add		edx,eax
0233  89 13				mov		dword ptr [ebx],edx
0235  85 F6				test		esi,esi
0237  74 06				je		L$21
0239  89 D1				mov		ecx,edx
023B  F7 D9				neg		ecx
023D  89 0B				mov		dword ptr [ebx],ecx
023F				L$21:
023F  89 E8				mov		eax,ebp
0241  83 C4 14				add		esp,0x00000014
0244  5D				pop		ebp
0245  5F				pop		edi
0246  5E				pop		esi
0247  59				pop		ecx
0248  C3				ret		
0249				parse_rule_:
0249  53				push		ebx
024A  51				push		ecx
024B  56				push		esi
024C  83 EC 10				sub		esp,0x00000010
024F  89 C3				mov		ebx,eax
0251  89 D1				mov		ecx,edx
0253  8A 20				mov		ah,byte ptr [eax]
0255  BE FF FF FF FF			mov		esi,0xffffffff
025A  80 FC 4A				cmp		ah,0x4a
025D  75 07				jne		L$22
025F  BE 01 00 00 00			mov		esi,0x00000001
0264  01 F3				add		ebx,esi
0266				L$22:
0266  80 3B 4D				cmp		byte ptr [ebx],0x4d
0269  75 03				jne		L$23
026B  43				inc		ebx
026C  31 F6				xor		esi,esi
026E				L$23:
026E  8D 54 24 0C			lea		edx,0xc[esp]
0272  89 D8				mov		eax,ebx
0274  89 71 20				mov		dword ptr 0x20[ecx],esi
0277  E8 00 00 00 00			call		parse_time_
027C  89 C2				mov		edx,eax
027E  89 C3				mov		ebx,eax
0280  85 F6				test		esi,esi
0282  74 09				je		L$24
0284  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0288  89 41 1C				mov		dword ptr 0x1c[ecx],eax
028B  EB 45				jmp		L$26
028D				L$24:
028D  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0291  48				dec		eax
0292  89 41 10				mov		dword ptr 0x10[ecx],eax
0295  80 3A 2E				cmp		byte ptr [edx],0x2e
0298  75 31				jne		L$25
029A  8D 42 01				lea		eax,0x1[edx]
029D  8D 54 24 0C			lea		edx,0xc[esp]
02A1  E8 00 00 00 00			call		parse_time_
02A6  89 C2				mov		edx,eax
02A8  89 C3				mov		ebx,eax
02AA  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
02AE  89 41 0C				mov		dword ptr 0xc[ecx],eax
02B1  80 3A 2E				cmp		byte ptr [edx],0x2e
02B4  75 15				jne		L$25
02B6  8D 42 01				lea		eax,0x1[edx]
02B9  8D 54 24 0C			lea		edx,0xc[esp]
02BD  E8 00 00 00 00			call		parse_time_
02C2  89 C3				mov		ebx,eax
02C4  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
02C8  89 41 18				mov		dword ptr 0x18[ecx],eax
02CB				L$25:
02CB  C7 41 1C 00 00 00 00		mov		dword ptr 0x1c[ecx],0x00000000
02D2				L$26:
02D2  BA 02 00 00 00			mov		edx,0x00000002
02D7  31 F6				xor		esi,esi
02D9  89 54 24 08			mov		dword ptr 0x8[esp],edx
02DD  89 34 24				mov		dword ptr [esp],esi
02E0  89 74 24 04			mov		dword ptr 0x4[esp],esi
02E4  80 3B 2F				cmp		byte ptr [ebx],0x2f
02E7  75 36				jne		L$27
02E9  8D 54 24 08			lea		edx,0x8[esp]
02ED  8D 43 01				lea		eax,0x1[ebx]
02F0  E8 00 00 00 00			call		parse_time_
02F5  89 C2				mov		edx,eax
02F7  89 C3				mov		ebx,eax
02F9  80 38 3A				cmp		byte ptr [eax],0x3a
02FC  75 21				jne		L$27
02FE  8D 42 01				lea		eax,0x1[edx]
0301  8D 54 24 04			lea		edx,0x4[esp]
0305  E8 00 00 00 00			call		parse_time_
030A  89 C2				mov		edx,eax
030C  89 C3				mov		ebx,eax
030E  80 38 3A				cmp		byte ptr [eax],0x3a
0311  75 0C				jne		L$27
0313  8D 42 01				lea		eax,0x1[edx]
0316  89 E2				mov		edx,esp
0318  E8 00 00 00 00			call		parse_time_
031D  89 C3				mov		ebx,eax
031F				L$27:
031F  8B 04 24				mov		eax,dword ptr [esp]
0322  89 01				mov		dword ptr [ecx],eax
0324  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0328  89 41 04				mov		dword ptr 0x4[ecx],eax
032B  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
032F  89 41 08				mov		dword ptr 0x8[ecx],eax
0332  89 D8				mov		eax,ebx
0334  83 C4 10				add		esp,0x00000010
0337  5E				pop		esi
0338  59				pop		ecx
0339  5B				pop		ebx
033A  C3				ret		
033B				L$28:
033B  BB 01 00 00 00			mov		ebx,0x00000001
0340  A1 00 00 00 00			mov		eax,dword ptr _timezone
0345  89 1D 00 00 00 00			mov		dword ptr _daylight,ebx
034B  2D 10 0E 00 00			sub		eax,0x00000e10
0350  89 E3				mov		ebx,esp
0352  89 04 24				mov		dword ptr [esp],eax
0355  89 D0				mov		eax,edx
0357  BA 00 00 00 00			mov		edx,offset _dtzone
035C  E8 00 00 00 00			call		parse_offset_
0361  8B 0C 24				mov		ecx,dword ptr [esp]
0364  8B 1D 00 00 00 00			mov		ebx,dword ptr _timezone
036A  29 CB				sub		ebx,ecx
036C  89 1D 00 00 00 00			mov		dword ptr ___dst_adjust,ebx
0372  8A 18				mov		bl,byte ptr [eax]
0374  89 C2				mov		edx,eax
0376  80 FB 2C				cmp		bl,0x2c
0379  75 0B				jne		L$29
037B  BA 00 00 00 00			mov		edx,offset ___start_dst
0380  40				inc		eax
0381  E8 00 00 00 00			call		parse_rule_
0386				L$29:
0386  80 38 2C				cmp		byte ptr [eax],0x2c
0389  75 0B				jne		L$30
038B  BA 00 00 00 00			mov		edx,offset ___end_dst
0390  40				inc		eax
0391  E8 00 00 00 00			call		parse_rule_
0396				L$30:
0396  83 C4 04				add		esp,0x00000004
0399  5A				pop		edx
039A  59				pop		ecx
039B  5B				pop		ebx
039C  C3				ret		

Routine Size: 708 bytes,    Routine Base: _TEXT + 00D9

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$31:
0000  54 5A 00                                        TZ.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000009A bytes
0000				___start_dst:
0000  00 00 00 00 00 00 00 00 02 00 00 00 01 00 00 00 ................
0010  03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0020  00 00 00 00                                     ....
0024				___end_dst:
0024  00 00 00 00 00 00 00 00 02 00 00 00 05 00 00 00 ................
0034  09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00                                     ....
0048				_timezone:
0048  50 46 00 00                                     PF..
004C				___dst_adjust:
004C  10 0E 00 00                                     ....
0050				_daylight:
0050  01 00 00 00                                     ....
0054				_stzone:
0054  45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EST.............
0064  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0073				_dtzone:
0073  45 44 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EDT.............
0083  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0092				_tzname:
0092  00 00 00 00                                     DD	offset _stzone
0096  00 00 00 00                                     DD	offset _dtzone

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

