Module: searchen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FB bytes
0000				_searchenv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  C8 04 00 00			enter		0x0004,0x00
0007  8B 75 14				mov		esi,dword ptr 0x14[ebp]
000A  8B 7D 1C				mov		edi,dword ptr 0x1c[ebp]
000D  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0013  6A 00				push		0x00000000
0015  8B 40 04				mov		eax,dword ptr 0x4[eax]
0018  56				push		esi
0019  89 45 FC				mov		dword ptr -0x4[ebp],eax
001C  E8 00 00 00 00			call		access
0021  83 C4 08				add		esp,0x00000008
0024  85 C0				test		eax,eax
0026  75 4B				jne		L$3
0028  89 F8				mov		eax,edi
002A  80 3E 5C				cmp		byte ptr [esi],0x5c
002D  74 35				je		L$2
002F  80 3E 2E				cmp		byte ptr [esi],0x2e
0032  74 30				je		L$2
0034  80 3E 2F				cmp		byte ptr [esi],0x2f
0037  74 2B				je		L$2
0039  80 3E 00				cmp		byte ptr [esi],0x00
003C  74 06				je		L$1
003E  80 7E 01 3A			cmp		byte ptr 0x1[esi],0x3a
0042  74 20				je		L$2
0044				L$1:
0044  6A 50				push		0x00000050
0046  57				push		edi
0047  E8 00 00 00 00			call		getcwd
004C  83 C4 08				add		esp,0x00000008
004F  57				push		edi
0050  E8 00 00 00 00			call		strlen
0055  01 F8				add		eax,edi
0057  83 C4 04				add		esp,0x00000004
005A  80 78 FF 5C			cmp		byte ptr -0x1[eax],0x5c
005E  74 04				je		L$2
0060  C6 00 5C				mov		byte ptr [eax],0x5c
0063  40				inc		eax
0064				L$2:
0064  56				push		esi
0065  50				push		eax
0066  E8 00 00 00 00			call		strcpy
006B  83 C4 08				add		esp,0x00000008
006E  C9				leave		
006F  5F				pop		edi
0070  5E				pop		esi
0071  5B				pop		ebx
0072  C3				ret		
0073				L$3:
0073  FF 75 18				push		dword ptr 0x18[ebp]
0076  E8 00 00 00 00			call		getenv
007B  83 C4 04				add		esp,0x00000004
007E  89 C3				mov		ebx,eax
0080  85 C0				test		eax,eax
0082  0F 84 6B 00 00 00			je		L$9
0088				L$4:
0088  80 3B 00				cmp		byte ptr [ebx],0x00
008B  0F 84 62 00 00 00			je		L$9
0091  89 F8				mov		eax,edi
0093				L$5:
0093  80 3B 00				cmp		byte ptr [ebx],0x00
0096  74 0D				je		L$6
0098  80 3B 3B				cmp		byte ptr [ebx],0x3b
009B  74 08				je		L$6
009D  8A 13				mov		dl,byte ptr [ebx]
009F  43				inc		ebx
00A0  88 10				mov		byte ptr [eax],dl
00A2  40				inc		eax
00A3  EB EE				jmp		L$5
00A5				L$6:
00A5  39 F8				cmp		eax,edi
00A7  74 42				je		L$8
00A9  80 78 FF 5C			cmp		byte ptr -0x1[eax],0x5c
00AD  74 10				je		L$7
00AF  80 78 FF 2F			cmp		byte ptr -0x1[eax],0x2f
00B3  74 0A				je		L$7
00B5  80 78 FF 3A			cmp		byte ptr -0x1[eax],0x3a
00B9  74 04				je		L$7
00BB  C6 00 5C				mov		byte ptr [eax],0x5c
00BE  40				inc		eax
00BF				L$7:
00BF  56				push		esi
00C0  50				push		eax
00C1  C6 00 00				mov		byte ptr [eax],0x00
00C4  E8 00 00 00 00			call		strcat
00C9  83 C4 08				add		esp,0x00000008
00CC  6A 00				push		0x00000000
00CE  57				push		edi
00CF  E8 00 00 00 00			call		access
00D4  83 C4 08				add		esp,0x00000008
00D7  85 C0				test		eax,eax
00D9  75 10				jne		L$8
00DB  FF 75 FC				push		dword ptr -0x4[ebp]
00DE  E8 00 00 00 00			call		__set_errno
00E3  83 C4 04				add		esp,0x00000004
00E6  C9				leave		
00E7  5F				pop		edi
00E8  5E				pop		esi
00E9  5B				pop		ebx
00EA  C3				ret		
00EB				L$8:
00EB  80 3B 00				cmp		byte ptr [ebx],0x00
00EE  74 03				je		L$9
00F0  43				inc		ebx
00F1  EB 95				jmp		L$4
00F3				L$9:
00F3  C6 07 00				mov		byte ptr [edi],0x00
00F6  C9				leave		
00F7  5F				pop		edi
00F8  5E				pop		esi
00F9  5B				pop		ebx
00FA  C3				ret		

Routine Size: 251 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

