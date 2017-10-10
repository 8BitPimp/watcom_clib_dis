Module: windrvr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000006D0 bytes
0000				_SetAboutDlg:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0007  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000B  85 F6				test		esi,esi
000D  74 60				je		L$4
000F  8B 15 00 00 00 00			mov		edx,dword ptr AboutTitle
0015  81 FA 00 00 00 00			cmp		edx,offset DefaultAboutTitle
001B  74 09				je		L$1
001D  52				push		edx
001E  E8 00 00 00 00			call		_MemFree
0023  83 C4 04				add		esp,0x00000004
0026				L$1:
0026  89 F7				mov		edi,esi
0028  06				push		es
0029  8C D8				mov		eax,ds
002B  8E C0				mov		es,eax
002D  29 C9				sub		ecx,ecx
002F  49				dec		ecx
0030  31 C0				xor		eax,eax
0032  F2 AE				repne scasb	
0034  F7 D1				not		ecx
0036  49				dec		ecx
0037  07				pop		es
0038  41				inc		ecx
0039  51				push		ecx
003A  E8 00 00 00 00			call		_MemAlloc
003F  83 C4 04				add		esp,0x00000004
0042  A3 00 00 00 00			mov		dword ptr AboutTitle,eax
0047  85 C0				test		eax,eax
0049  0F 84 87 00 00 00			je		L$9
004F  89 C7				mov		edi,eax
0051  57				push		edi
0052				L$2:
0052  8A 06				mov		al,byte ptr [esi]
0054  88 07				mov		byte ptr [edi],al
0056  3C 00				cmp		al,0x00
0058  0F 84 10 00 00 00			je		L$3
005E  8A 46 01				mov		al,byte ptr 0x1[esi]
0061  83 C6 02				add		esi,0x00000002
0064  88 47 01				mov		byte ptr 0x1[edi],al
0067  83 C7 02				add		edi,0x00000002
006A  3C 00				cmp		al,0x00
006C  75 E4				jne		L$2
006E				L$3:
006E  5F				pop		edi
006F				L$4:
006F  85 DB				test		ebx,ebx
0071  74 5E				je		L$8
0073  8B 35 00 00 00 00			mov		esi,dword ptr AboutMsg
0079  81 FE 00 00 00 00			cmp		esi,offset DefaultAboutMsg
007F  74 09				je		L$5
0081  56				push		esi
0082  E8 00 00 00 00			call		_MemFree
0087  83 C4 04				add		esp,0x00000004
008A				L$5:
008A  89 DF				mov		edi,ebx
008C  06				push		es
008D  8C D8				mov		eax,ds
008F  8E C0				mov		es,eax
0091  29 C9				sub		ecx,ecx
0093  49				dec		ecx
0094  31 C0				xor		eax,eax
0096  F2 AE				repne scasb	
0098  F7 D1				not		ecx
009A  49				dec		ecx
009B  07				pop		es
009C  41				inc		ecx
009D  51				push		ecx
009E  E8 00 00 00 00			call		_MemAlloc
00A3  83 C4 04				add		esp,0x00000004
00A6  A3 00 00 00 00			mov		dword ptr AboutMsg,eax
00AB  85 C0				test		eax,eax
00AD  74 27				je		L$9
00AF  89 C7				mov		edi,eax
00B1  89 DE				mov		esi,ebx
00B3  57				push		edi
00B4				L$6:
00B4  8A 06				mov		al,byte ptr [esi]
00B6  88 07				mov		byte ptr [edi],al
00B8  3C 00				cmp		al,0x00
00BA  0F 84 10 00 00 00			je		L$7
00C0  8A 46 01				mov		al,byte ptr 0x1[esi]
00C3  83 C6 02				add		esi,0x00000002
00C6  88 47 01				mov		byte ptr 0x1[edi],al
00C9  83 C7 02				add		edi,0x00000002
00CC  3C 00				cmp		al,0x00
00CE  75 E4				jne		L$6
00D0				L$7:
00D0  5F				pop		edi
00D1				L$8:
00D1  B8 01 00 00 00			mov		eax,0x00000001
00D6				L$9:
00D6  5F				pop		edi
00D7  5E				pop		esi
00D8  5B				pop		ebx
00D9  C3				ret		
00DA  8B C0				mov		eax,eax
00DC				L$10:
00DC  61 02 00 00                                     DD	offset L$26
00E0  69 02 00 00                                     DD	offset L$27
00E4  9C 02 00 00                                     DD	offset L$28
00E8  47 02 00 00                                     DD	offset L$25
00EC  0F 02 00 00                                     DD	offset L$24
00F0  EC 01 00 00                                     DD	offset L$20
00F4				L$11:
00F4  9E 03 00 00                                     DD	offset L$42
00F8  A6 03 00 00                                     DD	offset L$43
00FC  BD 03 00 00                                     DD	offset L$46
0100  AE 03 00 00                                     DD	offset L$44
0104  CB 03 00 00                                     DD	offset L$47
0108  96 03 00 00                                     DD	offset L$41
010C  CB 03 00 00                                     DD	offset L$47
0110  8B 03 00 00                                     DD	offset L$39
0114				MainWindowProc:
0114  53				push		ebx
0115  56				push		esi
0116  57				push		edi
0117  55				push		ebp
0118  81 EC 80 00 00 00			sub		esp,0x00000080
011E  8B BC 24 94 00 00 00		mov		edi,dword ptr 0x94[esp]
0125  8B B4 24 98 00 00 00		mov		esi,dword ptr 0x98[esp]
012C  8B 9C 24 9C 00 00 00		mov		ebx,dword ptr 0x9c[esp]
0133  8B AC 24 A0 00 00 00		mov		ebp,dword ptr 0xa0[esp]
013A  83 FE 08				cmp		esi,0x00000008
013D  72 28				jb		L$13
013F  76 38				jbe		L$14
0141  81 FE 01 01 00 00			cmp		esi,0x00000101
0147  72 10				jb		L$12
0149  0F 86 A6 02 00 00			jbe		L$49
014F  81 FE 11 01 00 00			cmp		esi,0x00000111
0155  74 52				je		L$18
0157  EB 34				jmp		L$16
0159				L$12:
0159  81 FE 00 01 00 00			cmp		esi,0x00000100
015F  0F 84 64 01 00 00			je		L$30
0165  EB 26				jmp		L$16
0167				L$13:
0167  83 FE 02				cmp		esi,0x00000002
016A  72 21				jb		L$16
016C  0F 86 3F 01 00 00			jbe		L$29
0172  83 FE 07				cmp		esi,0x00000007
0175  74 24				je		L$17
0177  EB 14				jmp		L$16
0179				L$14:
0179  E8 00 00 00 00			call		_GetActiveWindowData
017E  85 C0				test		eax,eax
0180  74 0B				je		L$16
0182  50				push		eax
0183  6A 00				push		0x00000000
0185				L$15:
0185  E8 00 00 00 00			call		_ShowWindowActive
018A  83 C4 08				add		esp,0x00000008
018D				L$16:
018D  55				push		ebp
018E  53				push		ebx
018F  56				push		esi
0190  57				push		edi
0191  E8 00 00 00 00			call		_DefWindowProcA
0196  E9 69 00 00 00			jmp		L$23
019B				L$17:
019B  E8 00 00 00 00			call		_GetActiveWindowData
01A0  85 C0				test		eax,eax
01A2  74 E9				je		L$16
01A4  6A 00				push		0x00000000
01A6  50				push		eax
01A7  EB DC				jmp		L$15
01A9				L$18:
01A9  66 81 FB C8 00			cmp		bx,0x00c8
01AE  72 26				jb		L$19
01B0  31 C0				xor		eax,eax
01B2  66 89 D8				mov		ax,bx
01B5  2D C8 00 00 00			sub		eax,0x000000c8
01BA  50				push		eax
01BB  E8 00 00 00 00			call		_IsWindowedHandle
01C0  83 C4 04				add		esp,0x00000004
01C3  85 C0				test		eax,eax
01C5  0F 84 37 00 00 00			je		L$22
01CB  50				push		eax
01CC  E8 00 00 00 00			call		_MakeWindowActive
01D1  E9 37 01 00 00			jmp		L$33
01D6				L$19:
01D6  89 D8				mov		eax,ebx
01D8  48				dec		eax
01D9  66 3D 05 00			cmp		ax,0x0005
01DD  77 AE				ja		L$16
01DF  25 FF FF 00 00			and		eax,0x0000ffff
01E4  2E FF 24 85 DC 00 00 00		jmp		dword ptr cs:L$10[eax*4]
01EC				L$20:
01EC  6A 40				push		0x00000040
01EE  8B 15 00 00 00 00			mov		edx,dword ptr AboutTitle
01F4  52				push		edx
01F5  8B 1D 00 00 00 00			mov		ebx,dword ptr AboutMsg
01FB  53				push		ebx
01FC  57				push		edi
01FD				L$21:
01FD  E8 00 00 00 00			call		_MessageBoxA
0202				L$22:
0202  31 C0				xor		eax,eax
0204				L$23:
0204  81 C4 80 00 00 00			add		esp,0x00000080
020A  5D				pop		ebp
020B  5F				pop		edi
020C  5E				pop		esi
020D  5B				pop		ebx
020E  C3				ret		
020F				L$24:
020F  8B 1D 00 00 00 00			mov		ebx,dword ptr _AutoClearLines
0215  E8 00 00 00 00			call		_GetClearInterval
021A  8B 0D 00 00 00 00			mov		ecx,dword ptr _AutoClearLines
0220  39 CB				cmp		ebx,ecx
0222  74 DE				je		L$22
0224  51				push		ecx
0225  68 00 00 00 00			push		offset DGROUP:L$80
022A  8D 44 24 08			lea		eax,0x8[esp]
022E  50				push		eax
022F  E8 00 00 00 00			call		sprintf
0234  83 C4 0C				add		esp,0x0000000c
0237  6A 00				push		0x00000000
0239  68 28 00 00 00			push		offset DGROUP:L$81
023E  8D 44 24 08			lea		eax,0x8[esp]
0242  50				push		eax
0243  6A 00				push		0x00000000
0245  EB B6				jmp		L$21
0247				L$25:
0247  E8 00 00 00 00			call		_GetActiveWindowData
024C  85 C0				test		eax,eax
024E  74 B2				je		L$22
0250  F6 40 52 08			test		byte ptr 0x52[eax],0x08
0254  75 AC				jne		L$22
0256  50				push		eax
0257  E8 00 00 00 00			call		_CopyAllLines
025C  E9 AC 00 00 00			jmp		L$33
0261				L$26:
0261  57				push		edi
0262  E8 00 00 00 00			call		_DestroyWindow
0267  EB 99				jmp		L$22
0269				L$27:
0269  E8 00 00 00 00			call		_GetActiveWindowData
026E  89 C3				mov		ebx,eax
0270  85 C0				test		eax,eax
0272  74 8E				je		L$22
0274  83 78 6B 00			cmp		dword ptr 0x6b[eax],0x00000000
0278  75 88				jne		L$22
027A  85 C0				test		eax,eax
027C  74 84				je		L$22
027E  F6 40 52 08			test		byte ptr 0x52[eax],0x08
0282  0F 85 7A FF FF FF			jne		L$22
0288  50				push		eax
0289  E8 00 00 00 00			call		_FreeAllLines
028E  83 C4 04				add		esp,0x00000004
0291  53				push		ebx
0292  E8 00 00 00 00			call		_ClearWindow
0297  E9 71 00 00 00			jmp		L$33
029C				L$28:
029C  E8 00 00 00 00			call		_GetActiveWindowData
02A1  85 C0				test		eax,eax
02A3  0F 84 59 FF FF FF			je		L$22
02A9  50				push		eax
02AA  E8 00 00 00 00			call		_SaveAllLines
02AF  EB 5C				jmp		L$33
02B1				L$29:
02B1  8B 1D 00 00 00 00			mov		ebx,dword ptr _FixedFont
02B7  53				push		ebx
02B8  E8 00 00 00 00			call		_DeleteObject
02BD  6A 00				push		0x00000000
02BF  E8 00 00 00 00			call		_PostQuitMessage
02C4  E9 39 FF FF FF			jmp		L$22
02C9				L$30:
02C9  E8 00 00 00 00			call		_GetActiveWindowData
02CE  89 C6				mov		esi,eax
02D0  83 FB 11				cmp		ebx,0x00000011
02D3  75 09				jne		L$31
02D5  80 0D 00 00 00 00 08		or		byte ptr shiftState,0x08
02DC  EB 69				jmp		L$35
02DE				L$31:
02DE  83 FB 03				cmp		ebx,0x00000003
02E1  75 32				jne		L$34
02E3  6A 40				push		0x00000040
02E5  B8 33 00 00 00			mov		eax,offset DGROUP:L$82
02EA  50				push		eax
02EB  B8 3C 00 00 00			mov		eax,offset DGROUP:L$83
02F0  50				push		eax
02F1  57				push		edi
02F2  E8 00 00 00 00			call		_MessageBoxA
02F7  8A 25 00 00 00 00			mov		ah,byte ptr shiftState
02FD  80 E4 F7				and		ah,0xf7
0300  6A 07				push		0x00000007
0302  88 25 00 00 00 00			mov		byte ptr shiftState,ah
0308				L$32:
0308  E8 00 00 00 00			call		raise
030D				L$33:
030D  83 C4 04				add		esp,0x00000004
0310  E9 ED FE FF FF			jmp		L$22
0315				L$34:
0315  F6 05 00 00 00 00 08		test		byte ptr shiftState,0x08
031C  74 29				je		L$35
031E  83 FB 43				cmp		ebx,0x00000043
0321  75 24				jne		L$35
0323  6A 40				push		0x00000040
0325  B8 3D 00 00 00			mov		eax,offset DGROUP:L$84
032A  50				push		eax
032B  B8 3C 00 00 00			mov		eax,offset DGROUP:L$83
0330  50				push		eax
0331  57				push		edi
0332  E8 00 00 00 00			call		_MessageBoxA
0337  A0 00 00 00 00			mov		al,byte ptr shiftState
033C  24 F7				and		al,0xf7
033E  6A 04				push		0x00000004
0340  A2 00 00 00 00			mov		byte ptr shiftState,al
0345  EB C1				jmp		L$32
0347				L$35:
0347  89 E8				mov		eax,ebp
0349  C1 E8 10				shr		eax,0x10
034C  25 FF FF 00 00			and		eax,0x0000ffff
0351  85 F6				test		esi,esi
0353  75 19				jne		L$38
0355				L$36:
0355  25 FF FF 00 00			and		eax,0x0000ffff
035A  50				push		eax
035B  31 C0				xor		eax,eax
035D  66 89 D8				mov		ax,bx
0360  50				push		eax
0361  E8 00 00 00 00			call		_WindowsKeyPush
0366				L$37:
0366  83 C4 08				add		esp,0x00000008
0369  E9 94 FE FF FF			jmp		L$22
036E				L$38:
036E  8B 56 6B				mov		edx,dword ptr 0x6b[esi]
0371  85 D2				test		edx,edx
0373  75 E0				jne		L$36
0375  52				push		edx
0376  E8 00 00 00 00			call		_ShowCursor
037B  8D 43 DF				lea		eax,-0x21[ebx]
037E  83 F8 07				cmp		eax,0x00000007
0381  77 48				ja		L$47
0383  2E FF 24 85 F4 00 00 00		jmp		dword ptr cs:L$11[eax*4]
038B				L$39:
038B  56				push		esi
038C  E8 00 00 00 00			call		_MoveLineDown
0391				L$40:
0391  83 C4 04				add		esp,0x00000004
0394  EB 53				jmp		L$48
0396				L$41:
0396  56				push		esi
0397  E8 00 00 00 00			call		_MoveLineUp
039C  EB F3				jmp		L$40
039E				L$42:
039E  56				push		esi
039F  E8 00 00 00 00			call		_MovePageUp
03A4  EB EB				jmp		L$40
03A6				L$43:
03A6  56				push		esi
03A7  E8 00 00 00 00			call		_MovePageDown
03AC  EB E3				jmp		L$40
03AE				L$44:
03AE  6A 01				push		0x00000001
03B0  6A 01				push		0x00000001
03B2				L$45:
03B2  56				push		esi
03B3  E8 00 00 00 00			call		_MoveToLine
03B8  83 C4 0C				add		esp,0x0000000c
03BB  EB 2C				jmp		L$48
03BD				L$46:
03BD  6A 01				push		0x00000001
03BF  56				push		esi
03C0  E8 00 00 00 00			call		_GetLastLineNumber
03C5  83 C4 04				add		esp,0x00000004
03C8  50				push		eax
03C9  EB E7				jmp		L$45
03CB				L$47:
03CB  89 E8				mov		eax,ebp
03CD  C1 E8 10				shr		eax,0x10
03D0  25 FF FF 00 00			and		eax,0x0000ffff
03D5  25 FF FF 00 00			and		eax,0x0000ffff
03DA  50				push		eax
03DB  31 C0				xor		eax,eax
03DD  66 89 D8				mov		ax,bx
03E0  50				push		eax
03E1  E8 00 00 00 00			call		_WindowsKeyPush
03E6  83 C4 08				add		esp,0x00000008
03E9				L$48:
03E9  6A 01				push		0x00000001
03EB  E8 00 00 00 00			call		_ShowCursor
03F0  E9 0D FE FF FF			jmp		L$22
03F5				L$49:
03F5  83 FB 11				cmp		ebx,0x00000011
03F8  75 07				jne		L$50
03FA  80 25 00 00 00 00 F7		and		byte ptr shiftState,0xf7
0401				L$50:
0401  89 E8				mov		eax,ebp
0403  C1 E8 10				shr		eax,0x10
0406  25 FF FF 00 00			and		eax,0x0000ffff
040B  25 FF FF 00 00			and		eax,0x0000ffff
0410  50				push		eax
0411  31 C0				xor		eax,eax
0413  66 89 D8				mov		ax,bx
0416  50				push		eax
0417  E8 00 00 00 00			call		_WindowsKeyUp
041C  E9 45 FF FF FF			jmp		L$37
0421  8D 40 00				lea		eax,[eax]
0424				L$51:
0424  B1 06 00 00                                     DD	offset L$76
0428  A9 06 00 00                                     DD	offset L$75
042C  A1 06 00 00                                     DD	offset L$74
0430  99 06 00 00                                     DD	offset L$73
0434  70 06 00 00                                     DD	offset L$72

