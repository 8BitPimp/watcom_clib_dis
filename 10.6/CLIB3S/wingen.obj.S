Module: wingen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000584 bytes
0000				_GetWindowData:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 35 00 00 00 00			mov		esi,dword ptr _MainWindowData
0009  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
000D  31 DB				xor		ebx,ebx
000F  31 D2				xor		edx,edx
0011  EB 0F				jmp		L$2
0013				L$1:
0013  8B 46 04				mov		eax,dword ptr 0x4[esi]
0016  8B 04 02				mov		eax,dword ptr [edx+eax]
0019  3B 48 3A				cmp		ecx,dword ptr 0x3a[eax]
001C  74 0F				je		L$3
001E  83 C2 04				add		edx,0x00000004
0021  43				inc		ebx
0022				L$2:
0022  8B 7E 08				mov		edi,dword ptr 0x8[esi]
0025  89 F0				mov		eax,esi
0027  39 FB				cmp		ebx,edi
0029  7C E8				jl		L$1
002B  31 F0				xor		eax,esi
002D				L$3:
002D  89 35 00 00 00 00			mov		dword ptr _MainWindowData,esi
0033  5F				pop		edi
0034  5E				pop		esi
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				_GetActiveWindowData:
0037  53				push		ebx
0038  56				push		esi
0039  8B 35 00 00 00 00			mov		esi,dword ptr _MainWindowData
003F  31 DB				xor		ebx,ebx
0041  31 D2				xor		edx,edx
0043  EB 10				jmp		L$5
0045				L$4:
0045  8B 46 04				mov		eax,dword ptr 0x4[esi]
0048  8B 04 02				mov		eax,dword ptr [edx+eax]
004B  F6 40 52 02			test		byte ptr 0x52[eax],0x02
004F  75 0F				jne		L$6
0051  83 C2 04				add		edx,0x00000004
0054  43				inc		ebx
0055				L$5:
0055  8B 4E 08				mov		ecx,dword ptr 0x8[esi]
0058  89 F0				mov		eax,esi
005A  39 CB				cmp		ebx,ecx
005C  7C E7				jl		L$4
005E  31 F0				xor		eax,esi
0060				L$6:
0060  89 35 00 00 00 00			mov		dword ptr _MainWindowData,esi
0066  5E				pop		esi
0067  5B				pop		ebx
0068  C3				ret		

Routine Size: 50 bytes,    Routine Base: _TEXT + 0037

0069				_MakeWindowActive:
0069  53				push		ebx
006A  56				push		esi
006B  57				push		edi
006C  55				push		ebp
006D  8B 2D 00 00 00 00			mov		ebp,dword ptr _MainWindowData
0073  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
0077  31 F6				xor		esi,esi
0079  31 DB				xor		ebx,ebx
007B  31 D2				xor		edx,edx
007D  EB 1E				jmp		L$9
007F				L$7:
007F  8B 45 04				mov		eax,dword ptr 0x4[ebp]
0082  8B 04 02				mov		eax,dword ptr [edx+eax]
0085  8A 48 52				mov		cl,byte ptr 0x52[eax]
0088  F6 C1 02				test		cl,0x02
008B  74 0C				je		L$8
008D  88 CD				mov		ch,cl
008F  80 E5 FD				and		ch,0xfd
0092  89 C6				mov		esi,eax
0094  88 68 52				mov		byte ptr 0x52[eax],ch
0097  EB 0D				jmp		L$10
0099				L$8:
0099  83 C2 04				add		edx,0x00000004
009C  43				inc		ebx
009D				L$9:
009D  8B 4D 08				mov		ecx,dword ptr 0x8[ebp]
00A0  89 E8				mov		eax,ebp
00A2  39 CB				cmp		ebx,ecx
00A4  7C D9				jl		L$7
00A6				L$10:
00A6  80 4F 52 02			or		byte ptr 0x52[edi],0x02
00AA  39 FE				cmp		esi,edi
00AC  75 02				jne		L$11
00AE  31 FE				xor		esi,edi
00B0				L$11:
00B0  56				push		esi
00B1  57				push		edi
00B2  89 2D 00 00 00 00			mov		dword ptr _MainWindowData,ebp
00B8  E8 00 00 00 00			call		_ShowWindowActive
00BD  8B 2D 00 00 00 00			mov		ebp,dword ptr _MainWindowData
00C3				L$12:
00C3  83 C4 08				add		esp,0x00000008
00C6  5D				pop		ebp
00C7  5F				pop		edi
00C8  5E				pop		esi
00C9  5B				pop		ebx
00CA  C3				ret		

