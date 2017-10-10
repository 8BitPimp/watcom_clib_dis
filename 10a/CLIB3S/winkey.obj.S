Module: winkey
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000568 bytes
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
0024  56				push		esi
0025  57				push		edi
0026  83 EC 0C				sub		esp,0x0000000c
0029  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
002D  8A 44 24 20			mov		al,byte ptr 0x20[esp]
0031  BF 01 00 00 00			mov		edi,0x00000001
0036  88 44 24 08			mov		byte ptr 0x8[esp],al
003A  66 83 FE 23			cmp		si,0x0023
003E  72 1C				jb		L$4
0040  66 83 FE 25			cmp		si,0x0025
0044  76 24				jbe		L$5
0046  66 83 FE 27			cmp		si,0x0027
004A  72 34				jb		L$6
004C  76 1C				jbe		L$5
004E  66 83 FE 2D			cmp		si,0x002d
0052  72 2C				jb		L$6
0054  66 83 FE 2E			cmp		si,0x002e
0058  76 10				jbe		L$5
005A  EB 24				jmp		L$6
005C				L$4:
005C  66 83 FE 08			cmp		si,0x0008
0060  72 1E				jb		L$6
0062  76 06				jbe		L$5
0064  66 83 FE 0D			cmp		si,0x000d
0068  75 16				jne		L$6
006A				L$5:
006A  31 DB				xor		ebx,ebx
006C  B4 FF				mov		ah,0xff
006E  66 89 F3				mov		bx,si
0071  88 64 24 08			mov		byte ptr 0x8[esp],ah
0075  81 C3 80 00 00 00			add		ebx,0x00000080
007B  E9 75 00 00 00			jmp		L$8
0080				L$6:
0080  68 00 00 00 00			push		offset pbKeyState
0085  E8 00 00 00 00			call		_GetKeyboardState
008A  6A 00				push		0x00000000
008C  8D 44 24 04			lea		eax,0x4[esp]
0090  50				push		eax
0091  31 C0				xor		eax,eax
0093  68 00 00 00 00			push		offset pbKeyState
0098  8A 44 24 14			mov		al,byte ptr 0x14[esp]
009C  50				push		eax
009D  31 C0				xor		eax,eax
009F  66 89 F0				mov		ax,si
00A2  50				push		eax
00A3  E8 00 00 00 00			call		_ToAscii
00A8  85 C0				test		eax,eax
00AA  7F 04				jg		L$7
00AC  31 FF				xor		edi,edi
00AE  EB 45				jmp		L$8
00B0				L$7:
00B0  31 DB				xor		ebx,ebx
00B2  66 8B 1C 24			mov		bx,word ptr [esp]
00B6  83 F8 02				cmp		eax,0x00000002
00B9  75 3A				jne		L$8
00BB  A1 00 00 00 00			mov		eax,dword ptr keyTop
00C0  88 98 00 00 00 00			mov		byte ptr charList[eax],bl
00C6  A1 00 00 00 00			mov		eax,dword ptr keyTop
00CB  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
00CF  88 90 00 00 00 00			mov		byte ptr scanList[eax],dl
00D5  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
00DB  42				inc		edx
00DC  BB 20 00 00 00			mov		ebx,0x00000020
00E1  89 D0				mov		eax,edx
00E3  C1 FA 1F				sar		edx,0x1f
00E6  F7 FB				idiv		ebx
00E8  89 15 00 00 00 00			mov		dword ptr keyTop,edx
00EE  31 DB				xor		ebx,ebx
00F0  66 8B 5C 24 02			mov		bx,word ptr 0x2[esp]
00F5				L$8:
00F5  85 FF				test		edi,edi
00F7  74 33				je		L$9
00F9  A1 00 00 00 00			mov		eax,dword ptr keyTop
00FE  88 98 00 00 00 00			mov		byte ptr charList[eax],bl
0104  A1 00 00 00 00			mov		eax,dword ptr keyTop
0109  8A 54 24 08			mov		dl,byte ptr 0x8[esp]
010D  88 90 00 00 00 00			mov		byte ptr scanList[eax],dl
0113  8B 15 00 00 00 00			mov		edx,dword ptr keyTop
0119  42				inc		edx
011A  BB 20 00 00 00			mov		ebx,0x00000020
011F  89 D0				mov		eax,edx
0121  C1 FA 1F				sar		edx,0x1f
0124  F7 FB				idiv		ebx
0126  89 15 00 00 00 00			mov		dword ptr keyTop,edx
012C				L$9:
012C  83 C4 0C				add		esp,0x0000000c
012F  5F				pop		edi
0130  5E				pop		esi
0131  5B				pop		ebx
0132  C3				ret		

