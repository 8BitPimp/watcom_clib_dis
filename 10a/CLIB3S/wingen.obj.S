Module: wingen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000057A bytes
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
0187  E8 00 00 00 00			call		_ExecutionComplete
018C				L$25:
018C  6A 00				push		0x00000000
018E  E8 00 00 00 00			call		_MessageLoop
0193  83 C4 04				add		esp,0x00000004
0196  85 C0				test		eax,eax
0198  75 F2				jne		L$25
019A  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
019F  C3				ret		

Routine Size: 25 bytes,    Routine Base: _TEXT + 0187

01A0				_DestroyOnClose:
01A0  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
01A4  80 48 52 20			or		byte ptr 0x52[eax],0x20
01A8  B8 01 00 00 00			mov		eax,0x00000001
01AD  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 01A0

01AE				_YieldControl:
01AE  6A 01				push		0x00000001
01B0  E8 00 00 00 00			call		_MessageLoop
01B5  B8 01 00 00 00			mov		eax,0x00000001
01BA  83 C4 04				add		esp,0x00000004
01BD  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 01AE

01BE				_InitFunctionPointers:
01BE  53				push		ebx
01BF  56				push		esi
01C0  57				push		edi
01C1  55				push		ebp
01C2  BA 00 00 00 00			mov		edx,offset _DoStdin
01C7  BB 00 00 00 00			mov		ebx,offset _DoStdout
01CC  B9 00 00 00 00			mov		ecx,offset _DoKbhit
01D1  BE 00 00 00 00			mov		esi,offset _DoGetch
01D6  BF 00 00 00 00			mov		edi,offset _DoGetche
01DB  BD 00 00 00 00			mov		ebp,offset _DoPutch
01E0  B8 00 00 00 00			mov		eax,offset _WindowsExit
01E5  89 15 00 00 00 00			mov		dword ptr _WindowsStdin,edx
01EB  89 1D 00 00 00 00			mov		dword ptr _WindowsStdout,ebx
01F1  89 0D 00 00 00 00			mov		dword ptr _WindowsKbhit,ecx
01F7  89 35 00 00 00 00			mov		dword ptr _WindowsGetch,esi
01FD  89 3D 00 00 00 00			mov		dword ptr _WindowsGetche,edi
0203  89 2D 00 00 00 00			mov		dword ptr _WindowsPutch,ebp
0209  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
020E  BA 00 00 00 00			mov		edx,offset _IsWindowedHandle
0213  BB 00 00 00 00			mov		ebx,offset _RemoveWindowedHandle
0218  B9 00 00 00 00			mov		ecx,offset _NewWindow
021D  BE 00 00 00 00			mov		esi,offset _CloseWindow
0222  BF 00 00 00 00			mov		edi,offset _SetAboutDlg
0227  BD 00 00 00 00			mov		ebp,offset _SetAppTitle
022C  B8 00 00 00 00			mov		eax,offset _SetConTitle
0231  89 15 00 00 00 00			mov		dword ptr _WindowsIsWindowedHandle,edx
0237  89 1D 00 00 00 00			mov		dword ptr _WindowsRemoveWindowedHandle,ebx
023D  89 0D 00 00 00 00			mov		dword ptr _WindowsNewWindow,ecx
0243  89 35 00 00 00 00			mov		dword ptr _WindowsCloseWindow,esi
0249  89 3D 00 00 00 00			mov		dword ptr _WindowsSetAbout,edi
024F  89 2D 00 00 00 00			mov		dword ptr _WindowsSetAppTitle,ebp
0255  A3 00 00 00 00			mov		dword ptr _WindowsSetConTitle,eax
025A  BA 00 00 00 00			mov		edx,offset _DestroyOnClose
025F  BB 00 00 00 00			mov		ebx,offset _YieldControl
0264  B9 00 00 00 00			mov		ecx,offset _ShutDown
0269  89 15 00 00 00 00			mov		dword ptr _WindowsDestroyOnClose,edx
026F  89 1D 00 00 00 00			mov		dword ptr _WindowsYieldControl,ebx
0275  89 0D 00 00 00 00			mov		dword ptr _WindowsShutDown,ecx
027B  5D				pop		ebp
027C  5F				pop		edi
027D  5E				pop		esi
027E  5B				pop		ebx
027F  C3				ret		

Routine Size: 194 bytes,    Routine Base: _TEXT + 01BE