Routine Size: 98 bytes,    Routine Base: _TEXT + 0069

00CB				_IsWindowedHandle:
00CB  53				push		ebx
00CC  56				push		esi
00CD  57				push		edi
00CE  55				push		ebp
00CF  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
00D3  31 FF				xor		edi,edi
00D5  31 ED				xor		ebp,ebp
00D7  EB 20				jmp		L$16
00D9				L$13:
00D9  8B 40 04				mov		eax,dword ptr 0x4[eax]
00DC  31 D2				xor		edx,edx
00DE  31 DB				xor		ebx,ebx
00E0  8B 04 28				mov		eax,dword ptr [eax+ebp]
00E3  EB 0B				jmp		L$15
00E5				L$14:
00E5  8B 08				mov		ecx,dword ptr [eax]
00E7  3B 34 19				cmp		esi,dword ptr [ecx+ebx]
00EA  74 19				je		L$17
00EC  83 C3 04				add		ebx,0x00000004
00EF  42				inc		edx
00F0				L$15:
00F0  3B 50 04				cmp		edx,dword ptr 0x4[eax]
00F3  7C F0				jl		L$14
00F5  83 C5 04				add		ebp,0x00000004
00F8  47				inc		edi
00F9				L$16:
00F9  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
00FE  3B 78 08				cmp		edi,dword ptr 0x8[eax]
0101  7C D6				jl		L$13
0103  31 C0				xor		eax,eax
0105				L$17:
0105  5D				pop		ebp
0106  5F				pop		edi
0107  5E				pop		esi
0108  5B				pop		ebx
0109  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 00CB

010A				_RemoveWindowedHandle:
010A  53				push		ebx
010B  56				push		esi
010C  57				push		edi
010D  55				push		ebp
010E  83 EC 08				sub		esp,0x00000008
0111  31 D2				xor		edx,edx
0113  89 14 24				mov		dword ptr [esp],edx
0116  89 54 24 04			mov		dword ptr 0x4[esp],edx
011A  EB 59				jmp		L$24
011C				L$18:
011C  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
0120  8B 50 04				mov		edx,dword ptr 0x4[eax]
0123  01 F2				add		edx,esi
0125  31 FF				xor		edi,edi
0127  31 ED				xor		ebp,ebp
0129  8B 12				mov		edx,dword ptr [edx]
012B  EB 31				jmp		L$23
012D				L$19:
012D  8B 02				mov		eax,dword ptr [edx]
012F  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
0133  3B 1C 28				cmp		ebx,dword ptr [eax+ebp]
0136  75 22				jne		L$22
0138  89 F9				mov		ecx,edi
013A  8B 72 04				mov		esi,dword ptr 0x4[edx]
013D  89 FB				mov		ebx,edi
013F  4E				dec		esi
0140  C1 E3 02				shl		ebx,0x02
0143  89 72 04				mov		dword ptr 0x4[edx],esi
0146  EB 0D				jmp		L$21
0148				L$20:
0148  8B 02				mov		eax,dword ptr [edx]
014A  8B 74 03 04			mov		esi,dword ptr 0x4[ebx+eax]
014E  41				inc		ecx
014F  89 34 03				mov		dword ptr [ebx+eax],esi
0152  83 C3 04				add		ebx,0x00000004
0155				L$21:
0155  3B 4A 04				cmp		ecx,dword ptr 0x4[edx]
0158  7C EE				jl		L$20
015A				L$22:
015A  83 C5 04				add		ebp,0x00000004
015D  47				inc		edi
015E				L$23:
015E  3B 7A 04				cmp		edi,dword ptr 0x4[edx]
0161  7C CA				jl		L$19
0163  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0167  8B 1C 24				mov		ebx,dword ptr [esp]
016A  83 C2 04				add		edx,0x00000004
016D  43				inc		ebx
016E  89 54 24 04			mov		dword ptr 0x4[esp],edx
0172  89 1C 24				mov		dword ptr [esp],ebx
0175				L$24:
0175  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
017A  8B 14 24				mov		edx,dword ptr [esp]
017D  3B 50 08				cmp		edx,dword ptr 0x8[eax]
0180  7C 9A				jl		L$18
0182  E9 3C FF FF FF			jmp		L$12

