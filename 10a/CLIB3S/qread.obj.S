Module: qread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000008E bytes
0000				__qread:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  53				push		ebx
000C  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0012  8B 15 00 00 00 00			mov		edx,dword ptr _WindowsStdin
0018  83 C4 04				add		esp,0x00000004
001B  85 D2				test		edx,edx
001D  74 24				je		L$1
001F  53				push		ebx
0020  FF 15 00 00 00 00			call		dword ptr _WindowsIsWindowedHandle
0026  83 C4 04				add		esp,0x00000004
0029  85 C0				test		eax,eax
002B  74 16				je		L$1
002D  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
0031  57				push		edi
0032  8B 6C 24 20			mov		ebp,dword ptr 0x20[esp]
0036  55				push		ebp
0037  50				push		eax
0038  FF 15 00 00 00 00			call		dword ptr _WindowsStdin
003E  83 C4 0C				add		esp,0x0000000c
0041  EB 43				jmp		L$3
0043				L$1:
0043  A1 00 00 00 00			mov		eax,dword ptr __FileHandleIDs
0048  89 DA				mov		edx,ebx
004A  6A 00				push		0x00000000
004C  8B 14 90				mov		edx,dword ptr [eax+edx*4]
004F  8D 44 24 04			lea		eax,0x4[esp]
0053  50				push		eax
0054  8B 4C 24 28			mov		ecx,dword ptr 0x28[esp]
0058  51				push		ecx
0059  8B 74 24 28			mov		esi,dword ptr 0x28[esp]
005D  56				push		esi
005E  52				push		edx
005F  E8 00 00 00 00			call		_ReadFile
0064  85 C0				test		eax,eax
0066  75 11				jne		L$2
0068  53				push		ebx
0069  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
006F  83 C4 04				add		esp,0x00000004
0072  E8 00 00 00 00			call		__set_errno_nt
0077  EB 0D				jmp		L$3
0079				L$2:
0079  53				push		ebx
007A  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0080  83 C4 04				add		esp,0x00000004
0083  8B 04 24				mov		eax,dword ptr [esp]
0086				L$3:
0086  83 C4 04				add		esp,0x00000004
0089  5D				pop		ebp
008A  5F				pop		edi
008B  5E				pop		esi
008C  5B				pop		ebx
008D  C3				ret		

Routine Size: 142 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