Routine Size: 1080 bytes,    Routine Base: _TEXT + 0000

0438				__MainDriver:
0438  53				push		ebx
0439  56				push		esi
043A  57				push		edi
043B  55				push		ebp
043C  83 EC 54				sub		esp,0x00000054
043F  8B 7C 24 68			mov		edi,dword ptr 0x68[esp]
0443  8B 74 24 6C			mov		esi,dword ptr 0x6c[esp]
0447  3B 3D 00 00 00 00			cmp		edi,dword ptr _MainWindow
044D  75 19				jne		L$52
044F  8B 54 24 74			mov		edx,dword ptr 0x74[esp]
0453  52				push		edx
0454  8B 5C 24 74			mov		ebx,dword ptr 0x74[esp]
0458  53				push		ebx
0459  56				push		esi
045A  57				push		edi
045B  E8 00 00 00 00			call		MainWindowProc
0460  83 C4 10				add		esp,0x00000010
0463  E9 12 01 00 00			jmp		L$66
0468				L$52:
0468  57				push		edi
0469  E8 00 00 00 00			call		_GetWindowData
046E  89 C3				mov		ebx,eax
0470  83 C4 04				add		esp,0x00000004
0473  89 C5				mov		ebp,eax
0475  85 C0				test		eax,eax
0477  75 0F				jne		L$53
0479  8B 6C 24 74			mov		ebp,dword ptr 0x74[esp]
047D  55				push		ebp
047E  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
0482  50				push		eax
0483  E9 B3 00 00 00			jmp		L$62
0488				L$53:
0488  83 FE 0F				cmp		esi,0x0000000f
048B  72 3A				jb		L$55
048D  0F 86 F9 00 00 00			jbe		L$68
0493  83 FE 41				cmp		esi,0x00000041
0496  72 25				jb		L$54
0498  0F 86 A9 00 00 00			jbe		L$63
049E  81 FE 12 01 00 00			cmp		esi,0x00000112
04A4  0F 82 17 02 00 00			jb		L$79
04AA  76 55				jbe		L$58
04AC  81 FE 15 01 00 00			cmp		esi,0x00000115
04B2  0F 84 9A 01 00 00			je		L$71
04B8  E9 04 02 00 00			jmp		L$79
04BD				L$54:
04BD  83 FE 21				cmp		esi,0x00000021
04C0  74 3F				je		L$58
04C2  E9 FA 01 00 00			jmp		L$79
04C7				L$55:
04C7  83 FE 05				cmp		esi,0x00000005
04CA  72 1B				jb		L$56
04CC  0F 86 DD 00 00 00			jbe		L$69
04D2  83 FE 07				cmp		esi,0x00000007
04D5  0F 82 E6 01 00 00			jb		L$79
04DB  76 18				jbe		L$57
04DD  83 FE 08				cmp		esi,0x00000008
04E0  74 34				je		L$59
04E2  E9 DA 01 00 00			jmp		L$79
04E7				L$56:
04E7  83 FE 02				cmp		esi,0x00000002
04EA  0F 84 94 00 00 00			je		L$67
04F0  E9 CC 01 00 00			jmp		L$79
04F5				L$57:
04F5  8B 1D 00 00 00 00			mov		ebx,dword ptr _MainWindow
04FB  53				push		ebx
04FC  E8 00 00 00 00			call		_SetFocus
0501				L$58:
0501  55				push		ebp
0502  E8 00 00 00 00			call		_MakeWindowActive
0507  83 C4 04				add		esp,0x00000004
050A  8B 4C 24 74			mov		ecx,dword ptr 0x74[esp]
050E  51				push		ecx
050F  8B 6C 24 74			mov		ebp,dword ptr 0x74[esp]
0513  55				push		ebp
0514  EB 25				jmp		L$62
0516				L$59:
0516  8B 4C 24 70			mov		ecx,dword ptr 0x70[esp]
051A  85 C9				test		ecx,ecx
051C  74 13				je		L$60
051E  3B 0D 00 00 00 00			cmp		ecx,dword ptr _MainWindow
0524  74 0B				je		L$60
0526  50				push		eax
0527  6A 00				push		0x00000000
0529  E8 00 00 00 00			call		_ShowWindowActive
052E  83 C4 08				add		esp,0x00000008
0531				L$60:
0531  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
0535  50				push		eax
0536				L$61:
0536  8B 54 24 74			mov		edx,dword ptr 0x74[esp]
053A  52				push		edx
053B				L$62:
053B  56				push		esi
053C  57				push		edi
053D  E8 00 00 00 00			call		_DefWindowProcA
0542  E9 33 00 00 00			jmp		L$66
0547				L$63:
0547  68 31 20 00 00			push		0x00002031
054C  68 44 00 00 00			push		offset DGROUP:L$85
0551  68 53 00 00 00			push		offset DGROUP:L$86
0556  6A 00				push		0x00000000
0558  E8 00 00 00 00			call		_MessageBoxA
055D  83 F8 01				cmp		eax,0x00000001
0560  0F 85 12 00 00 00			jne		L$65
0566  53				push		ebx
0567  E8 00 00 00 00			call		_FreeAllLines
056C  83 C4 04				add		esp,0x00000004
056F  53				push		ebx
0570  E8 00 00 00 00			call		_ClearWindow
0575				L$64:
0575  83 C4 04				add		esp,0x00000004
0578				L$65:
0578  31 C0				xor		eax,eax
057A				L$66:
057A  83 C4 54				add		esp,0x00000054
057D  5D				pop		ebp
057E  5F				pop		edi
057F  5E				pop		esi
0580  5B				pop		ebx
0581  C2 10 00				ret		0x0010
0584				L$67:
0584  50				push		eax
0585  E8 00 00 00 00			call		_DestroyAWindow
058A  EB E9				jmp		L$64
058C				L$68:
058C  89 E0				mov		eax,esp
058E  50				push		eax
058F  57				push		edi
0590  E8 00 00 00 00			call		_BeginPaint
0595  50				push		eax
0596  8D 44 24 0C			lea		eax,0xc[esp]
059A  50				push		eax
059B  53				push		ebx
059C  E8 00 00 00 00			call		_RepaintWindow
05A1  83 C4 0C				add		esp,0x0000000c
05A4  89 E0				mov		eax,esp
05A6  50				push		eax
05A7  57				push		edi
05A8  E8 00 00 00 00			call		_EndPaint
05AD  EB C9				jmp		L$65
05AF				L$69:
05AF  F6 40 52 01			test		byte ptr 0x52[eax],0x01
05B3  74 13				je		L$70
05B5  8A 53 52				mov		dl,byte ptr 0x52[ebx]
05B8  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
05BC  80 E2 FE				and		dl,0xfe
05BF  50				push		eax
05C0  88 53 52				mov		byte ptr 0x52[ebx],dl
05C3  E9 6E FF FF FF			jmp		L$61
05C8				L$70:
05C8  8B 44 24 74			mov		eax,dword ptr 0x74[esp]
05CC  C1 E8 10				shr		eax,0x10
05CF  25 FF FF 00 00			and		eax,0x0000ffff
05D4  57				push		edi
05D5  89 44 24 54			mov		dword ptr 0x54[esp],eax
05D9  E8 00 00 00 00			call		_GetDC
05DE  89 C6				mov		esi,eax
05E0  8B 43 36				mov		eax,dword ptr 0x36[ebx]
05E3  50				push		eax
05E4  56				push		esi
05E5  E8 00 00 00 00			call		_SelectObject
05EA  6A 00				push		0x00000000
05EC  6A 00				push		0x00000000
05EE  6A 00				push		0x00000000
05F0  56				push		esi
05F1  89 C5				mov		ebp,eax
05F3  E8 00 00 00 00			call		_SetBrushOrgEx
05F8  8D 44 24 40			lea		eax,0x40[esp]
05FC  50				push		eax
05FD  57				push		edi
05FE  E8 00 00 00 00			call		_GetClientRect
0603  8B 53 36				mov		edx,dword ptr 0x36[ebx]
0606  52				push		edx
0607  8D 44 24 44			lea		eax,0x44[esp]
060B  50				push		eax
060C  56				push		esi
060D  E8 00 00 00 00			call		_FillRect
0612  55				push		ebp
0613  56				push		esi
0614  E8 00 00 00 00			call		_SelectObject
0619  56				push		esi
061A  57				push		edi
061B  E8 00 00 00 00			call		_ReleaseDC
0620  31 C0				xor		eax,eax
0622  8B 4C 24 44			mov		ecx,dword ptr 0x44[esp]
0626  66 8B 44 24 50			mov		ax,word ptr 0x50[esp]
062B  01 C8				add		eax,ecx
062D  50				push		eax
062E  31 C0				xor		eax,eax
0630  8B 74 24 44			mov		esi,dword ptr 0x44[esp]
0634  66 8B 44 24 78			mov		ax,word ptr 0x78[esp]
0639  01 F0				add		eax,esi
063B  50				push		eax
063C  51				push		ecx
063D  56				push		esi
063E  53				push		ebx
063F  E8 00 00 00 00			call		_ResizeWin
0644  83 C4 14				add		esp,0x00000014
0647  53				push		ebx
0648  E8 00 00 00 00			call		_DisplayAllLines
064D  E9 23 FF FF FF			jmp		L$64
0652				L$71:
0652  6A 00				push		0x00000000
0654  E8 00 00 00 00			call		_ShowCursor
0659  8B 54 24 70			mov		edx,dword ptr 0x70[esp]
065D  66 83 FA 04			cmp		dx,0x0004
0661  77 57				ja		L$78
0663  31 C0				xor		eax,eax
0665  66 89 D0				mov		ax,dx
0668  2E FF 24 85 24 04 00 00		jmp		dword ptr cs:L$51[eax*4]
0670				L$72:
0670  8B 44 24 70			mov		eax,dword ptr 0x70[esp]
0674  C1 E8 10				shr		eax,0x10
0677  6A 01				push		0x00000001
0679  25 FF FF 00 00			and		eax,0x0000ffff
067E  25 FF FF 00 00			and		eax,0x0000ffff
0683  50				push		eax
0684  53				push		ebx
0685  E8 00 00 00 00			call		_GetLineFromThumbPosition
068A  83 C4 08				add		esp,0x00000008
068D  50				push		eax
068E  53				push		ebx
068F  E8 00 00 00 00			call		_MoveToLine
0694  83 C4 0C				add		esp,0x0000000c
0697  EB 21				jmp		L$78
0699				L$73:
0699  53				push		ebx
069A  E8 00 00 00 00			call		_MovePageDown
069F  EB 16				jmp		L$77
06A1				L$74:
06A1  53				push		ebx
06A2  E8 00 00 00 00			call		_MovePageUp
06A7  EB 0E				jmp		L$77
06A9				L$75:
06A9  53				push		ebx
06AA  E8 00 00 00 00			call		_MoveLineDown
06AF  EB 06				jmp		L$77
06B1				L$76:
06B1  53				push		ebx
06B2  E8 00 00 00 00			call		_MoveLineUp
06B7				L$77:
06B7  83 C4 04				add		esp,0x00000004
06BA				L$78:
06BA  6A 01				push		0x00000001
06BC  E8 00 00 00 00			call		_ShowCursor
06C1				L$79:
06C1  8B 5C 24 74			mov		ebx,dword ptr 0x74[esp]
06C5  53				push		ebx
06C6  8B 4C 24 74			mov		ecx,dword ptr 0x74[esp]
06CA  51				push		ecx
06CB  E9 6B FE FF FF			jmp		L$62