Routine Size: 125 bytes,    Routine Base: _TEXT + 010A

0187				_WindowsExit:
0187  53				push		ebx
0188  E8 00 00 00 00			call		_ExecutionComplete
018D  83 3D 00 00 00 00 00		cmp		dword ptr _MainWindowDestroyed,0x00000000
0194  75 0E				jne		L$26
0196				L$25:
0196  6A 00				push		0x00000000
0198  E8 00 00 00 00			call		_BlockingMessageLoop
019D  83 C4 04				add		esp,0x00000004
01A0  85 C0				test		eax,eax
01A2  75 F2				jne		L$25
01A4				L$26:
01A4  31 DB				xor		ebx,ebx
01A6  89 1D 00 00 00 00			mov		dword ptr _WindowExitRtn,ebx
01AC  5B				pop		ebx
01AD  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0187

01AE				_DestroyOnClose:
01AE  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01B2  80 48 52 20			or		byte ptr 0x52[eax],0x20
01B6  B8 01 00 00 00			mov		eax,0x00000001
01BB  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 01AE

01BC				_YieldControl:
01BC  6A 01				push		0x00000001
01BE  E8 00 00 00 00			call		_MessageLoop
01C3  B8 01 00 00 00			mov		eax,0x00000001
01C8  83 C4 04				add		esp,0x00000004
01CB  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 01BC

