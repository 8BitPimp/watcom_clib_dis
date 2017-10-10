Module: windlg
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000188 bytes
0000				__GetIntervalBox:
0000  53				push		ebx
0001  56				push		esi
0002  81 EC 80 00 00 00			sub		esp,0x00000080
0008  8B B4 24 8C 00 00 00		mov		esi,dword ptr 0x8c[esp]
000F  8B 84 24 90 00 00 00		mov		eax,dword ptr 0x90[esp]
0016  3D 10 01 00 00			cmp		eax,0x00000110
001B  72 0E				jb		L$1
001D  76 13				jbe		L$2
001F  3D 11 01 00 00			cmp		eax,0x00000111
0024  74 31				je		L$3
0026  E9 73 00 00 00			jmp		L$8
002B				L$1:
002B  83 F8 10				cmp		eax,0x00000010
002E  74 69				je		L$7
0030  EB 6C				jmp		L$8
0032				L$2:
0032  89 E2				mov		edx,esp
0034  BB 0A 00 00 00			mov		ebx,0x0000000a
0039  A1 00 00 00 00			mov		eax,dword ptr __AutoClearLines
003E  E8 00 00 00 00			call		ultoa_
0043  89 E0				mov		eax,esp
0045  50				push		eax
0046  6A 00				push		0x00000000
0048  68 C2 00 00 00			push		0x000000c2
004D  6A 0A				push		0x0000000a
004F  56				push		esi
0050  E8 00 00 00 00			call		_SendDlgItemMessageA
0055  EB 31				jmp		L$5
0057				L$3:
0057  66 83 BC 24 94 00 00 00 01	cmp		word ptr 0x94[esp],0x0001
0060  75 2D				jne		L$6
0062  68 80 00 00 00			push		0x00000080
0067  8D 44 24 04			lea		eax,0x4[esp]
006B  50				push		eax
006C  6A 0A				push		0x0000000a
006E  56				push		esi
006F  E8 00 00 00 00			call		_GetDlgItemTextA
0074  89 E0				mov		eax,esp
0076  E8 00 00 00 00			call		atol_
007B  6A 01				push		0x00000001
007D  56				push		esi
007E  A3 00 00 00 00			mov		dword ptr __AutoClearLines,eax
0083				L$4:
0083  E8 00 00 00 00			call		_EndDialog
0088				L$5:
0088  B8 01 00 00 00			mov		eax,0x00000001
008D  EB 11				jmp		L$9
008F				L$6:
008F  83 BC 24 94 00 00 00 02		cmp		dword ptr 0x94[esp],0x00000002
0097  75 05				jne		L$8
0099				L$7:
0099  6A 01				push		0x00000001
009B  56				push		esi
009C  EB E5				jmp		L$4
009E				L$8:
009E  31 C0				xor		eax,eax
00A0				L$9:
00A0  81 C4 80 00 00 00			add		esp,0x00000080
00A6  5E				pop		esi
00A7  5B				pop		ebx
00A8  C2 10 00				ret		0x0010

Routine Size: 171 bytes,    Routine Base: _TEXT + 0000