0280				_MemAlloc:
0280  53				push		ebx
0281  56				push		esi
0282  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0286  52				push		edx
0287  E8 00 00 00 00			call		malloc
028C  83 C4 04				add		esp,0x00000004
028F  89 C3				mov		ebx,eax
0291  85 C0				test		eax,eax
0293  75 21				jne		L$27
0295  E8 00 00 00 00			call		_OutOfMemory
029A				L$26:
029A  6A 00				push		0x00000000
029C  E8 00 00 00 00			call		_MessageLoop
02A1  83 C4 04				add		esp,0x00000004
02A4  85 C0				test		eax,eax
02A6  75 F2				jne		L$26
02A8  50				push		eax
02A9  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
02AE  E8 00 00 00 00			call		exit
02B3  83 C4 04				add		esp,0x00000004
02B6				L$27:
02B6  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
02BA  56				push		esi
02BB  6A 00				push		0x00000000
02BD  53				push		ebx
02BE  E8 00 00 00 00			call		memset
02C3  83 C4 0C				add		esp,0x0000000c
02C6  89 D8				mov		eax,ebx
02C8  5E				pop		esi
02C9  5B				pop		ebx
02CA  C3				ret		

Routine Size: 75 bytes,    Routine Base: _TEXT + 0280

02CB				_MemReAlloc:
02CB  53				push		ebx
02CC  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
02D0  52				push		edx
02D1  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
02D5  53				push		ebx
02D6  E8 00 00 00 00			call		realloc
02DB  83 C4 08				add		esp,0x00000008
02DE  89 C3				mov		ebx,eax
02E0  85 C0				test		eax,eax
02E2  75 21				jne		L$29
02E4  E8 00 00 00 00			call		_OutOfMemory
02E9				L$28:
02E9  6A 00				push		0x00000000
02EB  E8 00 00 00 00			call		_MessageLoop
02F0  83 C4 04				add		esp,0x00000004
02F3  85 C0				test		eax,eax
02F5  75 F2				jne		L$28
02F7  50				push		eax
02F8  A3 00 00 00 00			mov		dword ptr _WindowExitRtn,eax
02FD  E8 00 00 00 00			call		exit
0302  83 C4 04				add		esp,0x00000004
0305				L$29:
0305  89 D8				mov		eax,ebx
0307  5B				pop		ebx
0308  C3				ret		

Routine Size: 62 bytes,    Routine Base: _TEXT + 02CB

0309				_MemFree:
0309  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
030D  52				push		edx
030E  E8 00 00 00 00			call		free
0313  83 C4 04				add		esp,0x00000004
0316  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0309

0317				_GetWindowNameAndCoords:
0317  53				push		ebx
0318  56				push		esi
0319  57				push		edi
031A  55				push		ebp
031B  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
031F  85 D2				test		edx,edx
0321  75 22				jne		L$30
0323  8B 1D 00 00 00 00			mov		ebx,dword ptr DGROUP:L$44
0329  43				inc		ebx
032A  53				push		ebx
032B  68 00 00 00 00			push		offset DGROUP:L$43
0330  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
0334  56				push		esi
0335  89 1D 00 00 00 00			mov		dword ptr DGROUP:L$44,ebx
033B  E8 00 00 00 00			call		sprintf
0340  83 C4 0C				add		esp,0x0000000c
0343  EB 24				jmp		L$33
0345				L$30:
0345  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0349  89 D6				mov		esi,edx
034B  57				push		edi
034C				L$31:
034C  8A 06				mov		al,byte ptr [esi]
034E  88 07				mov		byte ptr [edi],al
0350  3C 00				cmp		al,0x00
0352  0F 84 10 00 00 00			je		L$32
0358  8A 46 01				mov		al,byte ptr 0x1[esi]
035B  83 C6 02				add		esi,0x00000002
035E  88 47 01				mov		byte ptr 0x1[edi],al
0361  83 C7 02				add		edi,0x00000002
0364  3C 00				cmp		al,0x00
0366  75 E4				jne		L$31
0368				L$32:
0368  5F				pop		edi
0369				L$33:
0369  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
036D  A1 04 00 00 00			mov		eax,dword ptr DGROUP:L$45
0372  8B 3D 04 00 00 00			mov		edi,dword ptr DGROUP:L$45
0378  8B 2D 0C 00 00 00			mov		ebp,dword ptr DGROUP:L$47
037E  83 C7 02				add		edi,0x00000002
0381  89 02				mov		dword ptr [edx],eax
0383  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0387  A1 08 00 00 00			mov		eax,dword ptr DGROUP:L$46
038C  83 C5 02				add		ebp,0x00000002
038F  89 02				mov		dword ptr [edx],eax
0391  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
0395  A1 0C 00 00 00			mov		eax,dword ptr DGROUP:L$47
039A  89 3D 04 00 00 00			mov		dword ptr DGROUP:L$45,edi
03A0  89 02				mov		dword ptr [edx],eax
03A2  8B 54 24 28			mov		edx,dword ptr 0x28[esp]
03A6  A1 10 00 00 00			mov		eax,dword ptr DGROUP:L$48
03AB  89 2D 0C 00 00 00			mov		dword ptr DGROUP:L$47,ebp
03B1  89 02				mov		dword ptr [edx],eax
03B3  A1 08 00 00 00			mov		eax,dword ptr DGROUP:L$46
03B8  8B 15 10 00 00 00			mov		edx,dword ptr DGROUP:L$48
03BE  83 E8 02				sub		eax,0x00000002
03C1  83 EA 02				sub		edx,0x00000002
03C4  A3 08 00 00 00			mov		dword ptr DGROUP:L$46,eax
03C9  89 15 10 00 00 00			mov		dword ptr DGROUP:L$48,edx
03CF  83 FF 17				cmp		edi,0x00000017
03D2  7E 13				jle		L$34
03D4  31 C9				xor		ecx,ecx
03D6  BE 46 00 00 00			mov		esi,0x00000046
03DB  89 0D 04 00 00 00			mov		dword ptr DGROUP:L$45,ecx
03E1  89 35 08 00 00 00			mov		dword ptr DGROUP:L$46,esi
03E7				L$34:
03E7  83 3D 0C 00 00 00 09		cmp		dword ptr DGROUP:L$47,0x00000009
03EE  7E 12				jle		L$35
03F0  31 ED				xor		ebp,ebp
03F2  B8 1B 00 00 00			mov		eax,0x0000001b
03F7  89 2D 0C 00 00 00			mov		dword ptr DGROUP:L$47,ebp
03FD  A3 10 00 00 00			mov		dword ptr DGROUP:L$48,eax
0402				L$35:
0402  5D				pop		ebp
0403  5F				pop		edi
0404  5E				pop		esi
0405  5B				pop		ebx
0406  C3				ret		

