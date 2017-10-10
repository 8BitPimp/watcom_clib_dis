Module: qwrit
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000BD bytes
0000				__qwrite:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  83 EC 04				sub		esp,0x00000004
0006  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000A  8B 35 00 00 00 00			mov		esi,dword ptr __FileHandleIDs
0010  89 D8				mov		eax,ebx
0012  53				push		ebx
0013  8B 34 86				mov		esi,dword ptr [esi+eax*4]
0016  FF 15 00 00 00 00			call		dword ptr _AccessFileH
001C  83 C4 04				add		esp,0x00000004
001F  53				push		ebx
0020  E8 00 00 00 00			call		__IOMode
0025  83 C4 04				add		esp,0x00000004
0028  A8 80				test		al,0x80
002A  74 22				je		L$2
002C  6A 02				push		0x00000002
002E  6A 00				push		0x00000000
0030  6A 00				push		0x00000000
0032  56				push		esi
0033  E8 00 00 00 00			call		_SetFilePointer
0038  83 F8 FF				cmp		eax,0xffffffff
003B  75 11				jne		L$2
003D				L$1:
003D  53				push		ebx
003E  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0044  83 C4 04				add		esp,0x00000004
0047  E8 00 00 00 00			call		__set_errno_nt
004C  EB 68				jmp		L$5
004E				L$2:
004E  83 3D 00 00 00 00 00		cmp		dword ptr _WindowsStdout,0x00000000
0055  74 24				je		L$3
0057  53				push		ebx
0058  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
005E  83 C4 04				add		esp,0x00000004
0061  85 C0				test		eax,eax
0063  74 16				je		L$3
0065  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
0069  52				push		edx
006A  8B 5C 24 1C			mov		ebx,dword ptr 0x1c[esp]
006E  53				push		ebx
006F  50				push		eax
0070  FF 15 00 00 00 00			call		dword ptr _WindowsStdout
0076  83 C4 0C				add		esp,0x0000000c
0079  EB 3B				jmp		L$5
007B				L$3:
007B  6A 00				push		0x00000000
007D  8D 44 24 04			lea		eax,0x4[esp]
0081  50				push		eax
0082  8B 4C 24 24			mov		ecx,dword ptr 0x24[esp]
0086  51				push		ecx
0087  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
008B  57				push		edi
008C  56				push		esi
008D  E8 00 00 00 00			call		_WriteFile
0092  85 C0				test		eax,eax
0094  74 A7				je		L$1
0096  8B 04 24				mov		eax,dword ptr [esp]
0099  3B 44 24 1C			cmp		eax,dword ptr 0x1c[esp]
009D  74 0A				je		L$4
009F  6A 0C				push		0x0000000c
00A1  E8 00 00 00 00			call		__set_errno
00A6  83 C4 04				add		esp,0x00000004
00A9				L$4:
00A9  53				push		ebx
00AA  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00B0  83 C4 04				add		esp,0x00000004
00B3  8B 04 24				mov		eax,dword ptr [esp]
00B6				L$5:
00B6  83 C4 04				add		esp,0x00000004
00B9  5F				pop		edi
00BA  5E				pop		esi
00BB  5B				pop		ebx
00BC  C3				ret		

Routine Size: 189 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

