Module: winkey
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000007CF bytes
0000				_WindowsKeyUp:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  66 3D 10 00			cmp		ax,0x0010
0008  72 18				jb		L$3
000A  76 07				jbe		L$1
000C  66 3D 11 00			cmp		ax,0x0011
0010  74 09				je		L$2
0012  C3				ret		
0013				L$1:
0013  80 25 00 00 00 00 FD		and		byte ptr shiftState,0xfd
001A  C3				ret		
001B				L$2:
001B  80 25 00 00 00 00 F7		and		byte ptr shiftState,0xf7
0022				L$3:
0022  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 0000

0023				_WindowsKeyPush:
0023  53				push		ebx
0024  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0028  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
002E  88 9A 00 00 00 00			mov		byte ptr charList[edx],bl
0034  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
003A  8A 5C 24 0C			mov		bl,byte ptr 0xc[esp]
003E  88 9A 00 00 00 00			mov		byte ptr scanList[edx],bl
0044  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
004A  42				inc		edx
004B  BB 20 00 00 00			mov		ebx,0x00000020
0050  89 D0				mov		eax,edx
0052  C1 FA 1F				sar		edx,0x1f
0055  F7 FB				idiv		ebx
0057  89 15 00 00 00 00			mov		dword ptr keyTop,edx
005D  5B				pop		ebx
005E  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0023

005F				_WindowsVirtualKeyPush:
005F  53				push		ebx
0060  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0064  BA 01 00 00 00			mov		edx,0x00000001
0069  8A 4C 24 0C			mov		cl,byte ptr 0xc[esp]
006D  31 DB				xor		ebx,ebx
006F  66 3D 23 00			cmp		ax,0x0023
0073  72 1C				jb		L$4
0075  66 3D 25 00			cmp		ax,0x0025
0079  76 24				jbe		L$5
007B  66 3D 27 00			cmp		ax,0x0027
007F  72 2B				jb		L$6
0081  76 1C				jbe		L$5
0083  66 3D 2D 00			cmp		ax,0x002d
0087  72 23				jb		L$6
0089  66 3D 2E 00			cmp		ax,0x002e
008D  76 10				jbe		L$5
008F  EB 1B				jmp		L$6
0091				L$4:
0091  66 3D 08 00			cmp		ax,0x0008
0095  72 15				jb		L$6
0097  76 06				jbe		L$5
0099  66 3D 0D 00			cmp		ax,0x000d
009D  75 0D				jne		L$6
009F				L$5:
009F  31 DB				xor		ebx,ebx
00A1  66 89 C3				mov		bx,ax
00A4  B1 FF				mov		cl,0xff
00A6  81 C3 80 00 00 00			add		ebx,0x00000080
00AC				L$6:
00AC  85 D2				test		edx,edx
00AE  74 31				je		L$7
00B0  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
00B6  88 9A 00 00 00 00			mov		byte ptr charList[edx],bl
00BC  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
00C2  88 8A 00 00 00 00			mov		byte ptr scanList[edx],cl
00C8  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
00CE  42				inc		edx
00CF  BB 20 00 00 00			mov		ebx,0x00000020
00D4  89 D0				mov		eax,edx
00D6  C1 FA 1F				sar		edx,0x1f
00D9  F7 FB				idiv		ebx
00DB  89 15 00 00 00 00			mov		dword ptr keyTop,edx
00E1				L$7:
00E1  5B				pop		ebx
00E2  C3				ret		

Routine Size: 132 bytes,    Routine Base: _TEXT + 005F

00E3				_KeyboardHit:
00E3  A1 00 00 00 00			mov		eax,dword ptr keyTop
00E8  3B 05 00 00 00 00			cmp		eax,dword ptr keyBottom
00EE  74 06				je		L$9
00F0				L$8:
00F0  B8 01 00 00 00			mov		eax,0x00000001
00F5  C3				ret		
00F6				L$9:
00F6  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
00FB  74 09				je		L$10
00FD  6A 01				push		0x00000001
00FF  E8 00 00 00 00			call		_BlockingMessageLoop
0104  EB 07				jmp		L$11
0106				L$10:
0106  6A 01				push		0x00000001
0108  E8 00 00 00 00			call		_MessageLoop
010D				L$11:
010D  83 C4 04				add		esp,0x00000004
0110  A1 00 00 00 00			mov		eax,dword ptr keyTop
0115  8B 0D 00 00 00 00			mov		ecx,dword ptr keyBottom
011B  39 C8				cmp		eax,ecx
011D  75 D1				jne		L$8
011F  31 C8				xor		eax,ecx
0121  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 00E3

