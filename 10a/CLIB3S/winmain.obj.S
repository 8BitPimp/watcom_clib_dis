Module: winmain
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000513 bytes
0000				__InitDefaultWin:
0000  53				push		ebx
0001  E8 00 00 00 00			call		_GetCommandLineA
0006  50				push		eax
0007  E8 00 00 00 00			call		strdup
000C  83 C4 04				add		esp,0x00000004
000F				L$1:
000F  8A 10				mov		dl,byte ptr [eax]
0011  FE C2				inc		dl
0013  81 E2 FF 00 00 00			and		edx,0x000000ff
0019  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
0020  75 08				jne		L$2
0022  80 38 00				cmp		byte ptr [eax],0x00
0025  74 03				je		L$2
0027  40				inc		eax
0028  EB E5				jmp		L$1
002A				L$2:
002A  8A 10				mov		dl,byte ptr [eax]
002C  FE C2				inc		dl
002E  81 E2 FF 00 00 00			and		edx,0x000000ff
0034  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
003B  74 03				je		L$3
003D  40				inc		eax
003E  EB EA				jmp		L$2
0040				L$3:
0040  6A 00				push		0x00000000
0042  E8 00 00 00 00			call		_GetModuleHandleA
0047  50				push		eax
0048  89 C3				mov		ebx,eax
004A  E8 00 00 00 00			call		firstInstance
004F  83 C4 04				add		esp,0x00000004
0052  85 C0				test		eax,eax
0054  74 19				je		L$4
0056  6A 0A				push		0x0000000a
0058  53				push		ebx
0059  E8 00 00 00 00			call		windowsInit
005E  83 C4 08				add		esp,0x00000008
0061  85 C0				test		eax,eax
0063  74 0A				je		L$4
0065  E8 00 00 00 00			call		_InitFunctionPointers
006A  B8 01 00 00 00			mov		eax,0x00000001
006F				L$4:
006F  5B				pop		ebx

Routine Size: 112 bytes,    Routine Base: _TEXT + 0000

0070				__FiniDefaultWin:
0070  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 0070

