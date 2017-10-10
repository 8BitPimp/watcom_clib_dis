Module: winnew
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001C6 bytes
0000				_NewWindow_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  81 EC 9C 00 00 00			sub		esp,0x0000009c
000C  8D 84 24 8C 00 00 00		lea		eax,0x8c[esp]
0013  89 E2				mov		edx,esp
0015  50				push		eax
0016  8D 84 24 9C 00 00 00		lea		eax,0x9c[esp]
001D  8D 9C 24 98 00 00 00		lea		ebx,0x98[esp]
0024  50				push		eax
0025  8D 8C 24 98 00 00 00		lea		ecx,0x98[esp]
002C  8B 84 24 C0 00 00 00		mov		eax,dword ptr 0xc0[esp]
0033  E8 00 00 00 00			call		_GetWindowNameAndCoords_
0038  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
003D  6A 00				push		0x00000000
003F  8B 10				mov		edx,dword ptr [eax]
0041  52				push		edx
0042  6A 00				push		0x00000000
0044  8B 1D 00 00 00 00			mov		ebx,dword ptr __MainWindow
004A  53				push		ebx
004B  6A 00				push		0x00000000
004D  6A 00				push		0x00000000
004F  6A 00				push		0x00000000
0051  6A 00				push		0x00000000
0053  68 00 00 EF 44			push		0x44ef0000
0058  8D 44 24 24			lea		eax,0x24[esp]
005C  50				push		eax
005D  8B 0D 00 00 00 00			mov		ecx,dword ptr __ClassName
0063  51				push		ecx
0064  6A 00				push		0x00000000
0066  E8 00 00 00 00			call		_CreateWindowExA
006B  89 C7				mov		edi,eax
006D  85 C0				test		eax,eax
006F  0F 84 0A 01 00 00			je		L$1
0075  8D 84 24 BC 00 00 00		lea		eax,0xbc[esp]
007C  8D 94 24 88 00 00 00		lea		edx,0x88[esp]
0083  89 84 24 88 00 00 00		mov		dword ptr 0x88[esp],eax
008A  89 F8				mov		eax,edi
008C  E8 00 00 00 00			call		_AnotherWindowData_
0091  57				push		edi
0092  89 C6				mov		esi,eax
0094  E8 00 00 00 00			call		_GetDC
0099  89 C5				mov		ebp,eax
009B  A1 3C 00 00 00			mov		eax,dword ptr __ColorMap+0x3c
00A0  C7 46 08 00 00 00 00		mov		dword ptr 0x8[esi],0x00000000
00A7  50				push		eax
00A8  31 DB				xor		ebx,ebx
00AA  C7 46 0C 0F 00 00 00		mov		dword ptr 0xc[esi],0x0000000f
00B1  E8 00 00 00 00			call		_CreateSolidBrush
00B6  31 D2				xor		edx,edx
00B8  89 46 36				mov		dword ptr 0x36[esi],eax
00BB  89 E8				mov		eax,ebp
00BD  E8 00 00 00 00			call		_SetMyDC_
00C2  8D 44 24 50			lea		eax,0x50[esp]
00C6  50				push		eax
00C7  55				push		ebp
00C8  E8 00 00 00 00			call		_GetTextMetricsA
00CD  55				push		ebp
00CE  57				push		edi
00CF  E8 00 00 00 00			call		_ReleaseDC
00D4  8B 5C 24 68			mov		ebx,dword ptr 0x68[esp]
00D8  31 C0				xor		eax,eax
00DA  8B 54 24 50			mov		edx,dword ptr 0x50[esp]
00DE  66 89 D8				mov		ax,bx
00E1  0F B7 EA				movzx		ebp,dx
00E4  89 46 28				mov		dword ptr 0x28[esi],eax
00E7  8D 45 02				lea		eax,0x2[ebp]
00EA  89 46 2C				mov		dword ptr 0x2c[esi],eax
00ED  A1 00 00 00 00			mov		eax,dword ptr __MainWindowData
00F2  8B 00				mov		eax,dword ptr [eax]
00F4  89 46 5F				mov		dword ptr 0x5f[esi],eax
00F7  89 F0				mov		eax,esi
00F9  E8 00 00 00 00			call		_PositionScrollThumb_
00FE  89 E0				mov		eax,esp
0100  50				push		eax
0101  8B 06				mov		eax,dword ptr [esi]
0103  BA C8 00 00 00			mov		edx,0x000000c8
0108  8B 08				mov		ecx,dword ptr [eax]
010A  8D 04 0A				lea		eax,[edx+ecx]
010D  50				push		eax
010E  6A 00				push		0x00000000
0110  A1 00 00 00 00			mov		eax,dword ptr __SubMenuWindows
0115  50				push		eax
0116  E8 00 00 00 00			call		_AppendMenuA
011B  8B 84 24 8C 00 00 00		mov		eax,dword ptr 0x8c[esp]
0122  0F AF C5				imul		eax,ebp
0125  6A 01				push		0x00000001
0127  50				push		eax
0128  31 C0				xor		eax,eax
012A  8B 94 24 98 00 00 00		mov		edx,dword ptr 0x98[esp]
0131  66 89 D8				mov		ax,bx
0134  0F AF D0				imul		edx,eax
0137  0F AF 84 24 9C 00 00 00		imul		eax,dword ptr 0x9c[esp]
013F  52				push		edx
0140  0F AF AC 24 A4 00 00 00		imul		ebp,dword ptr 0xa4[esp]
0148  55				push		ebp
0149  50				push		eax
014A  57				push		edi
014B  E8 00 00 00 00			call		_MoveWindow
0150  6A 00				push		0x00000000
0152  68 60 F0 00 00			push		0x0000f060
0157  6A 00				push		0x00000000
0159  57				push		edi
015A  E8 00 00 00 00			call		_GetSystemMenu
015F  50				push		eax
0160  E8 00 00 00 00			call		_DeleteMenu
0165  6A 01				push		0x00000001
0167  57				push		edi
0168  E8 00 00 00 00			call		_ShowWindow
016D  57				push		edi
016E  E8 00 00 00 00			call		_UpdateWindow
0173  89 F0				mov		eax,esi
0175  E8 00 00 00 00			call		_MakeWindowActive_
017A  B8 01 00 00 00			mov		eax,0x00000001
017F				L$1:
017F  81 C4 9C 00 00 00			add		esp,0x0000009c
0185  5D				pop		ebp
0186  5F				pop		edi
0187  5E				pop		esi
0188  5A				pop		edx
0189  59				pop		ecx
018A  5B				pop		ebx
018B  C3				ret		

