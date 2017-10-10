Module: windlg2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000003AE bytes
0000				copyString:
0000  53				push		ebx
0001  56				push		esi
0002  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0006  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
000A  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000E  89 D0				mov		eax,edx
0010  C1 FA 1F				sar		edx,0x1f
0013  2B C2				sub		eax,edx
0015  D1 F8				sar		eax,0x01
0017  31 F6				xor		esi,esi
0019  89 C2				mov		edx,eax
001B  EB 0C				jmp		L$2
001D				L$1:
001D  31 C0				xor		eax,eax
001F  46				inc		esi
0020  8A 01				mov		al,byte ptr [ecx]
0022  41				inc		ecx
0023  66 89 03				mov		word ptr [ebx],ax
0026  83 C3 02				add		ebx,0x00000002
0029				L$2:
0029  39 D6				cmp		esi,edx
002B  7C F0				jl		L$1
002D  89 D8				mov		eax,ebx
002F  5E				pop		esi
0030  5B				pop		ebx
0031  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0000

0032				_DialogTemplate:
0032  53				push		ebx
0033  56				push		esi
0034  57				push		edi
0035  55				push		ebp
0036  83 EC 08				sub		esp,0x00000008
0039  8B 7C 24 30			mov		edi,dword ptr 0x30[esp]
003D  06				push		es
003E  8C D8				mov		eax,ds
0040  8E C0				mov		es,eax
0042  29 C9				sub		ecx,ecx
0044  49				dec		ecx
0045  31 C0				xor		eax,eax
0047  F2 AE				repne scasb	
0049  F7 D1				not		ecx
004B  49				dec		ecx
004C  07				pop		es
004D  8D 1C 09				lea		ebx,[ecx+ecx]
0050  8D 43 02				lea		eax,0x2[ebx]
0053  8B 7C 24 34			mov		edi,dword ptr 0x34[esp]
0057  89 44 24 04			mov		dword ptr 0x4[esp],eax
005B  06				push		es
005C  8C D8				mov		eax,ds
005E  8E C0				mov		es,eax
0060  29 C9				sub		ecx,ecx
0062  49				dec		ecx
0063  31 C0				xor		eax,eax
0065  F2 AE				repne scasb	
0067  F7 D1				not		ecx
0069  49				dec		ecx
006A  07				pop		es
006B  01 C9				add		ecx,ecx
006D  8B 7C 24 38			mov		edi,dword ptr 0x38[esp]
0071  8D 69 02				lea		ebp,0x2[ecx]
0074  83 C3 18				add		ebx,0x00000018
0077  06				push		es
0078  8C D8				mov		eax,ds
007A  8E C0				mov		es,eax
007C  29 C9				sub		ecx,ecx
007E  49				dec		ecx
007F  31 C0				xor		eax,eax
0081  F2 AE				repne scasb	
0083  F7 D1				not		ecx
0085  49				dec		ecx
0086  07				pop		es
0087  01 C9				add		ecx,ecx
0089  01 EB				add		ebx,ebp
008B  8D 71 02				lea		esi,0x2[ecx]
008E  01 F3				add		ebx,esi
0090  83 C3 03				add		ebx,0x00000003
0093  8A 64 24 1C			mov		ah,byte ptr 0x1c[esp]
0097  80 E3 FC				and		bl,0xfc
009A  F6 C4 40				test		ah,0x40
009D  74 25				je		L$3
009F  8B 7C 24 40			mov		edi,dword ptr 0x40[esp]
00A3  06				push		es
00A4  8C D8				mov		eax,ds
00A6  8E C0				mov		es,eax
00A8  29 C9				sub		ecx,ecx
00AA  49				dec		ecx
00AB  31 C0				xor		eax,eax
00AD  F2 AE				repne scasb	
00AF  F7 D1				not		ecx
00B1  49				dec		ecx
00B2  07				pop		es
00B3  01 C9				add		ecx,ecx
00B5  89 C8				mov		eax,ecx
00B7  83 C1 02				add		ecx,0x00000002
00BA  83 C0 04				add		eax,0x00000004
00BD  89 0C 24				mov		dword ptr [esp],ecx
00C0  01 C3				add		ebx,eax
00C2  EB 05				jmp		L$4
00C4				L$3:
00C4  31 D2				xor		edx,edx
00C6  89 14 24				mov		dword ptr [esp],edx
00C9				L$4:
00C9  53				push		ebx
00CA  6A 42				push		0x00000042
00CC  E8 00 00 00 00			call		_GlobalAlloc
00D1  89 C7				mov		edi,eax
00D3  85 C0				test		eax,eax
00D5  0F 84 96 00 00 00			je		L$6
00DB  50				push		eax
00DC  E8 00 00 00 00			call		_GlobalLock
00E1  89 18				mov		dword ptr [eax],ebx
00E3  83 C0 04				add		eax,0x00000004
00E6  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
00EA  89 18				mov		dword ptr [eax],ebx
00EC  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
00F0  66 89 58 0A			mov		word ptr 0xa[eax],bx
00F4  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
00F8  66 89 58 0C			mov		word ptr 0xc[eax],bx
00FC  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
0100  66 89 58 0E			mov		word ptr 0xe[eax],bx
0104  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
0108  66 89 58 10			mov		word ptr 0x10[eax],bx
010C  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
0110  53				push		ebx
0111  8B 4C 24 34			mov		ecx,dword ptr 0x34[esp]
0115  51				push		ecx
0116  83 C0 12				add		eax,0x00000012
0119  50				push		eax
011A  66 C7 40 F6 00 00			mov		word ptr -0xa[eax],0x0000
0120  E8 00 00 00 00			call		copyString
0125  83 C4 0C				add		esp,0x0000000c
0128  55				push		ebp
0129  8B 6C 24 38			mov		ebp,dword ptr 0x38[esp]
012D  55				push		ebp
012E  50				push		eax
012F  E8 00 00 00 00			call		copyString
0134  83 C4 0C				add		esp,0x0000000c
0137  56				push		esi
0138  8B 54 24 3C			mov		edx,dword ptr 0x3c[esp]
013C  52				push		edx
013D  50				push		eax
013E  E8 00 00 00 00			call		copyString
0143  83 C4 0C				add		esp,0x0000000c
0146  F6 44 24 1C 40			test		byte ptr 0x1c[esp],0x40
014B  74 1C				je		L$5
014D  8B 5C 24 3C			mov		ebx,dword ptr 0x3c[esp]
0151  66 89 18				mov		word ptr [eax],bx
0154  8B 1C 24				mov		ebx,dword ptr [esp]
0157  53				push		ebx
0158  8B 4C 24 44			mov		ecx,dword ptr 0x44[esp]
015C  51				push		ecx
015D  83 C0 02				add		eax,0x00000002
0160  50				push		eax
0161  E8 00 00 00 00			call		copyString
0166  83 C4 0C				add		esp,0x0000000c
0169				L$5:
0169  57				push		edi
016A  E8 00 00 00 00			call		_GlobalUnlock
016F  89 F8				mov		eax,edi
0171				L$6:
0171  83 C4 08				add		esp,0x00000008
0174  5D				pop		ebp
0175  5F				pop		edi
0176  5E				pop		esi
0177  5B				pop		ebx
0178  C3				ret		