0071				DEFAULTWINMAIN:
0071  56				push		esi
0072  57				push		edi
0073  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0077  52				push		edx
0078  E8 00 00 00 00			call		firstInstance
007D  83 C4 04				add		esp,0x00000004
0080  85 C0				test		eax,eax
0082  74 3A				je		L$5
0084  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0088  53				push		ebx
0089  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
008D  51				push		ecx
008E  E8 00 00 00 00			call		windowsInit
0093  83 C4 08				add		esp,0x00000008
0096  85 C0				test		eax,eax
0098  74 24				je		L$5
009A  E8 00 00 00 00			call		_InitFunctionPointers
009F  8B 35 00 00 00 00			mov		esi,dword ptr ___Argv
00A5  56				push		esi
00A6  8B 3D 00 00 00 00			mov		edi,dword ptr ___Argc
00AC  57				push		edi
00AD  E8 00 00 00 00			call		main
00B2  83 C4 08				add		esp,0x00000008
00B5  89 C3				mov		ebx,eax
00B7  E8 00 00 00 00			call		_WindowsExit
00BC  89 D8				mov		eax,ebx
00BE				L$5:
00BE  5F				pop		edi
00BF  5E				pop		esi
00C0  C2 10 00				ret		0x0010
00C3				firstInstance:
00C3  53				push		ebx
00C4  56				push		esi
00C5  57				push		edi
00C6  55				push		ebp
00C7  81 EC A8 00 00 00			sub		esp,0x000000a8
00CD  8B AC 24 BC 00 00 00		mov		ebp,dword ptr 0xbc[esp]
00D4  55				push		ebp
00D5  68 00 00 00 00			push		offset DGROUP:L$12
00DA  8D 44 24 08			lea		eax,0x8[esp]
00DE  50				push		eax
00DF  E8 00 00 00 00			call		sprintf
00E4  83 C4 0C				add		esp,0x0000000c
00E7  89 E7				mov		edi,esp
00E9  06				push		es
00EA  8C D8				mov		eax,ds
00EC  8E C0				mov		es,eax
00EE  29 C9				sub		ecx,ecx
00F0  49				dec		ecx
00F1  31 C0				xor		eax,eax
00F3  F2 AE				repne scasb	
00F5  F7 D1				not		ecx
00F7  49				dec		ecx
00F8  07				pop		es
00F9  41				inc		ecx
00FA  51				push		ecx
00FB  E8 00 00 00 00			call		malloc
0100  83 C4 04				add		esp,0x00000004
0103  A3 00 00 00 00			mov		dword ptr mainClass,eax
0108  85 C0				test		eax,eax
010A  0F 84 A6 02 00 00			je		L$10
0110  89 E6				mov		esi,esp
0112  89 C7				mov		edi,eax
0114  57				push		edi
0115				L$6:
0115  8A 06				mov		al,byte ptr [esi]
0117  88 07				mov		byte ptr [edi],al
0119  3C 00				cmp		al,0x00
011B  0F 84 10 00 00 00			je		L$7
0121  8A 46 01				mov		al,byte ptr 0x1[esi]
0124  83 C6 02				add		esi,0x00000002
0127  88 47 01				mov		byte ptr 0x1[edi],al
012A  83 C7 02				add		edi,0x00000002
012D  3C 00				cmp		al,0x00
012F  75 E4				jne		L$6
0131				L$7:
0131  5F				pop		edi
0132  55				push		ebp
0133  68 0B 00 00 00			push		offset DGROUP:L$13
0138  8D 44 24 08			lea		eax,0x8[esp]
013C  50				push		eax
013D  E8 00 00 00 00			call		sprintf
0142  83 C4 0C				add		esp,0x0000000c
0145  89 E7				mov		edi,esp
0147  06				push		es
0148  8C D8				mov		eax,ds
014A  8E C0				mov		es,eax
014C  29 C9				sub		ecx,ecx
014E  49				dec		ecx
014F  31 C0				xor		eax,eax
0151  F2 AE				repne scasb	
0153  F7 D1				not		ecx
0155  49				dec		ecx
0156  07				pop		es
0157  41				inc		ecx
0158  51				push		ecx
0159  E8 00 00 00 00			call		malloc
015E  83 C4 04				add		esp,0x00000004
0161  A3 00 00 00 00			mov		dword ptr _ClassName,eax
0166  85 C0				test		eax,eax
0168  0F 84 48 02 00 00			je		L$10
016E  89 E6				mov		esi,esp
0170  89 C7				mov		edi,eax
0172  57				push		edi
0173				L$8:
0173  8A 06				mov		al,byte ptr [esi]
0175  88 07				mov		byte ptr [edi],al
0177  3C 00				cmp		al,0x00
0179  0F 84 10 00 00 00			je		L$9
017F  8A 46 01				mov		al,byte ptr 0x1[esi]
0182  83 C6 02				add		esi,0x00000002
0185  88 47 01				mov		byte ptr 0x1[edi],al
0188  83 C7 02				add		edi,0x00000002
018B  3C 00				cmp		al,0x00
018D  75 E4				jne		L$8
018F				L$9:
018F  5F				pop		edi
0190  E8 00 00 00 00			call		_CreateMenu
0195  89 C3				mov		ebx,eax
0197  85 C0				test		eax,eax
0199  0F 84 17 02 00 00			je		L$10
019F  68 19 00 00 00			push		offset DGROUP:L$14
01A4  6A 03				push		0x00000003
01A6  6A 00				push		0x00000000
01A8  50				push		eax
01A9  E8 00 00 00 00			call		_AppendMenuA
01AE  68 26 00 00 00			push		offset DGROUP:L$15
01B3  6A 05				push		0x00000005
01B5  6A 00				push		0x00000000
01B7  53				push		ebx
01B8  E8 00 00 00 00			call		_AppendMenuA
01BD  6A 00				push		0x00000000
01BF  6A 00				push		0x00000000
01C1  68 00 08 00 00			push		0x00000800
01C6  53				push		ebx
01C7  E8 00 00 00 00			call		_AppendMenuA
01CC  68 49 00 00 00			push		offset DGROUP:L$16
01D1  6A 01				push		0x00000001
01D3  6A 00				push		0x00000000
01D5  53				push		ebx
01D6  E8 00 00 00 00			call		_AppendMenuA
01DB  E8 00 00 00 00			call		_CreateMenu
01E0  89 C6				mov		esi,eax
01E2  85 C0				test		eax,eax
01E4  0F 84 CC 01 00 00			je		L$10
01EA  68 4F 00 00 00			push		offset DGROUP:L$17
01EF  6A 06				push		0x00000006
01F1  6A 00				push		0x00000000
01F3  50				push		eax
01F4  E8 00 00 00 00			call		_AppendMenuA
01F9  E8 00 00 00 00			call		_CreateMenu
01FE  89 C2				mov		edx,eax
0200  A3 00 00 00 00			mov		dword ptr _SubMenuEdit,eax
0205  85 C0				test		eax,eax
0207  0F 84 A9 01 00 00			je		L$10
020D  68 59 00 00 00			push		offset DGROUP:L$18
0212  6A 02				push		0x00000002
0214  6A 00				push		0x00000000
0216  50				push		eax
0217  E8 00 00 00 00			call		_AppendMenuA
021C  68 60 00 00 00			push		offset DGROUP:L$19
0221  6A 04				push		0x00000004
0223  6A 00				push		0x00000000
0225  8B 15 00 00 00 00			mov		edx,dword ptr _SubMenuEdit
022B  52				push		edx
022C  E8 00 00 00 00			call		_AppendMenuA
0231  E8 00 00 00 00			call		_CreateMenu
0236  A3 00 00 00 00			mov		dword ptr _SubMenuWindows,eax
023B  E8 00 00 00 00			call		_CreateMenu
0240  89 C2				mov		edx,eax
0242  A3 00 00 00 00			mov		dword ptr _MainMenu,eax
0247  85 C0				test		eax,eax
0249  0F 84 67 01 00 00			je		L$10
024F  68 66 00 00 00			push		offset DGROUP:L$20
0254  53				push		ebx
0255  6A 10				push		0x00000010
0257  50				push		eax
0258  E8 00 00 00 00			call		_AppendMenuA
025D  68 6C 00 00 00			push		offset DGROUP:L$21
0262  8B 1D 00 00 00 00			mov		ebx,dword ptr _SubMenuEdit
0268  53				push		ebx
0269  6A 10				push		0x00000010
026B  8B 0D 00 00 00 00			mov		ecx,dword ptr _MainMenu
0271  51				push		ecx
0272  E8 00 00 00 00			call		_AppendMenuA
0277  68 72 00 00 00			push		offset DGROUP:L$22
027C  8B 3D 00 00 00 00			mov		edi,dword ptr _SubMenuWindows
0282  57				push		edi
0283  6A 10				push		0x00000010
0285  A1 00 00 00 00			mov		eax,dword ptr _MainMenu
028A  50				push		eax
028B  E8 00 00 00 00			call		_AppendMenuA
0290  68 7B 00 00 00			push		offset DGROUP:L$23
0295  56				push		esi
0296  6A 10				push		0x00000010
0298  8B 15 00 00 00 00			mov		edx,dword ptr _MainMenu
029E  52				push		edx
029F  31 DB				xor		ebx,ebx
02A1  E8 00 00 00 00			call		_AppendMenuA
02A6  B9 00 00 00 00			mov		ecx,offset __MainDriver
02AB  68 00 7F 00 00			push		0x00007f00
02B0  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
02B7  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
02BE  89 9C 24 90 00 00 00		mov		dword ptr 0x90[esp],ebx
02C5  53				push		ebx
02C6  89 AC 24 98 00 00 00		mov		dword ptr 0x98[esp],ebp
02CD  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
02D4  E8 00 00 00 00			call		_LoadIconA
02D9  68 00 7F 00 00			push		0x00007f00
02DE  53				push		ebx
02DF  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02E6  E8 00 00 00 00			call		_LoadCursorA
02EB  6A 02				push		0x00000002
02ED  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02F4  E8 00 00 00 00			call		_GetStockObject
02F9  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0300  A1 00 00 00 00			mov		eax,dword ptr mainClass
0305  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
030C  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
0313  50				push		eax
0314  89 9C 24 A4 00 00 00		mov		dword ptr 0xa4[esp],ebx
031B  E8 00 00 00 00			call		_RegisterClassA
0320  25 FF FF 00 00			and		eax,0x0000ffff
0325  0F 84 8B 00 00 00			je		L$10
032B  68 00 7F 00 00			push		0x00007f00
0330  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
0337  89 AC 24 94 00 00 00		mov		dword ptr 0x94[esp],ebp
033E  31 C9				xor		ecx,ecx
0340  BB 00 00 00 00			mov		ebx,offset __MainDriver
0345  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
034C  51				push		ecx
034D  89 8C 24 94 00 00 00		mov		dword ptr 0x94[esp],ecx
0354  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
035B  E8 00 00 00 00			call		_LoadIconA
0360  68 00 7F 00 00			push		0x00007f00
0365  31 F6				xor		esi,esi
0367  56				push		esi
0368  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
036F  E8 00 00 00 00			call		_LoadCursorA
0374  56				push		esi
0375  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
037C  E8 00 00 00 00			call		_GetStockObject
0381  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0388  A1 00 00 00 00			mov		eax,dword ptr _ClassName
038D  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
0394  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
039B  31 FF				xor		edi,edi
039D  50				push		eax
039E  89 BC 24 A4 00 00 00		mov		dword ptr 0xa4[esp],edi
03A5  E8 00 00 00 00			call		_RegisterClassA
03AA  25 FF FF 00 00			and		eax,0x0000ffff
03AF  74 05				je		L$10
03B1  B8 01 00 00 00			mov		eax,0x00000001
03B6				L$10:
03B6  81 C4 A8 00 00 00			add		esp,0x000000a8
03BC  5D				pop		ebp
03BD  5F				pop		edi
03BE  5E				pop		esi
03BF  5B				pop		ebx
03C0  C3				ret		
03C1				windowsInit:
03C1  53				push		ebx
03C2  56				push		esi
03C3  57				push		edi
03C4  55				push		ebp
03C5  83 EC 3C				sub		esp,0x0000003c
03C8  6A 0B				push		0x0000000b
03CA  E8 00 00 00 00			call		_GetStockObject
03CF  89 C2				mov		edx,eax
03D1  A3 00 00 00 00			mov		dword ptr _FixedFont,eax
03D6  89 E0				mov		eax,esp
03D8  50				push		eax
03D9  6A 3C				push		0x0000003c
03DB  52				push		edx
03DC  E8 00 00 00 00			call		_GetObjectA
03E1  89 E0				mov		eax,esp
03E3  50				push		eax
03E4  E8 00 00 00 00			call		_CreateFontIndirectA
03E9  6A 00				push		0x00000000
03EB  A3 00 00 00 00			mov		dword ptr _FixedFont,eax
03F0  E8 00 00 00 00			call		_GetSystemMetrics
03F5  6A 01				push		0x00000001
03F7  89 C3				mov		ebx,eax
03F9  E8 00 00 00 00			call		_GetSystemMetrics
03FE  8B 54 24 50			mov		edx,dword ptr 0x50[esp]
0402  52				push		edx
0403  89 C6				mov		esi,eax
0405  E8 00 00 00 00			call		_InitMainWindowData
040A  83 C4 04				add		esp,0x00000004
040D  6A 00				push		0x00000000
040F  8B 4C 24 54			mov		ecx,dword ptr 0x54[esp]
0413  51				push		ecx
0414  8B 3D 00 00 00 00			mov		edi,dword ptr _MainMenu
041A  57				push		edi
041B  31 C0				xor		eax,eax
041D  6A 00				push		0x00000000
041F  66 89 F0				mov		ax,si
0422  50				push		eax
0423  31 C0				xor		eax,eax
0425  66 89 D8				mov		ax,bx
0428  50				push		eax
0429  6A 00				push		0x00000000
042B  6A 00				push		0x00000000
042D  68 00 00 CF 02			push		0x02cf0000
0432  68 00 00 00 00			push		offset __WinTitleBar
0437  8B 2D 00 00 00 00			mov		ebp,dword ptr mainClass
043D  55				push		ebp
043E  6A 00				push		0x00000000
0440  E8 00 00 00 00			call		_CreateWindowExA
0445  89 C2				mov		edx,eax
0447  A3 00 00 00 00			mov		dword ptr _MainWindow,eax
044C  85 C0				test		eax,eax
044E  0F 84 B7 00 00 00			je		L$11
0454  8B 44 24 54			mov		eax,dword ptr 0x54[esp]
0458  50				push		eax
0459  52				push		edx
045A  E8 00 00 00 00			call		_ShowWindow
045F  8B 15 00 00 00 00			mov		edx,dword ptr _MainWindow
0465  52				push		edx
0466  E8 00 00 00 00			call		_UpdateWindow
046B  E8 00 00 00 00			call		__NTInitFileHandles
0470  E8 00 00 00 00			call		__NTGetFakeHandle
0475  50				push		eax
0476  E8 00 00 00 00			call		__NTAddFileHandle
047B  83 C4 04				add		esp,0x00000004
047E  E8 00 00 00 00			call		__NTGetFakeHandle
0483  50				push		eax
0484  E8 00 00 00 00			call		__NTAddFileHandle
0489  83 C4 04				add		esp,0x00000004
048C  E8 00 00 00 00			call		__NTGetFakeHandle
0491  50				push		eax
0492  E8 00 00 00 00			call		__NTAddFileHandle
0497  83 C4 04				add		esp,0x00000004
049A  6A 00				push		0x00000000
049C  E8 00 00 00 00			call		__IOMode
04A1  83 C4 04				add		esp,0x00000004
04A4  80 CC 20				or		ah,0x20
04A7  50				push		eax
04A8  6A 00				push		0x00000000
04AA  E8 00 00 00 00			call		__SetIOMode
04AF  83 C4 08				add		esp,0x00000008
04B2  6A 01				push		0x00000001
04B4  E8 00 00 00 00			call		__IOMode
04B9  83 C4 04				add		esp,0x00000004
04BC  80 CC 20				or		ah,0x20
04BF  50				push		eax
04C0  6A 01				push		0x00000001
04C2  E8 00 00 00 00			call		__SetIOMode
04C7  83 C4 08				add		esp,0x00000008
04CA  6A 02				push		0x00000002
04CC  E8 00 00 00 00			call		__IOMode
04D1  83 C4 04				add		esp,0x00000004
04D4  80 CC 20				or		ah,0x20
04D7  50				push		eax
04D8  6A 02				push		0x00000002
04DA  E8 00 00 00 00			call		__SetIOMode
04DF  83 C4 08				add		esp,0x00000008
04E2  6A FF				push		0xffffffff
04E4  8B 1D 44 00 00 00			mov		ebx,dword ptr __iob+0x44
04EA  53				push		ebx
04EB  8B 0D 2A 00 00 00			mov		ecx,dword ptr __iob+0x2a
04F1  51				push		ecx
04F2  8B 35 10 00 00 00			mov		esi,dword ptr __iob+0x10
04F8  56				push		esi
04F9  68 81 00 00 00			push		offset DGROUP:L$24
04FE  E8 00 00 00 00			call		_NewWindow
0503  B8 01 00 00 00			mov		eax,0x00000001
0508  83 C4 14				add		esp,0x00000014
050B				L$11:
050B  83 C4 3C				add		esp,0x0000003c
050E  5D				pop		ebp
050F  5F				pop		edi
0510  5E				pop		esi
0511  5B				pop		ebx
0512  C3				ret		

