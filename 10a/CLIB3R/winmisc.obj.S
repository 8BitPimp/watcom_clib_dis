Module: winmisc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000275 bytes
0000				_SetMyDC_:
0000  51				push		ecx
0001  56				push		esi
0002  89 C6				mov		esi,eax
0004  52				push		edx
0005  50				push		eax
0006  E8 00 00 00 00			call		_SetBkColor
000B  53				push		ebx
000C  56				push		esi
000D  E8 00 00 00 00			call		_SetTextColor
0012  8B 15 00 00 00 00			mov		edx,dword ptr __FixedFont
0018  52				push		edx
0019  56				push		esi
001A  E8 00 00 00 00			call		_SelectObject
001F  5E				pop		esi
0020  59				pop		ecx
0021  C3				ret		

Routine Size: 34 bytes,    Routine Base: _TEXT + 0000

0022				_MessageLoop_:
0022  53				push		ebx
0023  51				push		ecx
0024  52				push		edx
0025  56				push		esi
0026  83 EC 1C				sub		esp,0x0000001c
0029  89 C6				mov		esi,eax
002B  BB 01 00 00 00			mov		ebx,0x00000001
0030				L$1:
0030  6A 02				push		0x00000002
0032  6A 00				push		0x00000000
0034  6A 00				push		0x00000000
0036  6A 00				push		0x00000000
0038  8D 44 24 10			lea		eax,0x10[esp]
003C  50				push		eax
003D  E8 00 00 00 00			call		_PeekMessageA
0042  85 C0				test		eax,eax
0044  74 40				je		L$3
0046  6A 00				push		0x00000000
0048  6A 00				push		0x00000000
004A  6A 00				push		0x00000000
004C  8D 44 24 0C			lea		eax,0xc[esp]
0050  50				push		eax
0051  E8 00 00 00 00			call		_GetMessageA
0056  89 C3				mov		ebx,eax
0058  66 85 C0				test		ax,ax
005B  75 17				jne		L$2
005D  85 F6				test		esi,esi
005F  74 25				je		L$3
0061  31 D2				xor		edx,edx
0063  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0067  89 15 00 00 00 00			mov		dword ptr __WindowExitRtn,edx
006D  E8 00 00 00 00			call		exit_
0072  EB 12				jmp		L$3
0074				L$2:
0074  89 E0				mov		eax,esp
0076  50				push		eax
0077  E8 00 00 00 00			call		_TranslateMessage
007C  89 E0				mov		eax,esp
007E  50				push		eax
007F  E8 00 00 00 00			call		_DispatchMessageA
0084  EB AA				jmp		L$1
0086				L$3:
0086  6A 00				push		0x00000000
0088  E8 00 00 00 00			call		_Sleep
008D  31 C0				xor		eax,eax
008F  66 89 D8				mov		ax,bx
0092  83 C4 1C				add		esp,0x0000001c
0095  5E				pop		esi
0096  5A				pop		edx
0097  59				pop		ecx
0098  5B				pop		ebx
0099  C3				ret		

Routine Size: 120 bytes,    Routine Base: _TEXT + 0022

009A				_OutOfMemory_:
009A  51				push		ecx
009B  52				push		edx
009C  6A 00				push		0x00000000
009E  68 00 00 00 00			push		offset DGROUP:L$12
00A3  68 0D 00 00 00			push		offset DGROUP:L$13
00A8  6A 00				push		0x00000000
00AA  E8 00 00 00 00			call		_MessageBoxA
00AF  5A				pop		edx
00B0  59				pop		ecx
00B1  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 009A

00B2				_ExecutionComplete_:
00B2  E9 00 00 00 00			jmp		flushall_

Routine Size: 5 bytes,    Routine Base: _TEXT + 00B2

00B7				_SetConTitle_:
00B7  51				push		ecx
00B8  52				push		edx
00B9  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
00BC  52				push		edx
00BD  E8 00 00 00 00			call		_SetWindowTextA
00C2  B8 01 00 00 00			mov		eax,0x00000001
00C7  59				pop		ecx
00C8  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 00B7

00C9				_SetAppTitle_:
00C9  51				push		ecx
00CA  52				push		edx
00CB  50				push		eax
00CC  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
00D2  52				push		edx
00D3  E8 00 00 00 00			call		_SetWindowTextA
00D8  B8 01 00 00 00			mov		eax,0x00000001
00DD  5A				pop		edx
00DE  59				pop		ecx
00DF  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 00C9

