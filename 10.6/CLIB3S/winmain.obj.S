Module: winmain
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000522 bytes
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
0019  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
001F  80 E2 02				and		dl,0x02
0022  81 E2 FF 00 00 00			and		edx,0x000000ff
0028  75 08				jne		L$2
002A  80 38 00				cmp		byte ptr [eax],0x00
002D  74 03				je		L$2
002F  40				inc		eax
0030  EB DD				jmp		L$1
0032				L$2:
0032  8A 10				mov		dl,byte ptr [eax]
0034  FE C2				inc		dl
0036  81 E2 FF 00 00 00			and		edx,0x000000ff
003C  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
0042  80 E2 02				and		dl,0x02
0045  81 E2 FF 00 00 00			and		edx,0x000000ff
004B  74 03				je		L$3
004D  40				inc		eax
004E  EB E2				jmp		L$2
0050				L$3:
0050  52				push		edx
0051  E8 00 00 00 00			call		_GetModuleHandleA
0056  50				push		eax
0057  89 C3				mov		ebx,eax
0059  E8 00 00 00 00			call		firstInstance
005E  83 C4 04				add		esp,0x00000004
0061  85 C0				test		eax,eax
0063  74 19				je		L$4
0065  6A 0A				push		0x0000000a
0067  53				push		ebx
0068  E8 00 00 00 00			call		windowsInit
006D  83 C4 08				add		esp,0x00000008
0070  85 C0				test		eax,eax
0072  74 0A				je		L$4
0074  E8 00 00 00 00			call		_InitFunctionPointers
0079  B8 01 00 00 00			mov		eax,0x00000001
007E				L$4:
007E  5B				pop		ebx

Routine Size: 127 bytes,    Routine Base: _TEXT + 0000

007F				__FiniDefaultWin:
007F  C3				ret		

Routine Size: 1 bytes,    Routine Base: _TEXT + 007F