Routine Size: 1186 bytes,    Routine Base: _TEXT + 0071

No disassembly errors

Segment: CONST DWORD USE32 0000008D bytes
0000				L$12:
0000  57 41 54 43 4C 41 53 53 25 64 00                WATCLASS%d.
000B				L$13:
000B  57 41 54 53 55 42 43 4C 41 53 53 25 64 00       WATSUBCLASS%d.
0019				L$14:
0019  26 53 61 76 65 20 41 73 20 2E 2E 2E 00          &Save As ....
0026				L$15:
0026  53 65 74 20 26 4C 69 6E 65 73 20 42 65 74 77 65 Set &Lines Betwe
0036  65 6E 20 41 75 74 6F 2D 43 6C 65 61 72 73 20 2E en Auto-Clears .
0046  2E 2E 00                                        ...
0049				L$16:
0049  45 26 78 69 74 00                               E&xit.
004F				L$17:
004F  26 41 62 6F 75 74 2E 2E 2E 00                   &About....
0059				L$18:
0059  26 43 6C 65 61 72 00                            &Clear.
0060				L$19:
0060  26 43 6F 70 79 00                               &Copy.
0066				L$20:
0066  26 46 69 6C 65 00                               &File.
006C				L$21:
006C  26 45 64 69 74 00                               &Edit.
0072				L$22:
0072  26 57 69 6E 64 6F 77 73 00                      &Windows.
007B				L$23:
007B  26 48 65 6C 70 00                               &Help.
0081				L$24:
0081  53 74 61 6E 64 61 72 64 20 49 4F 00             Standard IO.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				mainClass:

BSS Size: 4 bytes