Routine Size: 396 bytes,    Routine Base: _TEXT + 0000

018C				_ReleaseWindowResources_:
018C  53				push		ebx
018D  51				push		ecx
018E  52				push		edx
018F  56				push		esi
0190  89 C3				mov		ebx,eax
0192  8B 50 36				mov		edx,dword ptr 0x36[eax]
0195  52				push		edx
0196  E8 00 00 00 00			call		_DeleteObject
019B  F6 43 52 04			test		byte ptr 0x52[ebx],0x04
019F  74 05				je		L$2
01A1  E8 00 00 00 00			call		_DestroyCaret
01A6				L$2:
01A6  8B 1B				mov		ebx,dword ptr [ebx]
01A8  B8 C8 00 00 00			mov		eax,0x000000c8
01AD  8B 0B				mov		ecx,dword ptr [ebx]
01AF  6A 00				push		0x00000000
01B1  8D 1C 08				lea		ebx,[eax+ecx]
01B4  53				push		ebx
01B5  8B 35 00 00 00 00			mov		esi,dword ptr __SubMenuWindows
01BB  56				push		esi
01BC  E8 00 00 00 00			call		_DeleteMenu
01C1  5E				pop		esi
01C2  5A				pop		edx
01C3  59				pop		ecx
01C4  5B				pop		ebx
01C5  C3				ret		

Routine Size: 58 bytes,    Routine Base: _TEXT + 018C

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