Routine Size: 327 bytes,    Routine Base: _TEXT + 0032

0179				_AddControl:
0179  53				push		ebx
017A  56				push		esi
017B  57				push		edi
017C  55				push		ebp
017D  83 EC 10				sub		esp,0x00000010
0180  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0184  8B 5C 24 40			mov		ebx,dword ptr 0x40[esp]
0188  8A 64 24 3F			mov		ah,byte ptr 0x3f[esp]
018C  68 00 00 00 00			push		offset DGROUP:L$12
0191  BA 02 00 00 00			mov		edx,0x00000002
0196  80 CC 40				or		ah,0x40
0199  53				push		ebx
019A  89 54 24 10			mov		dword ptr 0x10[esp],edx
019E  88 64 24 47			mov		byte ptr 0x47[esp],ah
01A2  E8 00 00 00 00			call		stricmp
01A7  83 C4 08				add		esp,0x00000008
01AA  85 C0				test		eax,eax
01AC  75 07				jne		L$7
01AE  C6 44 24 0C 83			mov		byte ptr 0xc[esp],0x83
01B3  EB 49				jmp		L$10
01B5				L$7:
01B5  68 08 00 00 00			push		offset DGROUP:L$13
01BA  53				push		ebx
01BB  E8 00 00 00 00			call		stricmp
01C0  83 C4 08				add		esp,0x00000008
01C3  85 C0				test		eax,eax
01C5  75 07				jne		L$8
01C7  C6 44 24 0C 82			mov		byte ptr 0xc[esp],0x82
01CC  EB 30				jmp		L$10
01CE				L$8:
01CE  68 0F 00 00 00			push		offset DGROUP:L$14
01D3  53				push		ebx
01D4  E8 00 00 00 00			call		stricmp
01D9  83 C4 08				add		esp,0x00000008
01DC  85 C0				test		eax,eax
01DE  75 07				jne		L$9
01E0  C6 44 24 0C 81			mov		byte ptr 0xc[esp],0x81
01E5  EB 17				jmp		L$10
01E7				L$9:
01E7  68 14 00 00 00			push		offset DGROUP:L$15
01EC  53				push		ebx
01ED  E8 00 00 00 00			call		stricmp
01F2  83 C4 08				add		esp,0x00000008
01F5  85 C0				test		eax,eax
01F7  75 05				jne		L$10
01F9  C6 44 24 0C 80			mov		byte ptr 0xc[esp],0x80
01FE				L$10:
01FE  8B 7C 24 44			mov		edi,dword ptr 0x44[esp]
0202  31 D2				xor		edx,edx
0204  30 C9				xor		cl,cl
0206  8A 54 24 48			mov		dl,byte ptr 0x48[esp]
020A  88 4C 24 0D			mov		byte ptr 0xd[esp],cl
020E  06				push		es
020F  8C D8				mov		eax,ds
0211  8E C0				mov		es,eax
0213  29 C9				sub		ecx,ecx
0215  49				dec		ecx
0216  31 C0				xor		eax,eax
0218  F2 AE				repne scasb	
021A  F7 D1				not		ecx
021C  49				dec		ecx
021D  07				pop		es
021E  01 C9				add		ecx,ecx
0220  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0224  83 C1 02				add		ecx,0x00000002
0227  83 C0 14				add		eax,0x00000014
022A  89 54 24 04			mov		dword ptr 0x4[esp],edx
022E  01 C8				add		eax,ecx
0230  56				push		esi
0231  8D 58 02				lea		ebx,0x2[eax]
0234  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0238  01 D3				add		ebx,edx
023A  E8 00 00 00 00			call		_GlobalLock
023F  56				push		esi
0240  83 C3 07				add		ebx,0x00000007
0243  8B 38				mov		edi,dword ptr [eax]
0245  E8 00 00 00 00			call		_GlobalUnlock
024A  80 E3 F8				and		bl,0xf8
024D  6A 42				push		0x00000042
024F  01 FB				add		ebx,edi
0251  53				push		ebx
0252  56				push		esi
0253  E8 00 00 00 00			call		_GlobalReAlloc
0258  89 C5				mov		ebp,eax
025A  85 C0				test		eax,eax
025C  0F 84 CD 00 00 00			je		L$11
0262  50				push		eax
0263  E8 00 00 00 00			call		_GlobalLock
0268  89 C3				mov		ebx,eax
026A  66 8B 50 0C			mov		dx,word ptr 0xc[eax]
026E  83 C0 04				add		eax,0x00000004
0271  42				inc		edx
0272  66 89 50 08			mov		word ptr 0x8[eax],dx
0276  8B 03				mov		eax,dword ptr [ebx]
0278  01 D8				add		eax,ebx
027A  8B 54 24 3C			mov		edx,dword ptr 0x3c[esp]
027E  89 10				mov		dword ptr [eax],edx
0280  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
0284  66 89 50 08			mov		word ptr 0x8[eax],dx
0288  8B 54 24 2C			mov		edx,dword ptr 0x2c[esp]
028C  66 89 50 0A			mov		word ptr 0xa[eax],dx
0290  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
0294  66 89 50 0C			mov		word ptr 0xc[eax],dx
0298  8B 54 24 34			mov		edx,dword ptr 0x34[esp]
029C  66 89 50 0E			mov		word ptr 0xe[eax],dx
02A0  8B 54 24 38			mov		edx,dword ptr 0x38[esp]
02A4  8D 74 24 0C			lea		esi,0xc[esp]
02A8  66 89 50 10			mov		word ptr 0x10[eax],dx
02AC  8D 50 14				lea		edx,0x14[eax]
02AF  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
02B3  89 D7				mov		edi,edx
02B5  66 C7 40 12 FF FF			mov		word ptr 0x12[eax],0xffff
02BB  06				push		es
02BC  8C D8				mov		eax,ds
02BE  8E C0				mov		es,eax
02C0  57				push		edi
02C1  89 C8				mov		eax,ecx
02C3  C1 E9 02				shr		ecx,0x02
02C6  F2 A5				repne movsd	
02C8  8A C8				mov		cl,al
02CA  80 E1 03				and		cl,0x03
02CD  F2 A4				repne movsb	
02CF  5F				pop		edi
02D0  07				pop		es
02D1  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
02D5  40				inc		eax
02D6  24 FE				and		al,0xfe
02D8  01 C2				add		edx,eax
02DA  8B 04 24				mov		eax,dword ptr [esp]
02DD  50				push		eax
02DE  8B 4C 24 48			mov		ecx,dword ptr 0x48[esp]
02E2  51				push		ecx
02E3  52				push		edx
02E4  E8 00 00 00 00			call		copyString
02E9  89 C2				mov		edx,eax
02EB  83 C4 0C				add		esp,0x0000000c
02EE  30 E4				xor		ah,ah
02F0  8A 44 24 48			mov		al,byte ptr 0x48[esp]
02F4  8B 4C 24 04			mov		ecx,dword ptr 0x4[esp]
02F8  66 89 02				mov		word ptr [edx],ax
02FB  83 C2 02				add		edx,0x00000002
02FE  8B 74 24 4C			mov		esi,dword ptr 0x4c[esp]
0302  89 D7				mov		edi,edx
0304  06				push		es
0305  8C D8				mov		eax,ds
0307  8E C0				mov		es,eax
0309  57				push		edi
030A  89 C8				mov		eax,ecx
030C  C1 E9 02				shr		ecx,0x02
030F  F2 A5				repne movsd	
0311  8A C8				mov		cl,al
0313  80 E1 03				and		cl,0x03
0316  F2 A4				repne movsb	
0318  5F				pop		edi
0319  07				pop		es
031A  03 54 24 04			add		edx,dword ptr 0x4[esp]
031E  29 DA				sub		edx,ebx
0320  8D 42 03				lea		eax,0x3[edx]
0323  24 FC				and		al,0xfc
0325  55				push		ebp
0326  89 03				mov		dword ptr [ebx],eax
0328  E8 00 00 00 00			call		_GlobalUnlock
032D  89 E8				mov		eax,ebp
032F				L$11:
032F  83 C4 10				add		esp,0x00000010
0332  5D				pop		ebp
0333  5F				pop		edi
0334  5E				pop		esi
0335  5B				pop		ebx
0336  C3				ret		

