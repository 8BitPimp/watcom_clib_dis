Module: tzset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000004E3 bytes
0000				__CacheOSTZ:
0000  53				push		ebx
0001  A1 00 00 00 00			mov		eax,dword ptr tzFlag
0006  8A 1D 00 00 00 00			mov		bl,byte ptr tzFlag
000C  83 E0 01				and		eax,0x00000001
000F  80 E3 FE				and		bl,0xfe
0012  89 C2				mov		edx,eax
0014  88 1D 00 00 00 00			mov		byte ptr tzFlag,bl
001A  F7 D2				not		edx
001C  8B 1D 00 00 00 00			mov		ebx,dword ptr tzFlag
0022  83 E2 01				and		edx,0x00000001
0025  09 D3				or		ebx,edx
0027  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
002B  89 1D 00 00 00 00			mov		dword ptr tzFlag,ebx
0031  85 C9				test		ecx,ecx
0033  0F 95 C2				setne		dl
0036  8A 3D 00 00 00 00			mov		bh,byte ptr tzFlag
003C  83 E2 01				and		edx,0x00000001
003F  80 E7 FD				and		bh,0xfd
0042  88 3D 00 00 00 00			mov		byte ptr tzFlag,bh
0048  01 D2				add		edx,edx
004A  09 15 00 00 00 00			or		dword ptr tzFlag,edx
0050  5B				pop		ebx
0051  C3				ret		
0052				tryOSTimeZone:
0052  53				push		ebx
0053  56				push		esi
0054  81 EC AC 00 00 00			sub		esp,0x000000ac
005A  8A 25 00 00 00 00			mov		ah,byte ptr tzFlag
0060  F6 C4 01				test		ah,0x01
0063  74 09				je		L$1
0065  F6 C4 02				test		ah,0x02
0068  0F 85 CD 00 00 00			jne		L$10
006E				L$1:
006E  8A 35 00 00 00 00			mov		dh,byte ptr tzFlag
0074  89 E0				mov		eax,esp
0076  80 CE 02				or		dh,0x02
0079  50				push		eax
007A  88 35 00 00 00 00			mov		byte ptr tzFlag,dh
0080  E8 00 00 00 00			call		_GetTimeZoneInformation
0085  83 F8 01				cmp		eax,0x00000001
0088  0F 82 AD 00 00 00			jb		L$10
008E  76 35				jbe		L$2
0090  83 F8 02				cmp		eax,0x00000002
0093  0F 85 A2 00 00 00			jne		L$10
0099  C7 05 00 00 00 00 01 00 00 00
					mov		dword ptr daylight,0x00000001