0122				_GetKeyboard:
0122  53				push		ebx
0123  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0127  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
012D  31 DB				xor		ebx,ebx
012F  8A 9A 00 00 00 00			mov		bl,byte ptr charList[edx]
0135  85 C9				test		ecx,ecx
0137  74 14				je		L$12
0139  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
013F  8A 92 00 00 00 00			mov		dl,byte ptr scanList[edx]
0145  81 E2 FF 00 00 00			and		edx,0x000000ff
014B  89 11				mov		dword ptr [ecx],edx
014D				L$12:
014D  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
0153  42				inc		edx
0154  B9 20 00 00 00			mov		ecx,0x00000020
0159  89 D0				mov		eax,edx
015B  C1 FA 1F				sar		edx,0x1f
015E  F7 F9				idiv		ecx
0160  89 15 00 00 00 00			mov		dword ptr keyBottom,edx
0166  89 D8				mov		eax,ebx
0168  5B				pop		ebx
0169  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0122

016A				_GetString:
016A  53				push		ebx
016B  56				push		esi
016C  57				push		edi
016D  55				push		ebp
016E  89 E5				mov		ebp,esp
0170  83 EC 40				sub		esp,0x00000040
0173  8B 45 1C				mov		eax,dword ptr 0x1c[ebp]
0176  31 D2				xor		edx,edx
0178  31 F6				xor		esi,esi
017A  89 45 E4				mov		dword ptr -0x1c[ebp],eax
017D  01 C0				add		eax,eax
017F  89 55 E8				mov		dword ptr -0x18[ebp],edx
0182  83 C0 02				add		eax,0x00000002
0185  89 55 F0				mov		dword ptr -0x10[ebp],edx
0188  50				push		eax
0189  89 55 EC				mov		dword ptr -0x14[ebp],edx
018C  89 55 C8				mov		dword ptr -0x38[ebp],edx
018F  E8 00 00 00 00			call		_MemAlloc
0194  83 C4 04				add		esp,0x00000004
0197  89 45 C0				mov		dword ptr -0x40[ebp],eax
019A  85 C0				test		eax,eax
019C  0F 84 8D 04 00 00			je		L$62
01A2  8B 45 14				mov		eax,dword ptr 0x14[ebp]
01A5  8B 40 3A				mov		eax,dword ptr 0x3a[eax]
01A8  56				push		esi
01A9  89 45 D4				mov		dword ptr -0x2c[ebp],eax
01AC  8B 45 14				mov		eax,dword ptr 0x14[ebp]
01AF  50				push		eax
01B0  E8 00 00 00 00			call		_GetLastLineNumber
01B5  83 C4 04				add		esp,0x00000004
01B8  50				push		eax
01B9  8B 55 14				mov		edx,dword ptr 0x14[ebp]
01BC  52				push		edx
01BD  E8 00 00 00 00			call		_MoveToLine
01C2  83 C4 0C				add		esp,0x0000000c
01C5  56				push		esi
01C6  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
01C9  53				push		ebx
01CA  E8 00 00 00 00			call		_NewCursor
01CF  83 C4 08				add		esp,0x00000008
01D2  6A 01				push		0x00000001
01D4  53				push		ebx
01D5  31 FF				xor		edi,edi
01D7  E8 00 00 00 00			call		_SetInputMode
01DC  8B 45 18				mov		eax,dword ptr 0x18[ebp]
01DF  83 C4 08				add		esp,0x00000008
01E2  89 3D 00 00 00 00			mov		dword ptr _GotEOF,edi
01E8  C6 00 00				mov		byte ptr [eax],0x00
01EB				L$13:
01EB  8B 45 14				mov		eax,dword ptr 0x14[ebp]
01EE  50				push		eax
01EF  89 70 5B				mov		dword ptr 0x5b[eax],esi
01F2  E8 00 00 00 00			call		_DisplayCursor
01F7  83 C4 04				add		esp,0x00000004
01FA				L$14:
01FA  6A 01				push		0x00000001
01FC  E8 00 00 00 00			call		_KeyboardHit
0201  83 C4 04				add		esp,0x00000004
0204  85 C0				test		eax,eax
0206  74 F2				je		L$14
0208  8D 45 CC				lea		eax,-0x34[ebp]
020B  50				push		eax
020C  E8 00 00 00 00			call		_GetKeyboard
0211  83 C4 04				add		esp,0x00000004
0214  8B 55 D4				mov		edx,dword ptr -0x2c[ebp]
0217  52				push		edx
0218  89 C3				mov		ebx,eax
021A  88 45 F8				mov		byte ptr -0x8[ebp],al
021D  E8 00 00 00 00			call		_HideCaret
0222  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
0226  74 1A				je		L$15
0228  56				push		esi
0229  8B 4D 18				mov		ecx,dword ptr 0x18[ebp]
022C  51				push		ecx
022D  31 FF				xor		edi,edi
022F  46				inc		esi
0230  E8 00 00 00 00			call		__mbsninc
0235  89 7D F0				mov		dword ptr -0x10[ebp],edi
0238  83 C4 08				add		esp,0x00000008
023B  88 18				mov		byte ptr [eax],bl
023D  E9 C2 04 00 00			jmp		L$72
0242				L$15:
0242  31 D2				xor		edx,edx
0244  88 DA				mov		dl,bl
0246  83 FA 16				cmp		edx,0x00000016
0249  74 0D				je		L$16
024B  81 7D CC FF 00 00 00		cmp		dword ptr -0x34[ebp],0x000000ff
0252  0F 84 B2 02 00 00			je		L$50
0258				L$16:
0258  31 C0				xor		eax,eax
025A  8A 45 F8				mov		al,byte ptr -0x8[ebp]
025D  83 F8 16				cmp		eax,0x00000016
0260  75 0D				jne		L$17
0262  BA 01 00 00 00			mov		edx,0x00000001
0267  B4 5E				mov		ah,0x5e
0269  89 55 F0				mov		dword ptr -0x10[ebp],edx
026C  88 65 F8				mov		byte ptr -0x8[ebp],ah
026F				L$17:
026F  8B 5D EC				mov		ebx,dword ptr -0x14[ebp]
0272  85 DB				test		ebx,ebx
0274  0F 84 EA 00 00 00			je		L$29
027A  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
027D  3B 45 E4				cmp		eax,dword ptr -0x1c[ebp]
0280  0F 8D 65 FF FF FF			jge		L$13
0286  8B 45 14				mov		eax,dword ptr 0x14[ebp]
0289  8B 40 63				mov		eax,dword ptr 0x63[eax]
028C  8B 7D E8				mov		edi,dword ptr -0x18[ebp]
028F  83 E8 02				sub		eax,0x00000002
0292  39 F8				cmp		eax,edi
0294  0F 9F C0				setg		al
0297  25 FF 00 00 00			and		eax,0x000000ff
029C  0F 84 49 FF FF FF			je		L$13
02A2  8B 45 C8				mov		eax,dword ptr -0x38[ebp]
02A5  85 C0				test		eax,eax
02A7  0F 85 98 00 00 00			jne		L$25
02AD  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
02B4  74 10				je		L$18
02B6  8A 45 F8				mov		al,byte ptr -0x8[ebp]
02B9  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
02BF  24 01				and		al,0x01
02C1  25 FF 00 00 00			and		eax,0x000000ff
02C6				L$18:
02C6  85 C0				test		eax,eax
02C8  74 44				je		L$22
02CA  56				push		esi
02CB  8B 55 18				mov		edx,dword ptr 0x18[ebp]
02CE  B8 01 00 00 00			mov		eax,0x00000001
02D3  52				push		edx
02D4  89 45 C8				mov		dword ptr -0x38[ebp],eax
02D7  E8 00 00 00 00			call		__mbsninc
02DC  89 C2				mov		edx,eax
02DE  83 C4 08				add		esp,0x00000008
02E1  89 C7				mov		edi,eax
02E3  89 C3				mov		ebx,eax
02E5  06				push		es
02E6  8C D8				mov		eax,ds
02E8  8E C0				mov		es,eax
02EA  29 C9				sub		ecx,ecx
02EC  49				dec		ecx
02ED  31 C0				xor		eax,eax
02EF  F2 AE				repne scasb	
02F1  F7 D1				not		ecx
02F3  49				dec		ecx
02F4  07				pop		es
02F5  89 CF				mov		edi,ecx
02F7  8D 04 0A				lea		eax,[edx+ecx]
02FA  EB 07				jmp		L$20
02FC				L$19:
02FC  8A 10				mov		dl,byte ptr [eax]
02FE  48				dec		eax
02FF  4F				dec		edi
0300  88 50 03				mov		byte ptr 0x3[eax],dl
0303				L$20:
0303  85 FF				test		edi,edi
0305  7D F5				jge		L$19
0307				L$21:
0307  8A 45 F8				mov		al,byte ptr -0x8[ebp]
030A  88 03				mov		byte ptr [ebx],al
030C  EB 4F				jmp		L$28
030E				L$22:
030E  56				push		esi
030F  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
0312  57				push		edi
0313  E8 00 00 00 00			call		__mbsninc
0318  89 C2				mov		edx,eax
031A  83 C4 08				add		esp,0x00000008
031D  89 C7				mov		edi,eax
031F  89 C3				mov		ebx,eax
0321  06				push		es
0322  8C D8				mov		eax,ds
0324  8E C0				mov		es,eax
0326  29 C9				sub		ecx,ecx
0328  49				dec		ecx
0329  31 C0				xor		eax,eax
032B  F2 AE				repne scasb	
032D  F7 D1				not		ecx
032F  49				dec		ecx
0330  07				pop		es
0331  89 CF				mov		edi,ecx
0333  8D 04 0A				lea		eax,[edx+ecx]
0336  EB 07				jmp		L$24
0338				L$23:
0338  8A 10				mov		dl,byte ptr [eax]
033A  48				dec		eax
033B  4F				dec		edi
033C  88 50 02				mov		byte ptr 0x2[eax],dl
033F				L$24:
033F  85 FF				test		edi,edi
0341  7D F5				jge		L$23
0343  EB C2				jmp		L$21
0345				L$25:
0345  56				push		esi
0346  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
0349  31 D2				xor		edx,edx
034B  53				push		ebx
034C  89 55 C8				mov		dword ptr -0x38[ebp],edx
034F  E8 00 00 00 00			call		__mbsninc
0354  8A 55 F8				mov		dl,byte ptr -0x8[ebp]
0357				L$26:
0357  83 C4 08				add		esp,0x00000008
035A				L$27:
035A  88 50 01				mov		byte ptr 0x1[eax],dl
035D				L$28:
035D  31 C0				xor		eax,eax
035F  E9 81 01 00 00			jmp		L$49
0364				L$29:
0364  8B 4D E8				mov		ecx,dword ptr -0x18[ebp]
0367  39 CE				cmp		esi,ecx
0369  0F 85 7D 00 00 00			jne		L$35
036F  3B 4D E4				cmp		ecx,dword ptr -0x1c[ebp]
0372  0F 8D 73 FE FF FF			jge		L$13
0378  83 7D C8 00			cmp		dword ptr -0x38[ebp],0x00000000
037C  75 51				jne		L$34
037E  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0385  74 14				je		L$30
0387  31 C0				xor		eax,eax
0389  8A 45 F8				mov		al,byte ptr -0x8[ebp]
038C  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
0392  24 01				and		al,0x01
0394  25 FF 00 00 00			and		eax,0x000000ff
0399  EB 02				jmp		L$31
039B				L$30:
039B  31 C0				xor		eax,eax
039D				L$31:
039D  74 12				je		L$32
039F  8B 55 E8				mov		edx,dword ptr -0x18[ebp]
03A2  52				push		edx
03A3  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
03A6  B8 01 00 00 00			mov		eax,0x00000001
03AB  53				push		ebx
03AC  89 45 C8				mov		dword ptr -0x38[ebp],eax
03AF  EB 08				jmp		L$33
03B1				L$32:
03B1  8B 4D E8				mov		ecx,dword ptr -0x18[ebp]
03B4  51				push		ecx
03B5  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
03B8  57				push		edi
03B9				L$33:
03B9  E8 00 00 00 00			call		__mbsninc
03BE  83 C4 08				add		esp,0x00000008
03C1  8A 55 F8				mov		dl,byte ptr -0x8[ebp]
03C4  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
03C8  88 10				mov		byte ptr [eax],dl
03CA  8A 50 02				mov		dl,byte ptr 0x2[eax]
03CD  EB 8B				jmp		L$27
03CF				L$34:
03CF  89 F0				mov		eax,esi
03D1  50				push		eax
03D2  8B 55 18				mov		edx,dword ptr 0x18[ebp]
03D5  31 FF				xor		edi,edi
03D7  52				push		edx
03D8  89 7D C8				mov		dword ptr -0x38[ebp],edi
03DB  E8 00 00 00 00			call		__mbsninc
03E0  8A 55 F8				mov		dl,byte ptr -0x8[ebp]
03E3  C6 40 02 00			mov		byte ptr 0x2[eax],0x00
03E7  E9 6B FF FF FF			jmp		L$26
03EC				L$35:
03EC  56				push		esi
03ED  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
03F0  57				push		edi
03F1  E8 00 00 00 00			call		__mbsninc
03F6  8B 55 C8				mov		edx,dword ptr -0x38[ebp]
03F9  83 C4 08				add		esp,0x00000008
03FC  89 45 D8				mov		dword ptr -0x28[ebp],eax
03FF  85 D2				test		edx,edx
0401  0F 85 D0 00 00 00			jne		L$47
0407  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
040E  74 14				je		L$36
0410  31 C0				xor		eax,eax
0412  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0415  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
041B  24 01				and		al,0x01
041D  25 FF 00 00 00			and		eax,0x000000ff
0422  EB 02				jmp		L$37
0424				L$36:
0424  31 C0				xor		eax,eax
0426				L$37:
0426  74 5F				je		L$43
0428  B8 01 00 00 00			mov		eax,0x00000001
042D  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
0433  89 45 C8				mov		dword ptr -0x38[ebp],eax
0436  85 D2				test		edx,edx
0438  74 16				je		L$38
043A  8B 55 D8				mov		edx,dword ptr -0x28[ebp]
043D  31 C0				xor		eax,eax
043F  8A 02				mov		al,byte ptr [edx]
0441  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
0447  24 01				and		al,0x01
0449  25 FF 00 00 00			and		eax,0x000000ff
044E  EB 02				jmp		L$39
0450				L$38:
0450  31 C0				xor		eax,eax
0452				L$39:
0452  75 29				jne		L$42
0454  8B 7D D8				mov		edi,dword ptr -0x28[ebp]
0457  47				inc		edi
0458  06				push		es
0459  8C D8				mov		eax,ds
045B  8E C0				mov		es,eax
045D  29 C9				sub		ecx,ecx
045F  49				dec		ecx
0460  31 C0				xor		eax,eax
0462  F2 AE				repne scasb	
0464  F7 D1				not		ecx
0466  49				dec		ecx
0467  07				pop		es
0468  8B 45 D8				mov		eax,dword ptr -0x28[ebp]
046B  89 CF				mov		edi,ecx
046D  01 C8				add		eax,ecx
046F  EB 08				jmp		L$41
0471				L$40:
0471  48				dec		eax
0472  8A 50 02				mov		dl,byte ptr 0x2[eax]
0475  4F				dec		edi
0476  88 50 03				mov		byte ptr 0x3[eax],dl
0479				L$41:
0479  85 FF				test		edi,edi
047B  7D F4				jge		L$40
047D				L$42:
047D  8B 55 D8				mov		edx,dword ptr -0x28[ebp]
0480  8A 45 F8				mov		al,byte ptr -0x8[ebp]
0483  88 02				mov		byte ptr [edx],al
0485  EB 59				jmp		L$48
0487				L$43:
0487  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
048E  74 12				je		L$44
0490  8B 55 D8				mov		edx,dword ptr -0x28[ebp]
0493  8A 02				mov		al,byte ptr [edx]
0495  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
049B  24 01				and		al,0x01
049D  25 FF 00 00 00			and		eax,0x000000ff
04A2				L$44:
04A2  85 C0				test		eax,eax
04A4  74 D7				je		L$42
04A6  BB 01 00 00 00			mov		ebx,0x00000001
04AB  8B 45 D8				mov		eax,dword ptr -0x28[ebp]
04AE  01 D8				add		eax,ebx
04B0  89 45 DC				mov		dword ptr -0x24[ebp],eax
04B3  89 C2				mov		edx,eax
04B5  EB 07				jmp		L$46
04B7				L$45:
04B7  8A 42 01				mov		al,byte ptr 0x1[edx]
04BA  43				inc		ebx
04BB  88 02				mov		byte ptr [edx],al
04BD  42				inc		edx
04BE				L$46:
04BE  8B 7D DC				mov		edi,dword ptr -0x24[ebp]
04C1  06				push		es
04C2  8C D8				mov		eax,ds
04C4  8E C0				mov		es,eax
04C6  29 C9				sub		ecx,ecx
04C8  49				dec		ecx
04C9  31 C0				xor		eax,eax
04CB  F2 AE				repne scasb	
04CD  F7 D1				not		ecx
04CF  49				dec		ecx
04D0  07				pop		es
04D1  39 CB				cmp		ebx,ecx
04D3  76 E2				jbe		L$45
04D5  EB A6				jmp		L$42
04D7				L$47:
04D7  8A 55 F8				mov		dl,byte ptr -0x8[ebp]
04DA  89 5D C8				mov		dword ptr -0x38[ebp],ebx
04DD  88 50 01				mov		byte ptr 0x1[eax],dl
04E0				L$48:
04E0  B8 01 00 00 00			mov		eax,0x00000001
04E5				L$49:
04E5  83 7D F0 00			cmp		dword ptr -0x10[ebp],0x00000000
04E9  0F 85 15 02 00 00			jne		L$72
04EF  83 7D C8 00			cmp		dword ptr -0x38[ebp],0x00000000
04F3  0F 85 0B 02 00 00			jne		L$72
04F9  46				inc		esi
04FA  85 C0				test		eax,eax
04FC  0F 85 02 02 00 00			jne		L$72
0502  FF 45 E8				inc		dword ptr -0x18[ebp]
0505  E9 FA 01 00 00			jmp		L$72
050A				L$50:
050A  88 D8				mov		al,bl
050C  81 FA 80 00 00 00			cmp		edx,0x00000080
0512  7C 02				jl		L$51
0514  2C 80				sub		al,0x80
0516				L$51:
0516  3C 24				cmp		al,0x24
0518  72 37				jb		L$53
051A  76 51				jbe		L$55
051C  3C 27				cmp		al,0x27
051E  72 24				jb		L$52
0520  8D 56 01				lea		edx,0x1[esi]
0523  0F 86 1D 01 00 00			jbe		L$64
0529  3C 2D				cmp		al,0x2d
052B  0F 82 BA FC FF FF			jb		L$13
0531  0F 86 A6 01 00 00			jbe		L$69
0537  3C 2E				cmp		al,0x2e
0539  0F 84 17 01 00 00			je		L$65
053F  E9 A7 FC FF FF			jmp		L$13
0544				L$52:
0544  3C 25				cmp		al,0x25
0546  0F 84 EC 00 00 00			je		L$63
054C  E9 9A FC FF FF			jmp		L$13
0551				L$53:
0551  3C 0D				cmp		al,0x0d
0553  72 0B				jb		L$54
0555  76 25				jbe		L$57
0557  3C 23				cmp		al,0x23
0559  74 19				je		L$56
055B  E9 8B FC FF FF			jmp		L$13
0560				L$54:
0560  3C 08				cmp		al,0x08
0562  0F 84 FD 00 00 00			je		L$66
0568  E9 7E FC FF FF			jmp		L$13
056D				L$55:
056D  31 F6				xor		esi,esi
056F  E9 90 01 00 00			jmp		L$72
0574				L$56:
0574  8B 75 E8				mov		esi,dword ptr -0x18[ebp]
0577  E9 88 01 00 00			jmp		L$72
057C				L$57:
057C  8B 75 E8				mov		esi,dword ptr -0x18[ebp]
057F  56				push		esi
0580  8B 7D 18				mov		edi,dword ptr 0x18[ebp]
0583  57				push		edi
0584  E8 00 00 00 00			call		__mbsninc
0589  83 C4 08				add		esp,0x00000008
058C  6A 02				push		0x00000002
058E  C6 00 00				mov		byte ptr [eax],0x00
0591  8B 45 14				mov		eax,dword ptr 0x14[ebp]
0594  50				push		eax
0595  E8 00 00 00 00			call		_NewCursor
059A  83 C4 08				add		esp,0x00000008
059D  6A 01				push		0x00000001
059F  57				push		edi
05A0  E8 00 00 00 00			call		__mbslen
05A5  83 C4 04				add		esp,0x00000004
05A8  50				push		eax
05A9  57				push		edi
05AA  8B 4D 14				mov		ecx,dword ptr 0x14[ebp]
05AD  51				push		ecx
05AE  E8 00 00 00 00			call		_UpdateInputLine
05B3  83 C4 10				add		esp,0x00000010
05B6  6A 00				push		0x00000000
05B8  8B 75 14				mov		esi,dword ptr 0x14[ebp]
05BB  56				push		esi
05BC  89 FB				mov		ebx,edi
05BE  E8 00 00 00 00			call		_SetInputMode
05C3  83 C4 08				add		esp,0x00000008
05C6  89 FE				mov		esi,edi
05C8  8B 7D C0				mov		edi,dword ptr -0x40[ebp]
05CB  06				push		es
05CC  1E				push		ds
05CD  07				pop		es
05CE  57				push		edi
05CF  2B C9				sub		ecx,ecx
05D1  49				dec		ecx
05D2  B0 00				mov		al,0x00
05D4  F2 AE				repne scasb	
05D6  4F				dec		edi
05D7				L$58:
05D7  8A 06				mov		al,byte ptr [esi]
05D9  88 07				mov		byte ptr [edi],al
05DB  3C 00				cmp		al,0x00
05DD  74 10				je		L$59
05DF  8A 46 01				mov		al,byte ptr 0x1[esi]
05E2  83 C6 02				add		esi,0x00000002
05E5  88 47 01				mov		byte ptr 0x1[edi],al
05E8  83 C7 02				add		edi,0x00000002
05EB  3C 00				cmp		al,0x00
05ED  75 E8				jne		L$58
05EF				L$59:
05EF  5F				pop		edi
05F0  07				pop		es
05F1  89 FE				mov		esi,edi
05F3  89 DF				mov		edi,ebx
05F5  57				push		edi
05F6				L$60:
05F6  8A 06				mov		al,byte ptr [esi]
05F8  88 07				mov		byte ptr [edi],al
05FA  3C 00				cmp		al,0x00
05FC  74 10				je		L$61
05FE  8A 46 01				mov		al,byte ptr 0x1[esi]
0601  83 C6 02				add		esi,0x00000002
0604  88 47 01				mov		byte ptr 0x1[edi],al
0607  83 C7 02				add		edi,0x00000002
060A  3C 00				cmp		al,0x00
060C  75 E8				jne		L$60
060E				L$61:
060E  5F				pop		edi
060F  8B 7D C0				mov		edi,dword ptr -0x40[ebp]
0612  57				push		edi
0613  E8 00 00 00 00			call		_MemFree
0618  83 C4 04				add		esp,0x00000004
061B  89 DF				mov		edi,ebx
061D  06				push		es
061E  8C D8				mov		eax,ds
0620  8E C0				mov		es,eax
0622  29 C9				sub		ecx,ecx
0624  49				dec		ecx
0625  31 C0				xor		eax,eax
0627  F2 AE				repne scasb	
0629  F7 D1				not		ecx
062B  49				dec		ecx
062C  07				pop		es
062D  89 CE				mov		esi,ecx
062F				L$62:
062F  89 F0				mov		eax,esi
0631  89 EC				mov		esp,ebp
0633  5D				pop		ebp
0634  5F				pop		edi
0635  5E				pop		esi
0636  5B				pop		ebx
0637  C3				ret		
0638				L$63:
0638  85 F6				test		esi,esi
063A  0F 8E C4 00 00 00			jle		L$72
0640  4E				dec		esi
0641  E9 BE 00 00 00			jmp		L$72
0646				L$64:
0646  3B 75 E8				cmp		esi,dword ptr -0x18[ebp]
0649  0F 8D B5 00 00 00			jge		L$72
064F  89 D6				mov		esi,edx
0651  E9 AE 00 00 00			jmp		L$72
0656				L$65:
0656  8B 45 E8				mov		eax,dword ptr -0x18[ebp]
0659  39 C6				cmp		esi,eax
065B  0F 84 A3 00 00 00			je		L$72
0661  7D 02				jge		L$66
0663  89 D6				mov		esi,edx
0665				L$66:
0665  85 F6				test		esi,esi
0667  0F 8E 97 00 00 00			jle		L$72
066D  8D 46 FF				lea		eax,-0x1[esi]
0670  50				push		eax
0671  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0674  50				push		eax
0675  89 F7				mov		edi,esi
0677  8D 5E 01				lea		ebx,0x1[esi]
067A  E8 00 00 00 00			call		__mbsninc
067F  89 45 F4				mov		dword ptr -0xc[ebp],eax
0682  89 F0				mov		eax,esi
0684  F7 D8				neg		eax
0686  83 C4 08				add		esp,0x00000008
0689  01 C3				add		ebx,eax
068B  EB 30				jmp		L$68
068D				L$67:
068D  89 F8				mov		eax,edi
068F  53				push		ebx
0690  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
0693  29 F0				sub		eax,esi
0695  51				push		ecx
0696  89 45 D0				mov		dword ptr -0x30[ebp],eax
0699  E8 00 00 00 00			call		__mbsninc
069E  83 C4 08				add		esp,0x00000008
06A1  50				push		eax
06A2  8B 45 D0				mov		eax,dword ptr -0x30[ebp]
06A5  50				push		eax
06A6  8B 55 F4				mov		edx,dword ptr -0xc[ebp]
06A9  52				push		edx
06AA  E8 00 00 00 00			call		__mbsninc
06AF  83 C4 08				add		esp,0x00000008
06B2  50				push		eax
06B3  43				inc		ebx
06B4  47				inc		edi
06B5  E8 00 00 00 00			call		_mbccpy
06BA  83 C4 08				add		esp,0x00000008
06BD				L$68:
06BD  3B 7D E8				cmp		edi,dword ptr -0x18[ebp]
06C0  7C CB				jl		L$67
06C2  4F				dec		edi
06C3  57				push		edi
06C4  8B 55 18				mov		edx,dword ptr 0x18[ebp]
06C7  8B 5D E8				mov		ebx,dword ptr -0x18[ebp]
06CA  52				push		edx
06CB  4E				dec		esi
06CC  4B				dec		ebx
06CD  E8 00 00 00 00			call		__mbsninc
06D2  89 5D E8				mov		dword ptr -0x18[ebp],ebx
06D5  83 C4 08				add		esp,0x00000008
06D8  C6 00 00				mov		byte ptr [eax],0x00
06DB  EB 27				jmp		L$72
06DD				L$69:
06DD  83 7D EC 00			cmp		dword ptr -0x14[ebp],0x00000000
06E1  74 0C				je		L$70
06E3  31 D2				xor		edx,edx
06E5  52				push		edx
06E6  8B 5D 14				mov		ebx,dword ptr 0x14[ebp]
06E9  53				push		ebx
06EA  89 55 EC				mov		dword ptr -0x14[ebp],edx
06ED  EB 0D				jmp		L$71
06EF				L$70:
06EF  BF 01 00 00 00			mov		edi,0x00000001
06F4  57				push		edi
06F5  8B 45 14				mov		eax,dword ptr 0x14[ebp]
06F8  50				push		eax
06F9  89 7D EC				mov		dword ptr -0x14[ebp],edi
06FC				L$71:
06FC  E8 00 00 00 00			call		_NewCursor
0701  83 C4 08				add		esp,0x00000008
0704				L$72:
0704  8B 45 C8				mov		eax,dword ptr -0x38[ebp]
0707  6A 00				push		0x00000000
0709  85 C0				test		eax,eax
070B  74 0F				je		L$73
070D  8B 5D 18				mov		ebx,dword ptr 0x18[ebp]
0710  53				push		ebx
0711  E8 00 00 00 00			call		__mbslen
0716  83 C4 04				add		esp,0x00000004
0719  48				dec		eax
071A  EB 0C				jmp		L$74
071C				L$73:
071C  8B 55 18				mov		edx,dword ptr 0x18[ebp]
071F  52				push		edx
0720  E8 00 00 00 00			call		__mbslen
0725  83 C4 04				add		esp,0x00000004
0728				L$74:
0728  50				push		eax
0729  8B 4D 18				mov		ecx,dword ptr 0x18[ebp]
072C  51				push		ecx
072D  8B 7D 14				mov		edi,dword ptr 0x14[ebp]
0730  57				push		edi
0731  E8 00 00 00 00			call		_UpdateInputLine
0736  89 C3				mov		ebx,eax
0738  83 C4 10				add		esp,0x00000010
073B  89 45 E0				mov		dword ptr -0x20[ebp],eax
073E  85 C0				test		eax,eax
0740  0F 8C A5 FA FF FF			jl		L$13
0746  8B 45 18				mov		eax,dword ptr 0x18[ebp]
0749  50				push		eax
074A  E8 00 00 00 00			call		__mbslen
074F  83 C4 04				add		esp,0x00000004
0752  89 45 C4				mov		dword ptr -0x3c[ebp],eax
0755  29 D8				sub		eax,ebx
0757  50				push		eax
0758  8B 55 18				mov		edx,dword ptr 0x18[ebp]
075B  8B 75 18				mov		esi,dword ptr 0x18[ebp]
075E  52				push		edx
075F  8B 7D C0				mov		edi,dword ptr -0x40[ebp]
0762  89 C3				mov		ebx,eax
0764  E8 00 00 00 00			call		__mbsninc
0769  89 C2				mov		edx,eax
076B  8A 00				mov		al,byte ptr [eax]
076D  83 C4 08				add		esp,0x00000008
0770  88 45 FC				mov		byte ptr -0x4[ebp],al
0773  C6 02 00				mov		byte ptr [edx],0x00
0776  06				push		es
0777  1E				push		ds
0778  07				pop		es
0779  57				push		edi
077A  2B C9				sub		ecx,ecx
077C  49				dec		ecx
077D  B0 00				mov		al,0x00
077F  F2 AE				repne scasb	
0781  4F				dec		edi
0782				L$75:
0782  8A 06				mov		al,byte ptr [esi]
0784  88 07				mov		byte ptr [edi],al
0786  3C 00				cmp		al,0x00
0788  74 10				je		L$76
078A  8A 46 01				mov		al,byte ptr 0x1[esi]
078D  83 C6 02				add		esi,0x00000002
0790  88 47 01				mov		byte ptr 0x1[edi],al
0793  83 C7 02				add		edi,0x00000002
0796  3C 00				cmp		al,0x00
0798  75 E8				jne		L$75
079A				L$76:
079A  5F				pop		edi
079B  07				pop		es
079C  8A 45 FC				mov		al,byte ptr -0x4[ebp]
079F  88 02				mov		byte ptr [edx],al
07A1  8B 45 18				mov		eax,dword ptr 0x18[ebp]
07A4  31 F6				xor		esi,esi
07A6  8D 14 18				lea		edx,[eax+ebx]
07A9  EB 07				jmp		L$78
07AB				L$77:
07AB  46				inc		esi
07AC  8A 1A				mov		bl,byte ptr [edx]
07AE  42				inc		edx
07AF  88 18				mov		byte ptr [eax],bl
07B1  40				inc		eax
07B2				L$78:
07B2  8B 5D E0				mov		ebx,dword ptr -0x20[ebp]
07B5  39 DE				cmp		esi,ebx
07B7  7E F2				jle		L$77
07B9  8B 45 C4				mov		eax,dword ptr -0x3c[ebp]
07BC  8B 4D E4				mov		ecx,dword ptr -0x1c[ebp]
07BF  40				inc		eax
07C0  89 DE				mov		esi,ebx
07C2  29 C1				sub		ecx,eax
07C4  89 5D E8				mov		dword ptr -0x18[ebp],ebx
07C7  89 4D E4				mov		dword ptr -0x1c[ebp],ecx
07CA  E9 1C FA FF FF			jmp		L$13

Routine Size: 1637 bytes,    Routine Base: _TEXT + 016A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				keyTop:
0000  00 00 00 00                                     ....
0004				keyBottom:
0004  00 00 00 00                                     ....
0008				shiftState:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000040 bytes
0000				charList:
0020				scanList:

BSS Size: 64 bytes

