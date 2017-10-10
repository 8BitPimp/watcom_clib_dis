Module: searchen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010B bytes
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
0026  75 57				jne		L$3
0028  0F B6 1E				movzx		ebx,byte ptr [esi]
002B  89 F8				mov		eax,edi
002D  83 FB 5C				cmp		ebx,0x0000005c
0030  74 3E				je		L$2
0032  83 FB 2E				cmp		ebx,0x0000002e
0035  74 39				je		L$2
0037  83 FB 2F				cmp		ebx,0x0000002f
003A  74 34				je		L$2
003C  80 3E 00				cmp		byte ptr [esi],0x00
003F  74 09				je		L$1
0041  0F B6 56 01			movzx		edx,byte ptr 0x1[esi]
0045  83 FA 3A				cmp		edx,0x0000003a
0048  74 26				je		L$2
004A				L$1:
004A  68 04 01 00 00			push		0x00000104
004F  57				push		edi
0050  E8 00 00 00 00			call		getcwd
0055  83 C4 08				add		esp,0x00000008
0058  57				push		edi
0059  E8 00 00 00 00			call		strlen
005E  01 F8				add		eax,edi
0060  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
0064  83 C4 04				add		esp,0x00000004
0067  83 FA 5C				cmp		edx,0x0000005c
006A  74 04				je		L$2
006C  C6 00 5C				mov		byte ptr [eax],0x5c
006F  40				inc		eax
0070				L$2:
0070  56				push		esi
0071  50				push		eax
0072  E8 00 00 00 00			call		strcpy
0077  83 C4 08				add		esp,0x00000008
007A  C9				leave		
007B  5F				pop		edi
007C  5E				pop		esi
007D  5B				pop		ebx
007E  C3				ret		
007F				L$3:
007F  FF 75 18				push		dword ptr 0x18[ebp]
0082  E8 00 00 00 00			call		getenv
0087  83 C4 04				add		esp,0x00000004
008A  89 C3				mov		ebx,eax
008C  85 C0				test		eax,eax
008E  0F 84 6F 00 00 00			je		L$9
0094				L$4:
0094  80 3B 00				cmp		byte ptr [ebx],0x00
0097  0F 84 66 00 00 00			je		L$9
009D  89 F8				mov		eax,edi
009F				L$5:
009F  80 3B 00				cmp		byte ptr [ebx],0x00
00A2  74 10				je		L$6
00A4  0F B6 13				movzx		edx,byte ptr [ebx]
00A7  83 FA 3B				cmp		edx,0x0000003b
00AA  74 08				je		L$6
00AC  8A 13				mov		dl,byte ptr [ebx]
00AE  43				inc		ebx
00AF  88 10				mov		byte ptr [eax],dl
00B1  40				inc		eax
00B2  EB EB				jmp		L$5
00B4				L$6:
00B4  39 F8				cmp		eax,edi
00B6  74 43				je		L$8
00B8  0F B6 50 FF			movzx		edx,byte ptr -0x1[eax]
00BC  83 FA 5C				cmp		edx,0x0000005c
00BF  74 0E				je		L$7
00C1  83 FA 2F				cmp		edx,0x0000002f
00C4  74 09				je		L$7
00C6  83 FA 3A				cmp		edx,0x0000003a
00C9  74 04				je		L$7
00CB  C6 00 5C				mov		byte ptr [eax],0x5c
00CE  40				inc		eax
00CF				L$7:
00CF  56				push		esi
00D0  50				push		eax
00D1  C6 00 00				mov		byte ptr [eax],0x00
00D4  E8 00 00 00 00			call		strcat
00D9  83 C4 08				add		esp,0x00000008
00DC  6A 00				push		0x00000000
00DE  57				push		edi
00DF  E8 00 00 00 00			call		access
00E4  83 C4 08				add		esp,0x00000008
00E7  85 C0				test		eax,eax
00E9  75 10				jne		L$8
00EB  FF 75 FC				push		dword ptr -0x4[ebp]
00EE  E8 00 00 00 00			call		__set_errno
00F3  83 C4 04				add		esp,0x00000004
00F6  C9				leave		
00F7  5F				pop		edi
00F8  5E				pop		esi
00F9  5B				pop		ebx
00FA  C3				ret		
00FB				L$8:
00FB  80 3B 00				cmp		byte ptr [ebx],0x00
00FE  74 03				je		L$9
0100  43				inc		ebx
0101  EB 91				jmp		L$4
0103				L$9:
0103  C6 07 00				mov		byte ptr [edi],0x00
0106  C9				leave		
0107  5F				pop		edi
0108  5E				pop		esi
0109  5B				pop		ebx
010A  C3				ret		

Routine Size: 267 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