00E0				_ShutDown_:
00E0  51				push		ecx
00E1  52				push		edx
00E2  8B 15 00 00 00 00			mov		edx,dword ptr __MainWindow
00E8  52				push		edx
00E9  E8 00 00 00 00			call		_DestroyWindow
00EE  31 C0				xor		eax,eax
00F0  5A				pop		edx
00F1  59				pop		ecx
00F2  C3				ret		

Routine Size: 19 bytes,    Routine Base: _TEXT + 00E0

00F3				_CloseWindow_:
00F3  51				push		ecx
00F4  52				push		edx
00F5  F6 40 52 20			test		byte ptr 0x52[eax],0x20
00F9  74 09				je		L$4
00FB  8B 50 3A				mov		edx,dword ptr 0x3a[eax]
00FE  52				push		edx
00FF  E8 00 00 00 00			call		_DestroyWindow
0104				L$4:
0104  31 C0				xor		eax,eax
0106  5A				pop		edx
0107  59				pop		ecx
0108  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 00F3

0109				_NewCursor_:
0109  53				push		ebx
010A  51				push		ecx
010B  56				push		esi
010C  57				push		edi
010D  83 EC 04				sub		esp,0x00000004
0110  89 C3				mov		ebx,eax
0112  88 14 24				mov		byte ptr [esp],dl
0115  F6 40 52 04			test		byte ptr 0x52[eax],0x04
0119  74 09				je		L$5
011B  E8 00 00 00 00			call		_DestroyCaret
0120  80 63 52 FB			and		byte ptr 0x52[ebx],0xfb
0124				L$5:
0124  8A 34 24				mov		dh,byte ptr [esp]
0127  80 FE 03				cmp		dh,0x03
012A  74 33				je		L$9
012C  88 73 6F				mov		byte ptr 0x6f[ebx],dh
012F  80 FE 01				cmp		dh,0x01
0132  72 04				jb		L$6
0134  76 14				jbe		L$7
0136  EB 27				jmp		L$9
0138				L$6:
0138  84 F6				test		dh,dh
013A  75 23				jne		L$9
013C  8B 73 2C				mov		esi,dword ptr 0x2c[ebx]
013F  56				push		esi
0140  6A 00				push		0x00000000
0142  6A 00				push		0x00000000
0144  8B 7B 3A				mov		edi,dword ptr 0x3a[ebx]
0147  57				push		edi
0148  EB 0C				jmp		L$8
014A				L$7:
014A  8B 53 2C				mov		edx,dword ptr 0x2c[ebx]
014D  52				push		edx
014E  6A 04				push		0x00000004
0150  6A 00				push		0x00000000
0152  8B 4B 3A				mov		ecx,dword ptr 0x3a[ebx]
0155  51				push		ecx
0156				L$8:
0156  E8 00 00 00 00			call		_CreateCaret
015B  80 4B 52 04			or		byte ptr 0x52[ebx],0x04
015F				L$9:
015F  83 C4 04				add		esp,0x00000004
0162  5F				pop		edi
0163  5E				pop		esi
0164  59				pop		ecx
0165  5B				pop		ebx
0166  C3				ret		

Routine Size: 94 bytes,    Routine Base: _TEXT + 0109

0167				_DisplayCursor_:
0167  53				push		ebx
0168  51				push		ecx
0169  52				push		edx
016A  56				push		esi
016B  57				push		edi
016C  55				push		ebp
016D  89 C3				mov		ebx,eax
016F  8B 40 46				mov		eax,dword ptr 0x46[eax]
0172  8B 53 4E				mov		edx,dword ptr 0x4e[ebx]
0175  8B 4B 2C				mov		ecx,dword ptr 0x2c[ebx]
0178  29 D0				sub		eax,edx
017A  0F AF C1				imul		eax,ecx
017D  8B 73 5B				mov		esi,dword ptr 0x5b[ebx]
0180  50				push		eax
0181  8B 43 57				mov		eax,dword ptr 0x57[ebx]
0184  8B 7B 28				mov		edi,dword ptr 0x28[ebx]
0187  01 F0				add		eax,esi
0189  0F AF C7				imul		eax,edi
018C  40				inc		eax
018D  50				push		eax
018E  E8 00 00 00 00			call		_SetCaretPos
0193  8B 6B 3A				mov		ebp,dword ptr 0x3a[ebx]
0196  55				push		ebp
0197  E8 00 00 00 00			call		_ShowCaret
019C  5D				pop		ebp
019D  5F				pop		edi
019E  5E				pop		esi
019F  5A				pop		edx
01A0  59				pop		ecx
01A1  5B				pop		ebx
01A2  C3				ret		

Routine Size: 60 bytes,    Routine Base: _TEXT + 0167