Routine Size: 272 bytes,    Routine Base: _TEXT + 0023

0133				_KeyboardHit:
0133  53				push		ebx
0134  A1 00 00 00 00			mov		eax,dword ptr keyTop
0139  3B 05 00 00 00 00			cmp		eax,dword ptr keyBottom
013F  74 07				je		L$11
0141				L$10:
0141  B8 01 00 00 00			mov		eax,0x00000001
0146  5B				pop		ebx
0147  C3				ret		
0148				L$11:
0148  6A 01				push		0x00000001
014A  E8 00 00 00 00			call		_MessageLoop
014F  83 C4 04				add		esp,0x00000004
0152  A1 00 00 00 00			mov		eax,dword ptr keyTop
0157  8B 1D 00 00 00 00			mov		ebx,dword ptr keyBottom
015D  39 D8				cmp		eax,ebx
015F  75 E0				jne		L$10
0161  31 D8				xor		eax,ebx
0163  5B				pop		ebx
0164  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0133

0165				_GetKeyboard:
0165  53				push		ebx
0166  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
016A  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
0170  31 DB				xor		ebx,ebx
0172  8A 9A 00 00 00 00			mov		bl,byte ptr charList[edx]
0178  85 C9				test		ecx,ecx
017A  74 14				je		L$12
017C  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
0182  8A 92 00 00 00 00			mov		dl,byte ptr scanList[edx]
0188  81 E2 FF 00 00 00			and		edx,0x000000ff
018E  89 11				mov		dword ptr [ecx],edx
0190				L$12:
0190  8B 15 00 00 00 00			mov		edx,dword ptr keyBottom
0196  42				inc		edx
0197  B9 20 00 00 00			mov		ecx,0x00000020
019C  89 D0				mov		eax,edx
019E  C1 FA 1F				sar		edx,0x1f
01A1  F7 F9				idiv		ecx
01A3  89 15 00 00 00 00			mov		dword ptr keyBottom,edx
01A9  89 D8				mov		eax,ebx
01AB  5B				pop		ebx
01AC  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0165