00A3  8B 94 24 A8 00 00 00		mov		edx,dword ptr 0xa8[esp]
00AA  89 D0				mov		eax,edx
00AC  C1 E0 04				shl		eax,0x04
00AF  29 D0				sub		eax,edx
00B1  C1 E0 02				shl		eax,0x02
00B4  89 C3				mov		ebx,eax
00B6  A3 00 00 00 00			mov		dword ptr __dst_adjust,eax
00BB  F7 DB				neg		ebx
00BD  89 1D 00 00 00 00			mov		dword ptr __dst_adjust,ebx
00C3  EB 08				jmp		L$3
00C5				L$2:
00C5  31 C9				xor		ecx,ecx
00C7  89 0D 00 00 00 00			mov		dword ptr daylight,ecx
00CD				L$3:
00CD  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
00D1  8B 34 24				mov		esi,dword ptr [esp]
00D4  01 F2				add		edx,esi
00D6  89 D0				mov		eax,edx
00D8  C1 E0 04				shl		eax,0x04
00DB  29 D0				sub		eax,edx
00DD  B3 20				mov		bl,0x20
00DF  C1 E0 02				shl		eax,0x02
00E2  8D 54 24 04			lea		edx,0x4[esp]
00E6  A3 00 00 00 00			mov		dword ptr timezone,eax
00EB  B8 00 00 00 00			mov		eax,offset stzone
00F0  EB 15				jmp		L$6
00F2				L$4:
00F2  81 E3 FF 00 00 00			and		ebx,0x000000ff
00F8  83 FB 20				cmp		ebx,0x00000020
00FB  75 05				jne		L$5
00FD  8A 1A				mov		bl,byte ptr [edx]
00FF  88 18				mov		byte ptr [eax],bl
0101  40				inc		eax
0102				L$5:
0102  8A 1A				mov		bl,byte ptr [edx]
0104  83 C2 02				add		edx,0x00000002
0107				L$6:
0107  66 83 3A 00			cmp		word ptr [edx],0x0000
010B  75 E5				jne		L$4
010D  B3 20				mov		bl,0x20
010F  8D 54 24 58			lea		edx,0x58[esp]
0113  C6 00 00				mov		byte ptr [eax],0x00
0116  B8 00 00 00 00			mov		eax,offset dtzone
011B  EB 15				jmp		L$9
011D				L$7:
011D  81 E3 FF 00 00 00			and		ebx,0x000000ff
0123  83 FB 20				cmp		ebx,0x00000020
0126  75 05				jne		L$8
0128  8A 1A				mov		bl,byte ptr [edx]
012A  88 18				mov		byte ptr [eax],bl
012C  40				inc		eax
012D				L$8:
012D  8A 1A				mov		bl,byte ptr [edx]
012F  83 C2 02				add		edx,0x00000002
0132				L$9:
0132  66 83 3A 00			cmp		word ptr [edx],0x0000
0136  75 E5				jne		L$7
0138  C6 00 00				mov		byte ptr [eax],0x00
013B				L$10:
013B  81 C4 AC 00 00 00			add		esp,0x000000ac
0141  5E				pop		esi
0142  5B				pop		ebx
0143  C3				ret		

Routine Size: 324 bytes,    Routine Base: _TEXT + 0000