01CC				_InitFunctionPointers:
01CC  53				push		ebx
01CD  56				push		esi
01CE  57				push		edi
01CF  55				push		ebp
01D0  BA 00 00 00 00			mov		edx,offset _DoStdin
01D5  BB 00 00 00 00			mov		ebx,offset _DoStdout
01DA  B9 00 00 00 00			mov		ecx,offset _DoKbhit
01DF  BE 00 00 00 00			mov		esi,offset _DoGetch
01E4  BF 00 00 00 00			mov		edi,offset _DoGetche
01E9  BD 00 00 00 00			mov		ebp,offset _DoPutch
01EE  B8 00 00 00 00			mov		eax,offset _WindowsExit
01F3  89 15 00 00 00 00			mov		dword ptr _WindowsStdin,edx
01F9  89 1D 00 00 00 00			mov		dword ptr _WindowsStdout,ebx
01FF  89 0D 00 00 00 00			mov		dword ptr _WindowsKbhit,ecx
0205  89 35 00 00 00 00			mov		dword ptr _WindowsGetch,esi
020B  89 3D 00 00 00 00			mov		dword ptr _WindowsGetche,edi
0211  89 2D 00 00 00 00			mov		dword ptr _WindowsPutch,ebp
0217  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
021C  BA 00 00 00 00			mov		edx,offset _IsWindowedHandle
0221  BB 00 00 00 00			mov		ebx,offset _RemoveWindowedHandle
0226  B9 00 00 00 00			mov		ecx,offset _NewWindow
022B  BE 00 00 00 00			mov		esi,offset _CloseWindow
0230  BF 00 00 00 00			mov		edi,offset _SetAboutDlg
0235  BD 00 00 00 00			mov		ebp,offset _SetAppTitle
023A  B8 00 00 00 00			mov		eax,offset _SetConTitle
023F  89 15 00 00 00 00			mov		dword ptr _WindowsIsWindowedHandle,edx
0245  89 1D 00 00 00 00			mov		dword ptr _WindowsRemoveWindowedHandle,ebx
024B  89 0D 00 00 00 00			mov		dword ptr _WindowsNewWindow,ecx
0251  89 35 00 00 00 00			mov		dword ptr _WindowsCloseWindow,esi
0257  89 3D 00 00 00 00			mov		dword ptr _WindowsSetAbout,edi
025D  89 2D 00 00 00 00			mov		dword ptr _WindowsSetAppTitle,ebp
0263  A3 00 00 00 00			mov		dword ptr _WindowsSetConTitle,eax
0268  BA 00 00 00 00			mov		edx,offset _DestroyOnClose
026D  BB 00 00 00 00			mov		ebx,offset _YieldControl
0272  B9 00 00 00 00			mov		ecx,offset _ShutDown
0277  89 15 00 00 00 00			mov		dword ptr _WindowsDestroyOnClose,edx
027D  89 1D 00 00 00 00			mov		dword ptr _WindowsYieldControl,ebx
0283  89 0D 00 00 00 00			mov		dword ptr _WindowsShutDown,ecx
0289  5D				pop		ebp
028A  5F				pop		edi
028B  5E				pop		esi
028C  5B				pop		ebx
028D  C3				ret		

Routine Size: 194 bytes,    Routine Base: _TEXT + 01CC

028E				_MemAlloc:
028E  53				push		ebx
028F  56				push		esi
0290  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0294  52				push		edx
0295  E8 00 00 00 00			call		malloc
029A  83 C4 04				add		esp,0x00000004
029D  89 C3				mov		ebx,eax
029F  85 C0				test		eax,eax
02A1  75 21				jne		L$28
02A3  E8 00 00 00 00			call		_OutOfMemory
02A8				L$27:
02A8  6A 00				push		0x00000000
02AA  E8 00 00 00 00			call		_MessageLoop
02AF  83 C4 04				add		esp,0x00000004
02B2  85 C0				test		eax,eax
02B4  75 F2				jne		L$27
02B6  50				push		eax
02B7  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
02BC  E8 00 00 00 00			call		exit
02C1  83 C4 04				add		esp,0x00000004
02C4				L$28:
02C4  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
02C8  56				push		esi
02C9  6A 00				push		0x00000000
02CB  53				push		ebx
02CC  E8 00 00 00 00			call		memset
02D1  83 C4 0C				add		esp,0x0000000c
02D4  89 D8				mov		eax,ebx
02D6  5E				pop		esi
02D7  5B				pop		ebx
02D8  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 028E

02D9				_MemReAlloc:
02D9  53				push		ebx
02DA  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
02DE  52				push		edx
02DF  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
02E3  53				push		ebx
02E4  E8 00 00 00 00			call		realloc
02E9  83 C4 08				add		esp,0x00000008
02EC  89 C3				mov		ebx,eax
02EE  85 C0				test		eax,eax
02F0  75 21				jne		L$30
02F2  E8 00 00 00 00			call		_OutOfMemory
02F7				L$29:
02F7  6A 00				push		0x00000000
02F9  E8 00 00 00 00			call		_MessageLoop
02FE  83 C4 04				add		esp,0x00000004
0301  85 C0				test		eax,eax
0303  75 F2				jne		L$29
0305  50				push		eax
0306  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
030B  E8 00 00 00 00			call		exit
0310  83 C4 04				add		esp,0x00000004
0313				L$30:
0313  89 D8				mov		eax,ebx
0315  5B				pop		ebx
0316  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 02D9