Routine Size: 664 bytes,    Routine Base: _TEXT + 0438

No disassembly errors

Segment: CONST DWORD USE32 00000081 bytes
0000				L$80:
0000  42 75 66 66 65 72 73 20 77 69 6C 6C 20 62 65 20 Buffers will be 
0010  63 6C 65 61 72 65 64 20 61 66 74 65 72 20 25 6C cleared after %l
0020  64 20 6C 69 6E 65 73 00                         d lines.
0028				L$81:
0028  41 6D 6F 75 6E 74 20 53 65 74 00                Amount Set.
0033				L$82:
0033  53 49 47 42 52 45 41 4B 00                      SIGBREAK.
003C				L$83:
003C  00                                              .
003D				L$84:
003D  53 49 47 49 4E 54 00                            SIGINT.
0044				L$85:
0044  53 79 73 74 65 6D 20 52 65 71 75 65 73 74 00    System Request.
0053				L$86:
0053  53 79 73 74 65 6D 20 68 61 73 20 69 6E 64 69 63 System has indic
0063  61 74 65 64 20 6C 6F 77 20 6D 65 6D 6F 72 79 2C ated low memory,
0073  20 43 6C 65 61 72 20 4C 69 6E 65 73 3F 00        Clear Lines?.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000093 bytes
0000				DefaultAboutMsg:
0000  20 20 20 57 41 54 43 4F 4D 20 44 65 66 61 75 6C    WATCOM Defaul
0010  74 20 57 69 6E 64 6F 77 20 53 79 73 74 65 6D 0A t Window System.
0020  0A 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 .               
0030  20 56 65 72 73 69 6F 6E 20 31 30 2E 30 0A 0A 20  Version 10.0.. 
0040  A9 20 31 39 39 31 2D 31 39 39 34 20 57 41 54 43 . 1991-1994 WATC
0050  4F 4D 20 53 79 73 74 65 6D 73 2C 20 49 6E 63 2E OM Systems, Inc.
0060  00                                              .
0061				AboutMsg:
0061  00 00 00 00                                     DD	offset DefaultAboutMsg
0065				DefaultAboutTitle:
0065  41 62 6F 75 74 20 57 41 54 43 4F 4D 20 44 65 66 About WATCOM Def
0075  61 75 6C 74 20 57 69 6E 64 6F 77 69 6E 67 20 53 ault Windowing S
0085  79 73 74 65 6D 00                               ystem.
008B				AboutTitle:
008B  00 00 00 00                                     DD	offset DefaultAboutTitle
008F				shiftState:
008F  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