0144				tzset:
0144  68 00 00 00 00			push		offset DGROUP:L$32
0149  E8 00 00 00 00			call		getenv
014E  83 C4 04				add		esp,0x00000004
0151  85 C0				test		eax,eax
0153  0F 84 00 00 00 00			je		tryOSTimeZone
0159  50				push		eax
015A  E8 00 00 00 00			call		__parse_tz
015F  83 C4 04				add		esp,0x00000004
0162  C3				ret		
0163				parse_time:
0163  53				push		ebx
0164  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0168  31 DB				xor		ebx,ebx
016A				L$11:
016A  31 C0				xor		eax,eax
016C  8A 02				mov		al,byte ptr [edx]
016E  83 F8 30				cmp		eax,0x00000030
0171  7C 10				jl		L$12
0173  83 F8 39				cmp		eax,0x00000039
0176  7F 0B				jg		L$12
0178  6B DB 0A				imul		ebx,0x0000000a
017B  01 D8				add		eax,ebx
017D  42				inc		edx
017E  8D 58 D0				lea		ebx,-0x30[eax]
0181  EB E7				jmp		L$11
0183				L$12:
0183  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0187  89 18				mov		dword ptr [eax],ebx
0189  89 D0				mov		eax,edx
018B  5B				pop		ebx
018C  C3				ret		
018D				parse_offset:
018D  53				push		ebx
018E  56				push		esi
018F  57				push		edi
0190  55				push		ebp
0191  83 EC 0C				sub		esp,0x0000000c
0194  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0198  31 C0				xor		eax,eax
019A  8A 02				mov		al,byte ptr [edx]
019C  83 F8 3A				cmp		eax,0x0000003a
019F  75 01				jne		L$13
01A1  42				inc		edx
01A2				L$13:
01A2  89 D6				mov		esi,edx
01A4				L$14:
01A4  8A 1A				mov		bl,byte ptr [edx]
01A6  84 DB				test		bl,bl
01A8  74 20				je		L$16
01AA  31 C0				xor		eax,eax
01AC  88 D8				mov		al,bl
01AE  83 F8 2C				cmp		eax,0x0000002c
01B1  74 17				je		L$16
01B3  83 F8 2D				cmp		eax,0x0000002d
01B6  74 12				je		L$16
01B8  83 F8 2B				cmp		eax,0x0000002b
01BB  74 0D				je		L$16
01BD  83 F8 30				cmp		eax,0x00000030
01C0  7C 05				jl		L$15
01C2  83 F8 39				cmp		eax,0x00000039
01C5  7E 03				jle		L$16
01C7				L$15:
01C7  42				inc		edx
01C8  EB DA				jmp		L$14
01CA				L$16:
01CA  89 D5				mov		ebp,edx
01CC  29 F5				sub		ebp,esi
01CE  83 FD 1E				cmp		ebp,0x0000001e
01D1  7E 05				jle		L$17
01D3  BD 1E 00 00 00			mov		ebp,0x0000001e
01D8				L$17:
01D8  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
01DC  89 E9				mov		ecx,ebp
01DE  06				push		es
01DF  8C D8				mov		eax,ds
01E1  8E C0				mov		es,eax
01E3  57				push		edi
01E4  89 C8				mov		eax,ecx
01E6  C1 E9 02				shr		ecx,0x02
01E9  F2 A5				repne movsd	
01EB  8A C8				mov		cl,al
01ED  80 E1 03				and		cl,0x03
01F0  F2 A4				repne movsb	
01F2  5F				pop		edi
01F3  07				pop		es
01F4  01 FD				add		ebp,edi
01F6  0F B6 F3				movzx		esi,bl
01F9  8D 42 01				lea		eax,0x1[edx]
01FC  C6 45 00 00			mov		byte ptr [ebp],0x00
0200  31 ED				xor		ebp,ebp
0202  83 FE 2D				cmp		esi,0x0000002d
0205  75 07				jne		L$18
0207  BD 01 00 00 00			mov		ebp,0x00000001
020C  EB 05				jmp		L$19
020E				L$18:
020E  83 FE 2B				cmp		esi,0x0000002b
0211  75 02				jne		L$20
0213				L$19:
0213  89 C2				mov		edx,eax
0215				L$20:
0215  8A 02				mov		al,byte ptr [edx]
0217  25 FF 00 00 00			and		eax,0x000000ff
021C  83 F8 30				cmp		eax,0x00000030
021F  0F 8C 8A 00 00 00			jl		L$22
0225  83 F8 39				cmp		eax,0x00000039
0228  0F 8F 81 00 00 00			jg		L$22
022E  8D 44 24 08			lea		eax,0x8[esp]
0232  31 F6				xor		esi,esi
0234  50				push		eax
0235  89 74 24 04			mov		dword ptr 0x4[esp],esi
0239  52				push		edx
023A  89 74 24 0C			mov		dword ptr 0xc[esp],esi
023E  89 74 24 10			mov		dword ptr 0x10[esp],esi
0242  E8 00 00 00 00			call		parse_time
0247  83 C4 08				add		esp,0x00000008
024A  0F B6 30				movzx		esi,byte ptr [eax]
024D  89 C2				mov		edx,eax
024F  83 FE 3A				cmp		esi,0x0000003a
0252  75 28				jne		L$21
0254  8D 54 24 04			lea		edx,0x4[esp]
0258  52				push		edx
0259  40				inc		eax
025A  50				push		eax
025B  E8 00 00 00 00			call		parse_time
0260  83 C4 08				add		esp,0x00000008
0263  0F B6 30				movzx		esi,byte ptr [eax]
0266  89 C2				mov		edx,eax
0268  83 FE 3A				cmp		esi,0x0000003a
026B  75 0F				jne		L$21
026D  89 E2				mov		edx,esp
026F  52				push		edx
0270  40				inc		eax
0271  50				push		eax
0272  E8 00 00 00 00			call		parse_time
0277  83 C4 08				add		esp,0x00000008
027A  89 C2				mov		edx,eax
027C				L$21:
027C  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
0280  89 F0				mov		eax,esi
0282  C1 E0 04				shl		eax,0x04
0285  29 F0				sub		eax,esi
0287  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
028B  C1 E0 02				shl		eax,0x02
028E  01 C6				add		esi,eax
0290  89 F0				mov		eax,esi
0292  C1 E0 04				shl		eax,0x04
0295  29 F0				sub		eax,esi
0297  8B 34 24				mov		esi,dword ptr [esp]
029A  C1 E0 02				shl		eax,0x02
029D  01 C6				add		esi,eax
029F  8B 44 24 28			mov		eax,dword ptr 0x28[esp]
02A3  89 30				mov		dword ptr [eax],esi
02A5  85 ED				test		ebp,ebp
02A7  74 06				je		L$22
02A9  89 F3				mov		ebx,esi
02AB  F7 DB				neg		ebx
02AD  89 18				mov		dword ptr [eax],ebx
02AF				L$22:
02AF  89 D0				mov		eax,edx
02B1  83 C4 0C				add		esp,0x0000000c
02B4  5D				pop		ebp
02B5  5F				pop		edi
02B6  5E				pop		esi
02B7  5B				pop		ebx
02B8  C3				ret		
02B9				parse_rule:
02B9  53				push		ebx
02BA  56				push		esi
02BB  83 EC 10				sub		esp,0x00000010
02BE  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
02C2  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
02C6  31 C0				xor		eax,eax
02C8  8A 02				mov		al,byte ptr [edx]
02CA  BE FF FF FF FF			mov		esi,0xffffffff
02CF  83 F8 4A				cmp		eax,0x0000004a
02D2  75 07				jne		L$23
02D4  BE 01 00 00 00			mov		esi,0x00000001
02D9  01 F2				add		edx,esi
02DB				L$23:
02DB  31 C0				xor		eax,eax
02DD  8A 02				mov		al,byte ptr [edx]
02DF  83 F8 4D				cmp		eax,0x0000004d
02E2  75 03				jne		L$24
02E4  42				inc		edx
02E5  31 F6				xor		esi,esi
02E7				L$24:
02E7  8D 44 24 0C			lea		eax,0xc[esp]
02EB  50				push		eax
02EC  52				push		edx
02ED  89 73 20				mov		dword ptr 0x20[ebx],esi
02F0  E8 00 00 00 00			call		parse_time
02F5  89 C1				mov		ecx,eax
02F7  83 C4 08				add		esp,0x00000008
02FA  89 C2				mov		edx,eax
02FC  85 F6				test		esi,esi
02FE  74 09				je		L$25
0300  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0304  89 43 1C				mov		dword ptr 0x1c[ebx],eax
0307  EB 53				jmp		L$27
0309				L$25:
0309  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
030D  48				dec		eax
030E  89 43 10				mov		dword ptr 0x10[ebx],eax
0311  31 C0				xor		eax,eax
0313  8A 01				mov		al,byte ptr [ecx]
0315  83 F8 2E				cmp		eax,0x0000002e
0318  75 3B				jne		L$26
031A  8D 44 24 0C			lea		eax,0xc[esp]
031E  50				push		eax
031F  41				inc		ecx
0320  51				push		ecx
0321  E8 00 00 00 00			call		parse_time
0326  89 C1				mov		ecx,eax
0328  83 C4 08				add		esp,0x00000008
032B  89 C2				mov		edx,eax
032D  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0331  89 43 0C				mov		dword ptr 0xc[ebx],eax
0334  31 C0				xor		eax,eax
0336  8A 01				mov		al,byte ptr [ecx]
0338  83 F8 2E				cmp		eax,0x0000002e
033B  75 18				jne		L$26
033D  8D 44 24 0C			lea		eax,0xc[esp]
0341  50				push		eax
0342  41				inc		ecx
0343  51				push		ecx
0344  E8 00 00 00 00			call		parse_time
0349  83 C4 08				add		esp,0x00000008
034C  89 C2				mov		edx,eax
034E  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0352  89 43 18				mov		dword ptr 0x18[ebx],eax
0355				L$26:
0355  C7 43 1C 00 00 00 00		mov		dword ptr 0x1c[ebx],0x00000000
035C				L$27:
035C  B9 02 00 00 00			mov		ecx,0x00000002
0361  31 F6				xor		esi,esi
0363  31 C0				xor		eax,eax
0365  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0369  89 34 24				mov		dword ptr [esp],esi
036C  89 74 24 04			mov		dword ptr 0x4[esp],esi
0370  8A 02				mov		al,byte ptr [edx]
0372  83 F8 2F				cmp		eax,0x0000002f
0375  75 43				jne		L$28
0377  8D 44 24 08			lea		eax,0x8[esp]
037B  50				push		eax
037C  42				inc		edx
037D  52				push		edx
037E  E8 00 00 00 00			call		parse_time
0383  31 C9				xor		ecx,ecx
0385  83 C4 08				add		esp,0x00000008
0388  8A 08				mov		cl,byte ptr [eax]
038A  89 C2				mov		edx,eax
038C  83 F9 3A				cmp		ecx,0x0000003a
038F  75 29				jne		L$28
0391  8D 54 24 04			lea		edx,0x4[esp]
0395  52				push		edx
0396  40				inc		eax
0397  50				push		eax
0398  E8 00 00 00 00			call		parse_time
039D  31 C9				xor		ecx,ecx
039F  83 C4 08				add		esp,0x00000008
03A2  8A 08				mov		cl,byte ptr [eax]
03A4  89 C2				mov		edx,eax
03A6  83 F9 3A				cmp		ecx,0x0000003a
03A9  75 0F				jne		L$28
03AB  89 E2				mov		edx,esp
03AD  52				push		edx
03AE  40				inc		eax
03AF  50				push		eax
03B0  E8 00 00 00 00			call		parse_time
03B5  83 C4 08				add		esp,0x00000008
03B8  89 C2				mov		edx,eax
03BA				L$28:
03BA  8B 04 24				mov		eax,dword ptr [esp]
03BD  89 03				mov		dword ptr [ebx],eax
03BF  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
03C3  89 43 04				mov		dword ptr 0x4[ebx],eax
03C6  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
03CA  89 43 08				mov		dword ptr 0x8[ebx],eax
03CD  89 D0				mov		eax,edx
03CF  83 C4 10				add		esp,0x00000010
03D2  5E				pop		esi
03D3  5B				pop		ebx
03D4  C3				ret		