0317				_MemFree:
0317  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
031B  52				push		edx
031C  E8 00 00 00 00			call		free
0321  83 C4 04				add		esp,0x00000004
0324  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0317

0325				_GetWindowNameAndCoords:
0325  53				push		ebx
0326  56				push		esi
0327  57				push		edi
0328  55				push		ebp
0329  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
032D  85 D2				test		edx,edx
032F  75 22				jne		L$31
0331  8B 1D 00 00 00 00			mov		ebx,dword ptr DGROUP:L$45
0337  43				inc		ebx
0338  53				push		ebx
0339  68 00 00 00 00			push		offset DGROUP:L$44
033E  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
0342  56				push		esi
0343  89 1D 00 00 00 00			mov		dword ptr DGROUP:L$45,ebx
0349  E8 00 00 00 00			call		sprintf
034E  83 C4 0C				add		esp,0x0000000c
0351  EB 20				jmp		L$34
0353				L$31:
0353  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0357  89 D6				mov		esi,edx
0359  57				push		edi
035A				L$32:
035A  8A 06				mov		al,byte ptr [esi]
035C  88 07				mov		byte ptr [edi],al
035E  3C 00				cmp		al,0x00
0360  74 10				je		L$33
0362  8A 46 01				mov		al,byte ptr 0x1[esi]
0365  83 C6 02				add		esi,0x00000002
0368  88 47 01				mov		byte ptr 0x1[edi],al
036B  83 C7 02				add		edi,0x00000002
036E  3C 00				cmp		al,0x00
0370  75 E8				jne		L$32
0372				L$33:
0372  5F				pop		edi
0373				L$34:
0373  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0377  A1 04 00 00 00			mov		eax,dword ptr DGROUP:L$46
037C  8B 3D 04 00 00 00			mov		edi,dword ptr DGROUP:L$46
0382  8B 2D 0C 00 00 00			mov		ebp,dword ptr DGROUP:L$48
0388  83 C7 02				add		edi,0x00000002
038B  89 02				mov		dword ptr [edx],eax
038D  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0391  A1 08 00 00 00			mov		eax,dword ptr DGROUP:L$47
0396  83 C5 02				add		ebp,0x00000002
0399  89 02				mov		dword ptr [edx],eax
039B  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
039F  A1 0C 00 00 00			mov		eax,dword ptr DGROUP:L$48
03A4  89 3D 04 00 00 00			mov		dword ptr DGROUP:L$46,edi
03AA  89 02				mov		dword ptr [edx],eax
03AC  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
03B0  A1 10 00 00 00			mov		eax,dword ptr DGROUP:L$49
03B5  89 2D 0C 00 00 00			mov		dword ptr DGROUP:L$48,ebp
03BB  89 02				mov		dword ptr [edx],eax
03BD  A1 08 00 00 00			mov		eax,dword ptr DGROUP:L$47
03C2  8B 15 10 00 00 00			mov		edx,dword ptr DGROUP:L$49
03C8  83 E8 02				sub		eax,0x00000002
03CB  83 EA 02				sub		edx,0x00000002
03CE  A3 08 00 00 00			mov		dword ptr DGROUP:L$47,eax
03D3  89 15 10 00 00 00			mov		dword ptr DGROUP:L$49,edx
03D9  83 FF 17				cmp		edi,0x00000017
03DC  7E 13				jle		L$35
03DE  31 C9				xor		ecx,ecx
03E0  BE 46 00 00 00			mov		esi,0x00000046
03E5  89 0D 04 00 00 00			mov		dword ptr DGROUP:L$46,ecx
03EB  89 35 08 00 00 00			mov		dword ptr DGROUP:L$47,esi
03F1				L$35:
03F1  83 3D 0C 00 00 00 09		cmp		dword ptr DGROUP:L$48,0x00000009
03F8  7E 12				jle		L$36
03FA  31 ED				xor		ebp,ebp
03FC  B8 1B 00 00 00			mov		eax,0x0000001b
0401  89 2D 0C 00 00 00			mov		dword ptr DGROUP:L$48,ebp
0407  A3 10 00 00 00			mov		dword ptr DGROUP:L$49,eax
040C				L$36:
040C  5D				pop		ebp
040D  5F				pop		edi
040E  5E				pop		esi
040F  5B				pop		ebx
0410  C3				ret		