01AD				_GetString:
01AD  53				push		ebx
01AE  56				push		esi
01AF  57				push		edi
01B0  55				push		ebp
01B1  83 EC 2C				sub		esp,0x0000002c
01B4  8B 6C 24 44			mov		ebp,dword ptr 0x44[esp]
01B8  8B 44 24 48			mov		eax,dword ptr 0x48[esp]
01BC  89 44 24 14			mov		dword ptr 0x14[esp],eax
01C0  40				inc		eax
01C1  31 DB				xor		ebx,ebx
01C3  50				push		eax
01C4  89 5C 24 14			mov		dword ptr 0x14[esp],ebx
01C8  89 5C 24 10			mov		dword ptr 0x10[esp],ebx
01CC  E8 00 00 00 00			call		_MemAlloc
01D1  83 C4 04				add		esp,0x00000004
01D4  31 F6				xor		esi,esi
01D6  89 44 24 04			mov		dword ptr 0x4[esp],eax
01DA  85 C0				test		eax,eax
01DC  0F 84 62 02 00 00			je		L$36
01E2  8B 44 24 40			mov		eax,dword ptr 0x40[esp]
01E6  53				push		ebx
01E7  8B 7C 24 44			mov		edi,dword ptr 0x44[esp]
01EB  8B 40 3A				mov		eax,dword ptr 0x3a[eax]
01EE  57				push		edi
01EF  89 44 24 08			mov		dword ptr 0x8[esp],eax
01F3  E8 00 00 00 00			call		_GetLastLineNumber
01F8  83 C4 04				add		esp,0x00000004
01FB  50				push		eax
01FC  57				push		edi
01FD  E8 00 00 00 00			call		_MoveToLine
0202  83 C4 0C				add		esp,0x0000000c
0205  53				push		ebx
0206  57				push		edi
0207  E8 00 00 00 00			call		_NewCursor
020C  83 C4 08				add		esp,0x00000008
020F  6A 01				push		0x00000001
0211  57				push		edi
0212  E8 00 00 00 00			call		_SetInputMode
0217  83 C4 08				add		esp,0x00000008
021A  89 1D 00 00 00 00			mov		dword ptr _GotEOF,ebx
0220  C6 45 00 00			mov		byte ptr [ebp],0x00
0224				L$13:
0224  8B 44 24 40			mov		eax,dword ptr 0x40[esp]
0228  50				push		eax
0229  89 70 5B				mov		dword ptr 0x5b[eax],esi
022C  E8 00 00 00 00			call		_DisplayCursor
0231  83 C4 04				add		esp,0x00000004
0234				L$14:
0234  E8 00 00 00 00			call		_KeyboardHit
0239  85 C0				test		eax,eax
023B  74 F7				je		L$14
023D  8D 44 24 1C			lea		eax,0x1c[esp]
0241  50				push		eax
0242  E8 00 00 00 00			call		_GetKeyboard
0247  89 44 24 28			mov		dword ptr 0x28[esp],eax
024B  83 C4 04				add		esp,0x00000004
024E  8B 14 24				mov		edx,dword ptr [esp]
0251  8A 44 24 24			mov		al,byte ptr 0x24[esp]
0255  52				push		edx
0256  88 44 24 2C			mov		byte ptr 0x2c[esp],al
025A  E8 00 00 00 00			call		_HideCaret
025F  83 7C 24 10 00			cmp		dword ptr 0x10[esp],0x00000000
0264  74 15				je		L$15
0266  8A 54 24 24			mov		dl,byte ptr 0x24[esp]
026A  89 F0				mov		eax,esi
026C  31 FF				xor		edi,edi
026E  46				inc		esi
026F  89 7C 24 10			mov		dword ptr 0x10[esp],edi
0273  88 14 28				mov		byte ptr [eax+ebp],dl
0276  E9 2B 02 00 00			jmp		L$47
027B				L$15:
027B  8A 64 24 24			mov		ah,byte ptr 0x24[esp]
027F  80 FC 16				cmp		ah,0x16
0282  74 0E				je		L$16
0284  81 7C 24 1C FF 00 00 00		cmp		dword ptr 0x1c[esp],0x000000ff
028C  0F 84 90 00 00 00			je		L$24
0292				L$16:
0292  80 7C 24 28 16			cmp		byte ptr 0x28[esp],0x16
0297  75 0F				jne		L$17
0299  BF 01 00 00 00			mov		edi,0x00000001
029E  B1 5E				mov		cl,0x5e
02A0  89 7C 24 10			mov		dword ptr 0x10[esp],edi
02A4  88 4C 24 28			mov		byte ptr 0x28[esp],cl
02A8				L$17:
02A8  83 7C 24 0C 00			cmp		dword ptr 0xc[esp],0x00000000
02AD  74 3D				je		L$20
02AF  3B 5C 24 14			cmp		ebx,dword ptr 0x14[esp]
02B3  0F 8D 6B FF FF FF			jge		L$13
02B9  8B 44 24 40			mov		eax,dword ptr 0x40[esp]
02BD  8B 40 63				mov		eax,dword ptr 0x63[eax]
02C0  83 E8 02				sub		eax,0x00000002
02C3  39 C3				cmp		ebx,eax
02C5  0F 9C C0				setl		al
02C8  25 FF 00 00 00			and		eax,0x000000ff
02CD  0F 84 51 FF FF FF			je		L$13
02D3  89 DA				mov		edx,ebx
02D5  8D 04 2B				lea		eax,[ebx+ebp]
02D8  EB 07				jmp		L$19
02DA				L$18:
02DA  8A 08				mov		cl,byte ptr [eax]
02DC  48				dec		eax
02DD  4A				dec		edx
02DE  88 48 02				mov		byte ptr 0x2[eax],cl
02E1				L$19:
02E1  39 F2				cmp		edx,esi
02E3  7D F5				jge		L$18
02E5  8A 54 24 28			mov		dl,byte ptr 0x28[esp]
02E9  43				inc		ebx
02EA  EB 22				jmp		L$22
02EC				L$20:
02EC  39 DE				cmp		esi,ebx
02EE  75 1A				jne		L$21
02F0  3B 5C 24 14			cmp		ebx,dword ptr 0x14[esp]
02F4  0F 8D 2A FF FF FF			jge		L$13
02FA  89 D8				mov		eax,ebx
02FC  8A 54 24 28			mov		dl,byte ptr 0x28[esp]
0300  43				inc		ebx
0301  88 14 28				mov		byte ptr [eax+ebp],dl
0304  C6 04 2B 00			mov		byte ptr [ebx+ebp],0x00
0308  EB 07				jmp		L$23
030A				L$21:
030A  8A 54 24 28			mov		dl,byte ptr 0x28[esp]
030E				L$22:
030E  88 14 2E				mov		byte ptr [esi+ebp],dl
0311				L$23:
0311  83 7C 24 10 00			cmp		dword ptr 0x10[esp],0x00000000
0316  0F 85 8A 01 00 00			jne		L$47
031C  46				inc		esi
031D  E9 84 01 00 00			jmp		L$47
0322				L$24:
0322  88 E0				mov		al,ah
0324  80 FC 80				cmp		ah,0x80
0327  72 02				jb		L$25
0329  2C 80				sub		al,0x80
032B				L$25:
032B  3C 24				cmp		al,0x24
032D  72 37				jb		L$27
032F  76 51				jbe		L$29
0331  3C 27				cmp		al,0x27
0333  72 24				jb		L$26
0335  8D 56 01				lea		edx,0x1[esi]
0338  0F 86 15 01 00 00			jbe		L$39
033E  3C 2D				cmp		al,0x2d
0340  0F 82 DE FE FF FF			jb		L$13
0346  0F 86 2E 01 00 00			jbe		L$44
034C  3C 2E				cmp		al,0x2e
034E  0F 84 07 01 00 00			je		L$40
0354  E9 CB FE FF FF			jmp		L$13
0359				L$26:
0359  3C 25				cmp		al,0x25
035B  0F 84 EB 00 00 00			je		L$37
0361  E9 BE FE FF FF			jmp		L$13
0366				L$27:
0366  3C 0D				cmp		al,0x0d
0368  72 0B				jb		L$28
036A  76 24				jbe		L$31
036C  3C 23				cmp		al,0x23
036E  74 19				je		L$30
0370  E9 AF FE FF FF			jmp		L$13
0375				L$28:
0375  3C 08				cmp		al,0x08
0377  0F 84 E4 00 00 00			je		L$41
037D  E9 A2 FE FF FF			jmp		L$13
0382				L$29:
0382  31 F6				xor		esi,esi
0384  E9 1D 01 00 00			jmp		L$47
0389				L$30:
0389  89 DE				mov		esi,ebx
038B  E9 16 01 00 00			jmp		L$47
0390				L$31:
0390  6A 02				push		0x00000002
0392  8B 54 24 44			mov		edx,dword ptr 0x44[esp]
0396  52				push		edx
0397  C6 04 2B 00			mov		byte ptr [ebx+ebp],0x00
039B  E8 00 00 00 00			call		_NewCursor
03A0  83 C4 08				add		esp,0x00000008
03A3  6A 01				push		0x00000001
03A5  89 EF				mov		edi,ebp
03A7  06				push		es
03A8  8C D8				mov		eax,ds
03AA  8E C0				mov		es,eax
03AC  29 C9				sub		ecx,ecx
03AE  49				dec		ecx
03AF  31 C0				xor		eax,eax
03B1  F2 AE				repne scasb	
03B3  F7 D1				not		ecx
03B5  49				dec		ecx
03B6  07				pop		es
03B7  51				push		ecx
03B8  55				push		ebp
03B9  8B 5C 24 4C			mov		ebx,dword ptr 0x4c[esp]
03BD  53				push		ebx
03BE  E8 00 00 00 00			call		_UpdateInputLine
03C3  83 C4 10				add		esp,0x00000010
03C6  6A 00				push		0x00000000
03C8  53				push		ebx
03C9  E8 00 00 00 00			call		_SetInputMode
03CE  83 C4 08				add		esp,0x00000008
03D1  89 EE				mov		esi,ebp
03D3  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
03D7  06				push		es
03D8  1E				push		ds
03D9  07				pop		es
03DA  57				push		edi
03DB  2B C9				sub		ecx,ecx
03DD  49				dec		ecx
03DE  B0 00				mov		al,0x00
03E0  F2 AE				repne scasb	
03E2  4F				dec		edi
03E3				L$32:
03E3  8A 06				mov		al,byte ptr [esi]
03E5  88 07				mov		byte ptr [edi],al
03E7  3C 00				cmp		al,0x00
03E9  0F 84 10 00 00 00			je		L$33
03EF  8A 46 01				mov		al,byte ptr 0x1[esi]
03F2  83 C6 02				add		esi,0x00000002
03F5  88 47 01				mov		byte ptr 0x1[edi],al
03F8  83 C7 02				add		edi,0x00000002
03FB  3C 00				cmp		al,0x00
03FD  75 E4				jne		L$32
03FF				L$33:
03FF  5F				pop		edi
0400  07				pop		es
0401  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
0405  89 EF				mov		edi,ebp
0407  57				push		edi
0408				L$34:
0408  8A 06				mov		al,byte ptr [esi]
040A  88 07				mov		byte ptr [edi],al
040C  3C 00				cmp		al,0x00
040E  0F 84 10 00 00 00			je		L$35
0414  8A 46 01				mov		al,byte ptr 0x1[esi]
0417  83 C6 02				add		esi,0x00000002
041A  88 47 01				mov		byte ptr 0x1[edi],al
041D  83 C7 02				add		edi,0x00000002
0420  3C 00				cmp		al,0x00
0422  75 E4				jne		L$34
0424				L$35:
0424  5F				pop		edi
0425  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
0429  56				push		esi
042A  E8 00 00 00 00			call		_MemFree
042F  83 C4 04				add		esp,0x00000004
0432  06				push		es
0433  8C D8				mov		eax,ds
0435  8E C0				mov		es,eax
0437  29 C9				sub		ecx,ecx
0439  49				dec		ecx
043A  31 C0				xor		eax,eax
043C  F2 AE				repne scasb	
043E  F7 D1				not		ecx
0440  49				dec		ecx
0441  07				pop		es
0442  89 C8				mov		eax,ecx
0444				L$36:
0444  83 C4 2C				add		esp,0x0000002c
0447  5D				pop		ebp
0448  5F				pop		edi
0449  5E				pop		esi
044A  5B				pop		ebx
044B  C3				ret		
044C				L$37:
044C  85 F6				test		esi,esi
044E  7E 56				jle		L$47
0450				L$38:
0450  4E				dec		esi
0451  EB 53				jmp		L$47
0453				L$39:
0453  39 DE				cmp		esi,ebx
0455  7D 4F				jge		L$47
0457  89 D6				mov		esi,edx
0459  EB 4B				jmp		L$47
045B				L$40:
045B  39 DE				cmp		esi,ebx
045D  7D 02				jge		L$41
045F  89 D6				mov		esi,edx
0461				L$41:
0461  85 F6				test		esi,esi
0463  7E 41				jle		L$47
0465  89 F2				mov		edx,esi
0467  8D 04 2E				lea		eax,[esi+ebp]
046A  EB 07				jmp		L$43
046C				L$42:
046C  8A 08				mov		cl,byte ptr [eax]
046E  40				inc		eax
046F  42				inc		edx
0470  88 48 FE				mov		byte ptr -0x2[eax],cl
0473				L$43:
0473  39 DA				cmp		edx,ebx
0475  7E F5				jle		L$42
0477  4B				dec		ebx
0478  EB D6				jmp		L$38
047A				L$44:
047A  83 7C 24 0C 00			cmp		dword ptr 0xc[esp],0x00000000
047F  74 0E				je		L$45
0481  31 FF				xor		edi,edi
0483  57				push		edi
0484  8B 44 24 44			mov		eax,dword ptr 0x44[esp]
0488  50				push		eax
0489  89 7C 24 14			mov		dword ptr 0x14[esp],edi
048D  EB 0F				jmp		L$46
048F				L$45:
048F  BA 01 00 00 00			mov		edx,0x00000001
0494  52				push		edx
0495  8B 4C 24 44			mov		ecx,dword ptr 0x44[esp]
0499  51				push		ecx
049A  89 54 24 14			mov		dword ptr 0x14[esp],edx
049E				L$46:
049E  E8 00 00 00 00			call		_NewCursor
04A3  83 C4 08				add		esp,0x00000008
04A6				L$47:
04A6  6A 00				push		0x00000000
04A8  89 EF				mov		edi,ebp
04AA  06				push		es
04AB  8C D8				mov		eax,ds
04AD  8E C0				mov		es,eax
04AF  29 C9				sub		ecx,ecx
04B1  49				dec		ecx
04B2  31 C0				xor		eax,eax
04B4  F2 AE				repne scasb	
04B6  F7 D1				not		ecx
04B8  49				dec		ecx
04B9  07				pop		es
04BA  51				push		ecx
04BB  55				push		ebp
04BC  8B 54 24 4C			mov		edx,dword ptr 0x4c[esp]
04C0  52				push		edx
04C1  E8 00 00 00 00			call		_UpdateInputLine
04C6  89 44 24 28			mov		dword ptr 0x28[esp],eax
04CA  83 C4 10				add		esp,0x00000010
04CD  89 44 24 20			mov		dword ptr 0x20[esp],eax
04D1  85 C0				test		eax,eax
04D3  0F 8C 4B FD FF FF			jl		L$13
04D9  89 EF				mov		edi,ebp
04DB  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
04DF  06				push		es
04E0  8C D8				mov		eax,ds
04E2  8E C0				mov		es,eax
04E4  29 C9				sub		ecx,ecx
04E6  49				dec		ecx
04E7  31 C0				xor		eax,eax
04E9  F2 AE				repne scasb	
04EB  F7 D1				not		ecx
04ED  49				dec		ecx
04EE  07				pop		es
04EF  89 C8				mov		eax,ecx
04F1  29 F0				sub		eax,esi
04F3  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
04F7  8D 14 28				lea		edx,[eax+ebp]
04FA  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
04FE  89 EE				mov		esi,ebp
0500  8A 1A				mov		bl,byte ptr [edx]
0502  C6 02 00				mov		byte ptr [edx],0x00
0505  06				push		es
0506  1E				push		ds
0507  07				pop		es
0508  57				push		edi
0509  2B C9				sub		ecx,ecx
050B  49				dec		ecx
050C  B0 00				mov		al,0x00
050E  F2 AE				repne scasb	
0510  4F				dec		edi
0511				L$48:
0511  8A 06				mov		al,byte ptr [esi]
0513  88 07				mov		byte ptr [edi],al
0515  3C 00				cmp		al,0x00
0517  0F 84 10 00 00 00			je		L$49
051D  8A 46 01				mov		al,byte ptr 0x1[esi]
0520  83 C6 02				add		esi,0x00000002
0523  88 47 01				mov		byte ptr 0x1[edi],al
0526  83 C7 02				add		edi,0x00000002
0529  3C 00				cmp		al,0x00
052B  75 E4				jne		L$48
052D				L$49:
052D  5F				pop		edi
052E  07				pop		es
052F  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0533  88 1A				mov		byte ptr [edx],bl
0535  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0539  89 E8				mov		eax,ebp
053B  29 FA				sub		edx,edi
053D  31 F6				xor		esi,esi
053F  01 EA				add		edx,ebp
0541  EB 07				jmp		L$51
0543				L$50:
0543  46				inc		esi
0544  8A 1A				mov		bl,byte ptr [edx]
0546  42				inc		edx
0547  88 18				mov		byte ptr [eax],bl
0549  40				inc		eax
054A				L$51:
054A  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
054E  39 DE				cmp		esi,ebx
0550  7E F1				jle		L$50
0552  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0556  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
055A  40				inc		eax
055B  29 C1				sub		ecx,eax
055D  89 DE				mov		esi,ebx
055F  89 4C 24 14			mov		dword ptr 0x14[esp],ecx
0563  E9 BC FC FF FF			jmp		L$13

Routine Size: 955 bytes,    Routine Base: _TEXT + 01AD

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

Segment: _BSS DWORD USE32 00000140 bytes
0000				pbKeyState:
0100				scanList:
0120				charList:

BSS Size: 320 bytes