Routine Size: 446 bytes,    Routine Base: _TEXT + 0179

0337				_DoneAddingControls:
0337  53				push		ebx
0338  56				push		esi
0339  57				push		edi
033A  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
033E  52				push		edx
033F  E8 00 00 00 00			call		_GlobalLock
0344  8B 08				mov		ecx,dword ptr [eax]
0346  8D 70 04				lea		esi,0x4[eax]
0349  83 E9 02				sub		ecx,0x00000002
034C  89 C7				mov		edi,eax
034E  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
0352  06				push		es
0353  8C D8				mov		eax,ds
0355  8E C0				mov		es,eax
0357  57				push		edi
0358  89 C8				mov		eax,ecx
035A  C1 E9 02				shr		ecx,0x02
035D  F2 A5				repne movsd	
035F  8A C8				mov		cl,al
0361  80 E1 03				and		cl,0x03
0364  F2 A4				repne movsb	
0366  5F				pop		edi
0367  07				pop		es
0368  53				push		ebx
0369  E8 00 00 00 00			call		_GlobalUnlock
036E  5F				pop		edi
036F  5E				pop		esi
0370  5B				pop		ebx
0371  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0337

0372				_DynamicDialogBox:
0372  53				push		ebx
0373  56				push		esi
0374  57				push		edi
0375  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0379  52				push		edx
037A  E8 00 00 00 00			call		_GlobalLock
037F  6A 00				push		0x00000000
0381  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0385  53				push		ebx
0386  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
038A  51				push		ecx
038B  50				push		eax
038C  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
0390  56				push		esi
0391  8B 7C 24 30			mov		edi,dword ptr 0x30[esp]
0395  E8 00 00 00 00			call		_DialogBoxIndirectParamA
039A  57				push		edi
039B  89 C3				mov		ebx,eax
039D  E8 00 00 00 00			call		_GlobalUnlock
03A2  57				push		edi
03A3  E8 00 00 00 00			call		_GlobalFree
03A8  89 D8				mov		eax,ebx
03AA  5F				pop		edi
03AB  5E				pop		esi
03AC  5B				pop		ebx
03AD  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0372

No disassembly errors

Segment: CONST DWORD USE32 0000001B bytes
0000				L$12:
0000  6C 69 73 74 62 6F 78 00                         listbox.
0008				L$13:
0008  73 74 61 74 69 63 00                            static.
000F				L$14:
000F  65 64 69 74 00                                  edit.
0014				L$15:
0014  62 75 74 74 6F 6E 00                            button.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