Routine Size: 236 bytes,    Routine Base: _TEXT + 0325

0411				_InitMainWindowData:
0411  6A 70				push		0x00000070
0413  E8 00 00 00 00			call		_MemAlloc
0418  83 C4 04				add		esp,0x00000004
041B  6A 70				push		0x00000070
041D  6A 00				push		0x00000000
041F  50				push		eax
0420  A3 00 00 00 00			mov		dword ptr _MainWindowData,eax
0425  E8 00 00 00 00			call		memset
042A  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
042F  83 C4 0C				add		esp,0x0000000c
0432  C7 40 08 00 00 00 00		mov		dword ptr 0x8[eax],0x00000000
0439  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
043D  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0444  89 10				mov		dword ptr [eax],edx
0446  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0411

0447				_AnotherWindowData:
0447  53				push		ebx
0448  56				push		esi
0449  57				push		edi
044A  55				push		ebp
044B  83 EC 08				sub		esp,0x00000008
044E  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0452  6A 70				push		0x00000070
0454  E8 00 00 00 00			call		_MemAlloc
0459  83 C4 04				add		esp,0x00000004
045C  6A 70				push		0x00000070
045E  6A 00				push		0x00000000
0460  50				push		eax
0461  89 C6				mov		esi,eax
0463  89 44 24 10			mov		dword ptr 0x10[esp],eax
0467  E8 00 00 00 00			call		memset
046C  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0471  8B 50 08				mov		edx,dword ptr 0x8[eax]
0474  42				inc		edx
0475  83 C4 0C				add		esp,0x0000000c
0478  C1 E2 02				shl		edx,0x02
047B  52				push		edx
047C  8B 50 04				mov		edx,dword ptr 0x4[eax]
047F  52				push		edx
0480  E8 00 00 00 00			call		_MemReAlloc
0485  89 C2				mov		edx,eax
0487  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
048C  8B 78 08				mov		edi,dword ptr 0x8[eax]
048F  89 50 04				mov		dword ptr 0x4[eax],edx
0492  89 34 BA				mov		dword ptr [edx+edi*4],esi
0495  FF 40 08				inc		dword ptr 0x8[eax]
0498  83 C4 08				add		esp,0x00000008
049B  C7 46 4A 01 00 00 00		mov		dword ptr 0x4a[esi],0x00000001
04A2  68 8B 00 00 00			push		0x0000008b
04A7  C7 46 4E 01 00 00 00		mov		dword ptr 0x4e[esi],0x00000001
04AE  BF 04 00 00 00			mov		edi,0x00000004
04B3  C7 46 46 01 00 00 00		mov		dword ptr 0x46[esi],0x00000001
04BA  E8 00 00 00 00			call		_MemAlloc
04BF  C6 46 6F 02			mov		byte ptr 0x6f[esi],0x02
04C3  83 C4 04				add		esp,0x00000004
04C6  89 46 53				mov		dword ptr 0x53[esi],eax
04C9  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
04CD  31 D2				xor		edx,edx
04CF  89 46 3A				mov		dword ptr 0x3a[esi],eax
04D2  31 F6				xor		esi,esi
04D4				L$37:
04D4  8B 2B				mov		ebp,dword ptr [ebx]
04D6  83 C5 04				add		ebp,0x00000004
04D9  89 2B				mov		dword ptr [ebx],ebp
04DB  8B 6D FC				mov		ebp,dword ptr -0x4[ebp]
04DE  83 FD FF				cmp		ebp,0xffffffff
04E1  74 22				je		L$38
04E3  89 F0				mov		eax,esi
04E5  57				push		edi
04E6  C1 E0 02				shl		eax,0x02
04E9  52				push		edx
04EA  89 44 24 08			mov		dword ptr 0x8[esp],eax
04EE  E8 00 00 00 00			call		realloc
04F3  83 C4 08				add		esp,0x00000008
04F6  8B 0C 24				mov		ecx,dword ptr [esp]
04F9  89 C2				mov		edx,eax
04FB  01 C8				add		eax,ecx
04FD  83 C7 04				add		edi,0x00000004
0500  46				inc		esi
0501  89 28				mov		dword ptr [eax],ebp
0503  EB CF				jmp		L$37
0505				L$38:
0505  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0509  89 10				mov		dword ptr [eax],edx
050B  89 70 04				mov		dword ptr 0x4[eax],esi
050E  E9 B0 FB FF FF			jmp		L$12