00AB				_GetClearInterval_:
00AB  53				push		ebx
00AC  51				push		ecx
00AD  52				push		edx
00AE  56				push		esi
00AF  57				push		edi
00B0  55				push		ebp
00B1  68 24 00 00 00			push		offset DGROUP:L$17
00B6  6A 00				push		0x00000000
00B8  68 38 00 00 00			push		offset DGROUP:L$21
00BD  68 24 00 00 00			push		offset DGROUP:L$17
00C2  68 24 00 00 00			push		offset DGROUP:L$17
00C7  B8 A0 00 C8 00			mov		eax,0x00c800a0
00CC  BA 16 00 00 00			mov		edx,0x00000016
00D1  6A 3C				push		0x0000003c
00D3  BB 19 00 00 00			mov		ebx,0x00000019
00D8  B9 96 00 00 00			mov		ecx,0x00000096
00DD  E8 00 00 00 00			call		_DialogTemplate_
00E2  89 C7				mov		edi,eax
00E4  85 C0				test		eax,eax
00E6  0F 84 95 00 00 00			je		L$13
00EC  BD 21 00 00 00			mov		ebp,0x00000021
00F1  31 F6				xor		esi,esi
00F3  81 C5 00 00 00 00			add		ebp,offset __getint
00F9  EB 61				jmp		L$12
00FB				L$10:
00FB  6B C6 22				imul		eax,esi,0x00000022
00FE  31 D2				xor		edx,edx
0100  55				push		ebp
0101  8A 90 20 00 00 00			mov		dl,byte ptr __getint+0x20[eax]
0107  52				push		edx
0108  8B 90 1C 00 00 00			mov		edx,dword ptr __getint+0x1c[eax]
010E  52				push		edx
010F  8B 98 18 00 00 00			mov		ebx,dword ptr __getint+0x18[eax]
0115  8B 90 14 00 00 00			mov		edx,dword ptr __getint+0x14[eax]
011B  53				push		ebx
011C  81 CA 00 00 00 10			or		edx,0x10000000
0122  52				push		edx
0123  8B 88 10 00 00 00			mov		ecx,dword ptr __getint+0x10[eax]
0129  51				push		ecx
012A  8B 90 0C 00 00 00			mov		edx,dword ptr __getint+0xc[eax]
0130  8B 98 04 00 00 00			mov		ebx,dword ptr __getint+0x4[eax]
0136  52				push		edx
0137  8B 88 08 00 00 00			mov		ecx,dword ptr __getint+0x8[eax]
013D  8B 90 00 00 00 00			mov		edx,dword ptr __getint[eax]
0143  89 F8				mov		eax,edi
0145  E8 00 00 00 00			call		_AddControl_
014A  85 C0				test		eax,eax
014C  75 08				jne		L$11
014E  57				push		edi
014F  E8 00 00 00 00			call		_GlobalFree
0154  EB 2B				jmp		L$13
0156				L$11:
0156  89 C7				mov		edi,eax
0158  83 C5 22				add		ebp,0x00000022
015B  46				inc		esi
015C				L$12:
015C  83 FE 04				cmp		esi,0x00000004
015F  72 9A				jb		L$10
0161  89 F8				mov		eax,edi
0163  E8 00 00 00 00			call		_DoneAddingControls_
0168  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
016D  89 F9				mov		ecx,edi
016F  8B 1D 00 00 00 00			mov		ebx,dword ptr __MainWindow
0175  8B 10				mov		edx,dword ptr [eax]
0177  B8 00 00 00 00			mov		eax,offset __GetIntervalBox
017C  E8 00 00 00 00			call		_DynamicDialogBox_
0181				L$13:
0181  5D				pop		ebp
0182  5F				pop		edi
0183  5E				pop		esi
0184  5A				pop		edx
0185  59				pop		ecx
0186  5B				pop		ebx
0187  C3				ret		

Routine Size: 221 bytes,    Routine Base: _TEXT + 00AB

No disassembly errors

Segment: CONST DWORD USE32 00000060 bytes
0000				L$14:
0000  53 54 41 54 49 43 00                            STATIC.
0007				L$15:
0007  26 45 6E 74 65 72 20 4E 75 6D 62 65 72 20 6F 66 &Enter Number of
0017  20 4C 69 6E 65 73 3A 00                          Lines:.
001F				L$16:
001F  45 44 49 54 00                                  EDIT.
0024				L$17:
0024  00                                              .
0025				L$18:
0025  42 55 54 54 4F 4E 00                            BUTTON.
002C				L$19:
002C  26 4F 4B 00                                     &OK.
0030				L$20:
0030  26 43 61 6E 63 65 6C 00                         &Cancel.
0038				L$21:
0038  53 65 74 20 4E 75 6D 62 65 72 20 6F 66 20 4C 69 Set Number of Li
0048  6E 65 73 20 42 65 74 77 65 65 6E 20 41 75 74 6F nes Between Auto
0058  2D 43 6C 65 61 72 73 00                         -Clears.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000088 bytes
0000				__getint:
0000  04 00 00 00 0A 00 00 00 32 00 00 00 18 00 00 00 ........2.......
0010  FF FF FF FF 00 00 00 00                         ........
0018  00 00 00 00                                     DD	offset DGROUP:L$14
001C  07 00 00 00                                     DD	offset DGROUP:L$15
0020  00 00 37 00 00 00 0E 00 00 00 44 00 00 00 0C 00 ..7.......D.....
0030  00 00 0A 00 00 00 00 00 83 00                   ..........
003A  1F 00 00 00                                     DD	offset DGROUP:L$16
003E  24 00 00 00                                     DD	offset DGROUP:L$17
0042  00 00 1E 00 00 00 26 00 00 00 24 00 00 00 0C 00 ......&...$.....
0052  00 00 01 00 00 00 01 00 03 00                   ..........
005C  25 00 00 00                                     DD	offset DGROUP:L$18
0060  2C 00 00 00                                     DD	offset DGROUP:L$19
0064  00 00 54 00 00 00 26 00 00 00 24 00 00 00 0C 00 ..T...&...$.....
0074  00 00 02 00 00 00 00 00 03 00                   ..........
007E  25 00 00 00                                     DD	offset DGROUP:L$18
0082  30 00 00 00                                     DD	offset DGROUP:L$20
0086  00 00                                           ..

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