Routine Size: 657 bytes,    Routine Base: _TEXT + 0144

03D5				__parse_tz:
03D5  53				push		ebx
03D6  56				push		esi
03D7  57				push		edi
03D8  55				push		ebp
03D9  83 EC 04				sub		esp,0x00000004
03DC  68 00 00 00 00			push		offset timezone
03E1  68 00 00 00 00			push		offset stzone
03E6  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
03EA  31 D2				xor		edx,edx
03EC  53				push		ebx
03ED  89 15 00 00 00 00			mov		dword ptr daylight,edx
03F3  E8 00 00 00 00			call		parse_offset
03F8  89 C2				mov		edx,eax
03FA  8A 20				mov		ah,byte ptr [eax]
03FC  83 C4 0C				add		esp,0x0000000c
03FF  84 E4				test		ah,ah
0401  75 0D				jne		L$29
0403  30 C2				xor		dl,al
0405  88 15 00 00 00 00			mov		byte ptr dtzone,dl
040B  E9 CB 00 00 00			jmp		L$31
0410				L$29:
0410  A1 00 00 00 00			mov		eax,dword ptr timezone
0415  2D 10 0E 00 00			sub		eax,0x00000e10
041A  89 04 24				mov		dword ptr [esp],eax
041D  89 E0				mov		eax,esp
041F  50				push		eax
0420  68 00 00 00 00			push		offset dtzone
0425  B9 01 00 00 00			mov		ecx,0x00000001
042A  52				push		edx
042B  89 0D 00 00 00 00			mov		dword ptr daylight,ecx
0431  E8 00 00 00 00			call		parse_offset
0436  83 C4 0C				add		esp,0x0000000c
0439  8B 1D 00 00 00 00			mov		ebx,dword ptr timezone
043F  8B 34 24				mov		esi,dword ptr [esp]
0442  29 F3				sub		ebx,esi
0444  89 1D 00 00 00 00			mov		dword ptr __dst_adjust,ebx
044A  31 DB				xor		ebx,ebx
044C  8A 18				mov		bl,byte ptr [eax]
044E  89 C2				mov		edx,eax
0450  83 FB 2C				cmp		ebx,0x0000002c
0453  75 11				jne		L$30
0455  68 00 00 00 00			push		offset __start_dst
045A  40				inc		eax
045B  50				push		eax
045C  E8 00 00 00 00			call		parse_rule
0461  83 C4 08				add		esp,0x00000008
0464  89 C2				mov		edx,eax
0466				L$30:
0466  31 C0				xor		eax,eax
0468  8A 02				mov		al,byte ptr [edx]
046A  83 F8 2C				cmp		eax,0x0000002c
046D  75 6C				jne		L$31
046F  68 00 00 00 00			push		offset __end_dst
0474  42				inc		edx
0475  52				push		edx
0476  E8 00 00 00 00			call		parse_rule
047B  A1 00 00 00 00			mov		eax,dword ptr __dst_adjust
0480  89 C2				mov		edx,eax
0482  BB 10 0E 00 00			mov		ebx,0x00000e10
0487  C1 FA 1F				sar		edx,0x1f
048A  F7 FB				idiv		ebx
048C  8B 3D 08 00 00 00			mov		edi,dword ptr __end_dst+0x8
0492  29 C7				sub		edi,eax
0494  A1 00 00 00 00			mov		eax,dword ptr __dst_adjust
0499  89 C2				mov		edx,eax
049B  BB 3C 00 00 00			mov		ebx,0x0000003c
04A0  C1 FA 1F				sar		edx,0x1f
04A3  F7 FB				idiv		ebx
04A5  89 C2				mov		edx,eax
04A7  C1 FA 1F				sar		edx,0x1f
04AA  F7 FB				idiv		ebx
04AC  8B 2D 04 00 00 00			mov		ebp,dword ptr __end_dst+0x4
04B2  A1 00 00 00 00			mov		eax,dword ptr __dst_adjust
04B7  29 D5				sub		ebp,edx
04B9  89 C2				mov		edx,eax
04BB  C1 FA 1F				sar		edx,0x1f
04BE  F7 FB				idiv		ebx
04C0  83 C4 08				add		esp,0x00000008
04C3  A1 00 00 00 00			mov		eax,dword ptr __end_dst
04C8  89 3D 08 00 00 00			mov		dword ptr __end_dst+0x8,edi
04CE  29 D0				sub		eax,edx
04D0  89 2D 04 00 00 00			mov		dword ptr __end_dst+0x4,ebp
04D6  A3 00 00 00 00			mov		dword ptr __end_dst,eax
04DB				L$31:
04DB  83 C4 04				add		esp,0x00000004
04DE  5D				pop		ebp
04DF  5F				pop		edi
04E0  5E				pop		esi
04E1  5B				pop		ebx
04E2  C3				ret		

Routine Size: 270 bytes,    Routine Base: _TEXT + 03D5

No disassembly errors

Segment: CONST DWORD USE32 00000003 bytes
0000				L$32:
0000  54 5A 00                                        TZ.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000009E bytes
0000				__start_dst:
0000  00 00 00 00 00 00 00 00 02 00 00 00 01 00 00 00 ................
0010  03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0020  00 00 00 00                                     ....
0024				__end_dst:
0024  00 00 00 00 00 00 00 00 01 00 00 00 05 00 00 00 ................
0034  09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
0044  00 00 00 00                                     ....
0048				timezone:
0048  50 46 00 00                                     PF..
004C				__dst_adjust:
004C  10 0E 00 00                                     ....
0050				daylight:
0050  01 00 00 00                                     ....
0054				stzone:
0054  45 53 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EST.............
0064  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0073				dtzone:
0073  45 44 54 00 00 00 00 00 00 00 00 00 00 00 00 00 EDT.............
0083  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ...............
0092				tzname:
0092  00 00 00 00                                     DD	offset stzone
0096  00 00 00 00                                     DD	offset dtzone
009A				tzFlag:
009A  01 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