01A3				_SetInputMode_:
01A3  53				push		ebx
01A4  51				push		ecx
01A5  89 50 6B				mov		dword ptr 0x6b[eax],edx
01A8  85 D2				test		edx,edx
01AA  0F 95 C0				setne		al
01AD  30 E4				xor		ah,ah
01AF  25 FF FF 00 00			and		eax,0x0000ffff
01B4  50				push		eax
01B5  6A 02				push		0x00000002
01B7  8B 1D 00 00 00 00			mov		ebx,dword ptr __SubMenuEdit
01BD  53				push		ebx
01BE  E8 00 00 00 00			call		_EnableMenuItem
01C3  59				pop		ecx
01C4  5B				pop		ebx
01C5  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 01A3

01C6				_ShowWindowActive_:
01C6  53				push		ebx
01C7  51				push		ecx
01C8  56				push		esi
01C9  57				push		edi
01CA  55				push		ebp
01CB  89 C3				mov		ebx,eax
01CD  89 D6				mov		esi,edx
01CF  85 D2				test		edx,edx
01D1  74 3F				je		L$10
01D3  8B 12				mov		edx,dword ptr [edx]
01D5  B8 C8 00 00 00			mov		eax,0x000000c8
01DA  8B 0A				mov		ecx,dword ptr [edx]
01DC  6A 00				push		0x00000000
01DE  8D 14 08				lea		edx,[eax+ecx]
01E1  52				push		edx
01E2  8B 3D 00 00 00 00			mov		edi,dword ptr __SubMenuWindows
01E8  57				push		edi
01E9  E8 00 00 00 00			call		_CheckMenuItem
01EE  6A 00				push		0x00000000
01F0  6A 00				push		0x00000000
01F2  68 86 00 00 00			push		0x00000086
01F7  8B 6E 3A				mov		ebp,dword ptr 0x3a[esi]
01FA  55				push		ebp
01FB  E8 00 00 00 00			call		_SendMessageA
0200  80 7E 6F 02			cmp		byte ptr 0x6f[esi],0x02
0204  74 0C				je		L$10
0206  BA 03 00 00 00			mov		edx,0x00000003
020B  89 F0				mov		eax,esi
020D  E8 00 00 00 00			call		_NewCursor_
0212				L$10:
0212  85 DB				test		ebx,ebx
0214  74 59				je		L$11
0216  8B 33				mov		esi,dword ptr [ebx]
0218  BA C8 00 00 00			mov		edx,0x000000c8
021D  8B 06				mov		eax,dword ptr [esi]
021F  6A 08				push		0x00000008
0221  01 C2				add		edx,eax
0223  52				push		edx
0224  8B 15 00 00 00 00			mov		edx,dword ptr __SubMenuWindows
022A  52				push		edx
022B  E8 00 00 00 00			call		_CheckMenuItem
0230  6A 05				push		0x00000005
0232  8B 4B 3A				mov		ecx,dword ptr 0x3a[ebx]
0235  51				push		ecx
0236  E8 00 00 00 00			call		_ShowWindow
023B  6A 00				push		0x00000000
023D  6A 01				push		0x00000001
023F  68 86 00 00 00			push		0x00000086
0244  8B 73 3A				mov		esi,dword ptr 0x3a[ebx]
0247  56				push		esi
0248  E8 00 00 00 00			call		_SendMessageA
024D  8B 7B 3A				mov		edi,dword ptr 0x3a[ebx]
0250  57				push		edi
0251  E8 00 00 00 00			call		_BringWindowToTop
0256  80 7B 6F 02			cmp		byte ptr 0x6f[ebx],0x02
025A  74 13				je		L$11
025C  31 D2				xor		edx,edx
025E  89 D8				mov		eax,ebx
0260  8A 53 6F				mov		dl,byte ptr 0x6f[ebx]
0263  E8 00 00 00 00			call		_NewCursor_
0268  89 D8				mov		eax,ebx
026A  E8 00 00 00 00			call		_DisplayCursor_
026F				L$11:
026F  5D				pop		ebp
0270  5F				pop		edi
0271  5E				pop		esi
0272  59				pop		ecx
0273  5B				pop		ebx
0274  C3				ret		

Routine Size: 175 bytes,    Routine Base: _TEXT + 01C6

No disassembly errors

Segment: CONST DWORD USE32 0000001C bytes
0000				L$12:
0000  53 59 53 54 45 4D 20 45 52 52 4F 52 00          SYSTEM ERROR.
000D				L$13:
000D  4F 75 74 20 4F 66 20 4D 65 6D 6F 72 79 21 00    Out Of Memory!.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