Routine Size: 240 bytes,    Routine Base: _TEXT + 0317

0407				_InitMainWindowData:
0407  6A 70				push		0x00000070
0409  E8 00 00 00 00			call		_MemAlloc
040E  83 C4 04				add		esp,0x00000004
0411  6A 70				push		0x00000070
0413  6A 00				push		0x00000000
0415  50				push		eax
0416  A3 00 00 00 00			mov		dword ptr _MainWindowData,eax
041B  E8 00 00 00 00			call		memset
0420  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0425  83 C4 0C				add		esp,0x0000000c
0428  C7 40 08 00 00 00 00		mov		dword ptr 0x8[eax],0x00000000
042F  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0433  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
043A  89 10				mov		dword ptr [eax],edx
043C  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0407

043D				_AnotherWindowData:
043D  53				push		ebx
043E  56				push		esi
043F  57				push		edi
0440  55				push		ebp
0441  83 EC 08				sub		esp,0x00000008
0444  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0448  6A 70				push		0x00000070
044A  E8 00 00 00 00			call		_MemAlloc
044F  83 C4 04				add		esp,0x00000004
0452  6A 70				push		0x00000070
0454  6A 00				push		0x00000000
0456  50				push		eax
0457  89 C6				mov		esi,eax
0459  89 44 24 10			mov		dword ptr 0x10[esp],eax
045D  E8 00 00 00 00			call		memset
0462  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0467  8B 50 08				mov		edx,dword ptr 0x8[eax]
046A  42				inc		edx
046B  83 C4 0C				add		esp,0x0000000c
046E  C1 E2 02				shl		edx,0x02
0471  52				push		edx
0472  8B 50 04				mov		edx,dword ptr 0x4[eax]
0475  52				push		edx
0476  E8 00 00 00 00			call		_MemReAlloc
047B  89 C2				mov		edx,eax
047D  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0482  8B 78 08				mov		edi,dword ptr 0x8[eax]
0485  89 50 04				mov		dword ptr 0x4[eax],edx
0488  89 34 BA				mov		dword ptr [edx+edi*4],esi
048B  FF 40 08				inc		dword ptr 0x8[eax]
048E  83 C4 08				add		esp,0x00000008
0491  C7 46 4A 01 00 00 00		mov		dword ptr 0x4a[esi],0x00000001
0498  68 8B 00 00 00			push		0x0000008b
049D  C7 46 4E 01 00 00 00		mov		dword ptr 0x4e[esi],0x00000001
04A4  BF 04 00 00 00			mov		edi,0x00000004
04A9  C7 46 46 01 00 00 00		mov		dword ptr 0x46[esi],0x00000001
04B0  E8 00 00 00 00			call		_MemAlloc
04B5  C6 46 6F 02			mov		byte ptr 0x6f[esi],0x02
04B9  83 C4 04				add		esp,0x00000004
04BC  89 46 53				mov		dword ptr 0x53[esi],eax
04BF  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
04C3  31 D2				xor		edx,edx
04C5  89 46 3A				mov		dword ptr 0x3a[esi],eax
04C8  31 F6				xor		esi,esi
04CA				L$36:
04CA  8B 2B				mov		ebp,dword ptr [ebx]
04CC  83 C5 04				add		ebp,0x00000004
04CF  89 2B				mov		dword ptr [ebx],ebp
04D1  8B 6D FC				mov		ebp,dword ptr -0x4[ebp]
04D4  83 FD FF				cmp		ebp,0xffffffff
04D7  74 22				je		L$37
04D9  89 F0				mov		eax,esi
04DB  57				push		edi
04DC  C1 E0 02				shl		eax,0x02
04DF  52				push		edx
04E0  89 44 24 08			mov		dword ptr 0x8[esp],eax
04E4  E8 00 00 00 00			call		realloc
04E9  83 C4 08				add		esp,0x00000008
04EC  8B 0C 24				mov		ecx,dword ptr [esp]
04EF  89 C2				mov		edx,eax
04F1  01 C8				add		eax,ecx
04F3  83 C7 04				add		edi,0x00000004
04F6  46				inc		esi
04F7  89 28				mov		dword ptr [eax],ebp
04F9  EB CF				jmp		L$36
04FB				L$37:
04FB  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
04FF  89 10				mov		dword ptr [eax],edx
0501  89 70 04				mov		dword ptr 0x4[eax],esi
0504  E9 BA FB FF FF			jmp		L$12