Routine Size: 204 bytes,    Routine Base: _TEXT + 0447

0513				_DestroyAWindow:
0513  53				push		ebx
0514  56				push		esi
0515  57				push		edi
0516  55				push		ebp
0517  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
051B  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0520  31 D2				xor		edx,edx
0522  31 DB				xor		ebx,ebx
0524  EB 54				jmp		L$43
0526				L$39:
0526  8B 48 04				mov		ecx,dword ptr 0x4[eax]
0529  3B 34 19				cmp		esi,dword ptr [ecx+ebx]
052C  75 48				jne		L$42
052E  8B 68 08				mov		ebp,dword ptr 0x8[eax]
0531  89 D3				mov		ebx,edx
0533  4D				dec		ebp
0534  C1 E2 02				shl		edx,0x02
0537  89 68 08				mov		dword ptr 0x8[eax],ebp
053A  EB 0E				jmp		L$41
053C				L$40:
053C  8B 40 04				mov		eax,dword ptr 0x4[eax]
053F  8B 4C 02 04			mov		ecx,dword ptr 0x4[edx+eax]
0543  43				inc		ebx
0544  89 0C 02				mov		dword ptr [edx+eax],ecx
0547  83 C2 04				add		edx,0x00000004
054A				L$41:
054A  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
054F  3B 58 08				cmp		ebx,dword ptr 0x8[eax]
0552  7C E8				jl		L$40
0554  56				push		esi
0555  E8 00 00 00 00			call		_ReleaseWindowResources
055A  83 C4 04				add		esp,0x00000004
055D  8B 3E				mov		edi,dword ptr [esi]
055F  57				push		edi
0560  E8 00 00 00 00			call		_MemFree
0565  83 C4 04				add		esp,0x00000004
0568  56				push		esi
0569  E8 00 00 00 00			call		_MemFree
056E  83 C4 04				add		esp,0x00000004
0571  5D				pop		ebp
0572  5F				pop		edi
0573  5E				pop		esi
0574  5B				pop		ebx
0575  C3				ret		
0576				L$42:
0576  83 C3 04				add		ebx,0x00000004
0579  42				inc		edx
057A				L$43:
057A  3B 50 08				cmp		edx,dword ptr 0x8[eax]
057D  7C A7				jl		L$39
057F  5D				pop		ebp
0580  5F				pop		edi
0581  5E				pop		esi
0582  5B				pop		ebx
0583  C3				ret		

Routine Size: 113 bytes,    Routine Base: _TEXT + 0513

No disassembly errors

Segment: CONST DWORD USE32 0000000B bytes
0000				L$44:
0000  43 6F 6E 73 6F 6C 65 20 25 64 00                Console %d.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000				L$45:
0000  00 00 00 00                                     ....
0004				L$46:
0004  00 00 00 00                                     ....
0008				L$47:
0008  46 00 00 00                                     F...
000C				L$48:
000C  00 00 00 00                                     ....
0010				L$49:
0010  1B 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