0080				DEFAULTWINMAIN:
0080  56				push		esi
0081  57				push		edi
0082  8B 54 24 18			mov		edx,dword ptr 0x18[esp]
0086  52				push		edx
0087  E8 00 00 00 00			call		firstInstance
008C  83 C4 04				add		esp,0x00000004
008F  85 C0				test		eax,eax
0091  74 3A				je		L$5
0093  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0097  53				push		ebx
0098  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
009C  51				push		ecx
009D  E8 00 00 00 00			call		windowsInit
00A2  83 C4 08				add		esp,0x00000008
00A5  85 C0				test		eax,eax
00A7  74 24				je		L$5
00A9  E8 00 00 00 00			call		_InitFunctionPointers
00AE  8B 35 00 00 00 00			mov		esi,dword ptr ___Argv
00B4  56				push		esi
00B5  8B 3D 00 00 00 00			mov		edi,dword ptr ___Argc
00BB  57				push		edi
00BC  E8 00 00 00 00			call		main
00C1  83 C4 08				add		esp,0x00000008
00C4  89 C3				mov		ebx,eax
00C6  E8 00 00 00 00			call		_WindowsExit
00CB  89 D8				mov		eax,ebx
00CD				L$5:
00CD  5F				pop		edi
00CE  5E				pop		esi
00CF  C2 10 00				ret		0x0010
00D2				firstInstance:
00D2  53				push		ebx
00D3  56				push		esi
00D4  57				push		edi
00D5  55				push		ebp
00D6  81 EC A8 00 00 00			sub		esp,0x000000a8
00DC  8B AC 24 BC 00 00 00		mov		ebp,dword ptr 0xbc[esp]
00E3  55				push		ebp
00E4  68 00 00 00 00			push		offset DGROUP:L$14
00E9  8D 44 24 08			lea		eax,0x8[esp]
00ED  50				push		eax
00EE  E8 00 00 00 00			call		sprintf
00F3  83 C4 0C				add		esp,0x0000000c
00F6  89 E7				mov		edi,esp
00F8  06				push		es
00F9  8C D8				mov		eax,ds
00FB  8E C0				mov		es,eax
00FD  29 C9				sub		ecx,ecx
00FF  49				dec		ecx
0100  31 C0				xor		eax,eax
0102  F2 AE				repne scasb	
0104  F7 D1				not		ecx
0106  49				dec		ecx
0107  07				pop		es
0108  41				inc		ecx
0109  51				push		ecx
010A  E8 00 00 00 00			call		malloc
010F  83 C4 04				add		esp,0x00000004
0112  A3 00 00 00 00			mov		dword ptr mainClass,eax
0117  85 C0				test		eax,eax
0119  0F 84 9A 02 00 00			je		L$10
011F  89 E6				mov		esi,esp
0121  89 C7				mov		edi,eax
0123  57				push		edi
0124				L$6:
0124  8A 06				mov		al,byte ptr [esi]
0126  88 07				mov		byte ptr [edi],al
0128  3C 00				cmp		al,0x00
012A  74 10				je		L$7
012C  8A 46 01				mov		al,byte ptr 0x1[esi]
012F  83 C6 02				add		esi,0x00000002
0132  88 47 01				mov		byte ptr 0x1[edi],al
0135  83 C7 02				add		edi,0x00000002
0138  3C 00				cmp		al,0x00
013A  75 E8				jne		L$6
013C				L$7:
013C  5F				pop		edi
013D  55				push		ebp
013E  68 0B 00 00 00			push		offset DGROUP:L$15
0143  8D 44 24 08			lea		eax,0x8[esp]
0147  50				push		eax
0148  E8 00 00 00 00			call		sprintf
014D  83 C4 0C				add		esp,0x0000000c
0150  89 E7				mov		edi,esp
0152  06				push		es
0153  8C D8				mov		eax,ds
0155  8E C0				mov		es,eax
0157  29 C9				sub		ecx,ecx
0159  49				dec		ecx
015A  31 C0				xor		eax,eax
015C  F2 AE				repne scasb	
015E  F7 D1				not		ecx
0160  49				dec		ecx
0161  07				pop		es
0162  41				inc		ecx
0163  51				push		ecx
0164  E8 00 00 00 00			call		malloc
0169  83 C4 04				add		esp,0x00000004
016C  A3 00 00 00 00			mov		dword ptr _ClassName,eax
0171  85 C0				test		eax,eax
0173  0F 84 40 02 00 00			je		L$10
0179  89 E6				mov		esi,esp
017B  89 C7				mov		edi,eax
017D  57				push		edi
017E				L$8:
017E  8A 06				mov		al,byte ptr [esi]
0180  88 07				mov		byte ptr [edi],al
0182  3C 00				cmp		al,0x00
0184  74 10				je		L$9
0186  8A 46 01				mov		al,byte ptr 0x1[esi]
0189  83 C6 02				add		esi,0x00000002
018C  88 47 01				mov		byte ptr 0x1[edi],al
018F  83 C7 02				add		edi,0x00000002
0192  3C 00				cmp		al,0x00
0194  75 E8				jne		L$8
0196				L$9:
0196  5F				pop		edi
0197  E8 00 00 00 00			call		_CreateMenu
019C  89 C3				mov		ebx,eax
019E  85 C0				test		eax,eax
01A0  0F 84 13 02 00 00			je		L$10
01A6  68 19 00 00 00			push		offset DGROUP:L$16
01AB  6A 03				push		0x00000003
01AD  6A 00				push		0x00000000
01AF  50				push		eax
01B0  E8 00 00 00 00			call		_AppendMenuA
01B5  68 26 00 00 00			push		offset DGROUP:L$17
01BA  6A 05				push		0x00000005
01BC  6A 00				push		0x00000000
01BE  53				push		ebx
01BF  E8 00 00 00 00			call		_AppendMenuA
01C4  6A 00				push		0x00000000
01C6  6A 00				push		0x00000000
01C8  68 00 08 00 00			push		0x00000800
01CD  53				push		ebx
01CE  E8 00 00 00 00			call		_AppendMenuA
01D3  68 49 00 00 00			push		offset DGROUP:L$18
01D8  6A 01				push		0x00000001
01DA  6A 00				push		0x00000000
01DC  53				push		ebx
01DD  E8 00 00 00 00			call		_AppendMenuA
01E2  E8 00 00 00 00			call		_CreateMenu
01E7  89 C6				mov		esi,eax
01E9  85 C0				test		eax,eax
01EB  0F 84 C8 01 00 00			je		L$10
01F1  68 4F 00 00 00			push		offset DGROUP:L$19
01F6  6A 06				push		0x00000006
01F8  6A 00				push		0x00000000
01FA  50				push		eax
01FB  E8 00 00 00 00			call		_AppendMenuA
0200  E8 00 00 00 00			call		_CreateMenu
0205  A3 00 00 00 00			mov		dword ptr _SubMenuEdit,eax
020A  85 C0				test		eax,eax
020C  0F 84 A7 01 00 00			je		L$10
0212  68 59 00 00 00			push		offset DGROUP:L$20
0217  6A 02				push		0x00000002
0219  6A 00				push		0x00000000
021B  50				push		eax
021C  E8 00 00 00 00			call		_AppendMenuA
0221  68 60 00 00 00			push		offset DGROUP:L$21
0226  6A 04				push		0x00000004
0228  6A 00				push		0x00000000
022A  8B 15 00 00 00 00			mov		edx,dword ptr _SubMenuEdit
0230  52				push		edx
0231  E8 00 00 00 00			call		_AppendMenuA
0236  E8 00 00 00 00			call		_CreateMenu
023B  A3 00 00 00 00			mov		dword ptr _SubMenuWindows,eax
0240  E8 00 00 00 00			call		_CreateMenu
0245  A3 00 00 00 00			mov		dword ptr _MainMenu,eax
024A  85 C0				test		eax,eax
024C  0F 84 67 01 00 00			je		L$10
0252  68 66 00 00 00			push		offset DGROUP:L$22
0257  53				push		ebx
0258  6A 10				push		0x00000010
025A  50				push		eax
025B  E8 00 00 00 00			call		_AppendMenuA
0260  68 6C 00 00 00			push		offset DGROUP:L$23
0265  8B 1D 00 00 00 00			mov		ebx,dword ptr _SubMenuEdit
026B  53				push		ebx
026C  6A 10				push		0x00000010
026E  8B 0D 00 00 00 00			mov		ecx,dword ptr _MainMenu
0274  51				push		ecx
0275  E8 00 00 00 00			call		_AppendMenuA
027A  68 72 00 00 00			push		offset DGROUP:L$24
027F  8B 3D 00 00 00 00			mov		edi,dword ptr _SubMenuWindows
0285  57				push		edi
0286  6A 10				push		0x00000010
0288  A1 00 00 00 00			mov		eax,dword ptr _MainMenu
028D  50				push		eax
028E  E8 00 00 00 00			call		_AppendMenuA
0293  68 7B 00 00 00			push		offset DGROUP:L$25
0298  56				push		esi
0299  6A 10				push		0x00000010
029B  8B 15 00 00 00 00			mov		edx,dword ptr _MainMenu
02A1  52				push		edx
02A2  31 DB				xor		ebx,ebx
02A4  E8 00 00 00 00			call		_AppendMenuA
02A9  B9 00 00 00 00			mov		ecx,offset __MainDriver
02AE  68 00 7F 00 00			push		0x00007f00
02B3  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
02BA  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
02C1  89 9C 24 90 00 00 00		mov		dword ptr 0x90[esp],ebx
02C8  53				push		ebx
02C9  89 AC 24 98 00 00 00		mov		dword ptr 0x98[esp],ebp
02D0  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
02D7  E8 00 00 00 00			call		_LoadIconA
02DC  68 00 7F 00 00			push		0x00007f00
02E1  53				push		ebx
02E2  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02E9  E8 00 00 00 00			call		_LoadCursorA
02EE  6A 02				push		0x00000002
02F0  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
02F7  E8 00 00 00 00			call		_GetStockObject
02FC  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0303  A1 00 00 00 00			mov		eax,dword ptr mainClass
0308  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
030F  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
0316  50				push		eax
0317  89 9C 24 A4 00 00 00		mov		dword ptr 0xa4[esp],ebx
031E  E8 00 00 00 00			call		_RegisterClassA
0323  25 FF FF 00 00			and		eax,0x0000ffff
0328  0F 84 8B 00 00 00			je		L$10
032E  68 00 7F 00 00			push		0x00007f00
0333  89 9C 24 84 00 00 00		mov		dword ptr 0x84[esp],ebx
033A  89 AC 24 94 00 00 00		mov		dword ptr 0x94[esp],ebp
0341  31 C9				xor		ecx,ecx
0343  BB 00 00 00 00			mov		ebx,offset __MainDriver
0348  89 8C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ecx
034F  51				push		ecx
0350  89 8C 24 94 00 00 00		mov		dword ptr 0x94[esp],ecx
0357  89 9C 24 8C 00 00 00		mov		dword ptr 0x8c[esp],ebx
035E  E8 00 00 00 00			call		_LoadIconA
0363  68 00 7F 00 00			push		0x00007f00
0368  31 F6				xor		esi,esi
036A  56				push		esi
036B  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
0372  E8 00 00 00 00			call		_LoadCursorA
0377  56				push		esi
0378  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
037F  E8 00 00 00 00			call		_GetStockObject
0384  89 84 24 9C 00 00 00		mov		dword ptr 0x9c[esp],eax
038B  A1 00 00 00 00			mov		eax,dword ptr _ClassName
0390  89 84 24 A4 00 00 00		mov		dword ptr 0xa4[esp],eax
0397  8D 84 24 80 00 00 00		lea		eax,0x80[esp]
039E  31 FF				xor		edi,edi
03A0  50				push		eax
03A1  89 BC 24 A4 00 00 00		mov		dword ptr 0xa4[esp],edi
03A8  E8 00 00 00 00			call		_RegisterClassA
03AD  25 FF FF 00 00			and		eax,0x0000ffff
03B2  74 05				je		L$10
03B4  B8 01 00 00 00			mov		eax,0x00000001
03B9				L$10:
03B9  81 C4 A8 00 00 00			add		esp,0x000000a8
03BF  5D				pop		ebp
03C0  5F				pop		edi
03C1  5E				pop		esi
03C2  5B				pop		ebx
03C3  C3				ret		
03C4				windowsInit:
03C4  53				push		ebx
03C5  56				push		esi
03C6  57				push		edi
03C7  55				push		ebp
03C8  83 EC 3C				sub		esp,0x0000003c
03CB  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
03D2  74 04				je		L$11
03D4  6A 0D				push		0x0000000d
03D6  EB 02				jmp		L$12
03D8				L$11:
03D8  6A 10				push		0x00000010
03DA				L$12:
03DA  E8 00 00 00 00			call		_GetStockObject
03DF  A3 00 00 00 00			mov		dword ptr _FixedFont,eax
03E4  89 E0				mov		eax,esp
03E6  50				push		eax
03E7  6A 3C				push		0x0000003c
03E9  8B 1D 00 00 00 00			mov		ebx,dword ptr _FixedFont
03EF  53				push		ebx
03F0  E8 00 00 00 00			call		_GetObjectA
03F5  89 E0				mov		eax,esp
03F7  50				push		eax
03F8  E8 00 00 00 00			call		_CreateFontIndirectA
03FD  6A 00				push		0x00000000
03FF  A3 00 00 00 00			mov		dword ptr _FixedFont,eax
0404  E8 00 00 00 00			call		_GetSystemMetrics
0409  6A 01				push		0x00000001
040B  89 C3				mov		ebx,eax
040D  E8 00 00 00 00			call		_GetSystemMetrics
0412  8B 4C 24 50			mov		ecx,dword ptr 0x50[esp]
0416  51				push		ecx
0417  89 C6				mov		esi,eax
0419  E8 00 00 00 00			call		_InitMainWindowData
041E  83 C4 04				add		esp,0x00000004
0421  6A 00				push		0x00000000
0423  8B 7C 24 54			mov		edi,dword ptr 0x54[esp]
0427  57				push		edi
0428  8B 2D 00 00 00 00			mov		ebp,dword ptr _MainMenu
042E  55				push		ebp
042F  31 C0				xor		eax,eax
0431  6A 00				push		0x00000000
0433  66 89 F0				mov		ax,si
0436  50				push		eax
0437  31 C0				xor		eax,eax
0439  66 89 D8				mov		ax,bx
043C  50				push		eax
043D  6A 00				push		0x00000000
043F  6A 00				push		0x00000000
0441  68 00 00 CF 02			push		0x02cf0000
0446  68 00 00 00 00			push		offset __WinTitleBar
044B  A1 00 00 00 00			mov		eax,dword ptr mainClass
0450  50				push		eax
0451  6A 00				push		0x00000000
0453  E8 00 00 00 00			call		_CreateWindowExA
0458  A3 00 00 00 00			mov		dword ptr _MainWindow,eax
045D  85 C0				test		eax,eax
045F  0F 84 B5 00 00 00			je		L$13
0465  8B 54 24 54			mov		edx,dword ptr 0x54[esp]
0469  52				push		edx
046A  50				push		eax
046B  E8 00 00 00 00			call		_ShowWindow
0470  8B 1D 00 00 00 00			mov		ebx,dword ptr _MainWindow
0476  53				push		ebx
0477  E8 00 00 00 00			call		_UpdateWindow
047C  6A 00				push		0x00000000
047E  E8 00 00 00 00			call		__IOMode
0483  83 C4 04				add		esp,0x00000004
0486  80 CC 20				or		ah,0x20
0489  50				push		eax
048A  6A 00				push		0x00000000
048C  E8 00 00 00 00			call		__SetIOMode
0491  8A 25 0D 00 00 00			mov		ah,byte ptr __iob+0xd
0497  83 C4 08				add		esp,0x00000008
049A  80 CC 22				or		ah,0x22
049D  6A 01				push		0x00000001
049F  88 25 0D 00 00 00			mov		byte ptr __iob+0xd,ah
04A5  E8 00 00 00 00			call		__IOMode
04AA  83 C4 04				add		esp,0x00000004
04AD  80 CC 20				or		ah,0x20
04B0  50				push		eax
04B1  6A 01				push		0x00000001
04B3  E8 00 00 00 00			call		__SetIOMode
04B8  8A 15 27 00 00 00			mov		dl,byte ptr __iob+0x27
04BE  83 C4 08				add		esp,0x00000008
04C1  80 CA 22				or		dl,0x22
04C4  6A 02				push		0x00000002
04C6  88 15 27 00 00 00			mov		byte ptr __iob+0x27,dl
04CC  E8 00 00 00 00			call		__IOMode
04D1  83 C4 04				add		esp,0x00000004
04D4  80 CC 20				or		ah,0x20
04D7  50				push		eax
04D8  6A 02				push		0x00000002
04DA  E8 00 00 00 00			call		__SetIOMode
04DF  83 C4 08				add		esp,0x00000008
04E2  6A FF				push		0xffffffff
04E4  8B 0D 44 00 00 00			mov		ecx,dword ptr __iob+0x44
04EA  51				push		ecx
04EB  8B 35 2A 00 00 00			mov		esi,dword ptr __iob+0x2a
04F1  56				push		esi
04F2  8B 3D 10 00 00 00			mov		edi,dword ptr __iob+0x10
04F8  8A 35 41 00 00 00			mov		dh,byte ptr __iob+0x41
04FE  57				push		edi
04FF  80 CE 22				or		dh,0x22
0502  68 81 00 00 00			push		offset DGROUP:L$26
0507  88 35 41 00 00 00			mov		byte ptr __iob+0x41,dh
050D  E8 00 00 00 00			call		_NewWindow
0512  B8 01 00 00 00			mov		eax,0x00000001
0517  83 C4 14				add		esp,0x00000014
051A				L$13:
051A  83 C4 3C				add		esp,0x0000003c
051D  5D				pop		ebp
051E  5F				pop		edi
051F  5E				pop		esi
0520  5B				pop		ebx
0521  C3				ret		