Routine Size: 204 bytes,    Routine Base: _TEXT + 043D

0509				_DestroyAWindow:
0509  53				push		ebx
050A  56				push		esi
050B  57				push		edi
050C  55				push		ebp
050D  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0511  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0516  31 D2				xor		edx,edx
0518  31 DB				xor		ebx,ebx
051A  EB 54				jmp		L$42
051C				L$38:
051C  8B 48 04				mov		ecx,dword ptr 0x4[eax]
051F  3B 34 19				cmp		esi,dword ptr [ecx+ebx]
0522  75 48				jne		L$41
0524  8B 68 08				mov		ebp,dword ptr 0x8[eax]
0527  89 D3				mov		ebx,edx
0529  4D				dec		ebp
052A  C1 E2 02				shl		edx,0x02
052D  89 68 08				mov		dword ptr 0x8[eax],ebp
0530  EB 0E				jmp		L$40
0532				L$39:
0532  8B 40 04				mov		eax,dword ptr 0x4[eax]
0535  8B 4C 02 04			mov		ecx,dword ptr 0x4[edx+eax]
0539  43				inc		ebx
053A  89 0C 02				mov		dword ptr [edx+eax],ecx
053D  83 C2 04				add		edx,0x00000004
0540				L$40:
0540  A1 00 00 00 00			mov		eax,dword ptr _MainWindowData
0545  3B 58 08				cmp		ebx,dword ptr 0x8[eax]
0548  7C E8				jl		L$39
054A  56				push		esi
054B  E8 00 00 00 00			call		_ReleaseWindowResources
0550  83 C4 04				add		esp,0x00000004
0553  8B 3E				mov		edi,dword ptr [esi]
0555  57				push		edi
0556  E8 00 00 00 00			call		_MemFree
055B  83 C4 04				add		esp,0x00000004
055E  56				push		esi
055F  E8 00 00 00 00			call		_MemFree
0564  83 C4 04				add		esp,0x00000004
0567  5D				pop		ebp
0568  5F				pop		edi
0569  5E				pop		esi
056A  5B				pop		ebx
056B  C3				ret		
056C				L$41:
056C  83 C3 04				add		ebx,0x00000004
056F  42				inc		edx
0570				L$42:
0570  3B 50 08				cmp		edx,dword ptr 0x8[eax]
0573  7C A7				jl		L$38
0575  5D				pop		ebp
0576  5F				pop		edi
0577  5E				pop		esi
0578  5B				pop		ebx
0579  C3				ret		

Routine Size: 113 bytes,    Routine Base: _TEXT + 0509

No disassembly errors

Segment: CONST DWORD USE32 0000000B bytes
0000				L$43:
0000  43 6F 6E 73 6F 6C 65 20 25 64 00                Console %d.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000014 bytes
0000				L$44:
0000  00 00 00 00                                     ....
0004				L$45:
0004  00 00 00 00                                     ....
0008				L$46:
0008  46 00 00 00                                     F...
000C				L$47:
000C  00 00 00 00                                     ....
0010				L$48:
0010  1B 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