Routine Size: 1186 bytes,    Routine Base: _TEXT + 0080

No disassembly errors

Segment: CONST DWORD USE32 0000008D bytes
0000				L$14:
0000  57 41 54 43 4C 41 53 53 25 64 00                WATCLASS%d.
000B				L$15:
000B  57 41 54 53 55 42 43 4C 41 53 53 25 64 00       WATSUBCLASS%d.
0019				L$16:
0019  26 53 61 76 65 20 41 73 20 2E 2E 2E 00          &Save As ....
0026				L$17:
0026  53 65 74 20 26 4C 69 6E 65 73 20 42 65 74 77 65 Set &Lines Betwe
0036  65 6E 20 41 75 74 6F 2D 43 6C 65 61 72 73 20 2E en Auto-Clears .
0046  2E 2E 00                                        ...
0049				L$18:
0049  45 26 78 69 74 00                               E&xit.
004F				L$19:
004F  26 41 62 6F 75 74 2E 2E 2E 00                   &About....
0059				L$20:
0059  26 43 6C 65 61 72 00                            &Clear.
0060				L$21:
0060  26 43 6F 70 79 00                               &Copy.
0066				L$22:
0066  26 46 69 6C 65 00                               &File.
006C				L$23:
006C  26 45 64 69 74 00                               &Edit.
0072				L$24:
0072  26 57 69 6E 64 6F 77 73 00                      &Windows.
007B				L$25:
007B  26 48 65 6C 70 00                               &Help.
0081				L$26:
0081  53 74 61 6E 64 61 72 64 20 49 4F 00             Standard IO.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				mainClass:

BSS Size: 4 bytes

