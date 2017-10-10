Module: split2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000149 bytes
0000				pcopy:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
0007  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
000B  85 C0				test		eax,eax
000D  74 51				je		L$2
000F  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0013  2B 74 24 18			sub		esi,dword ptr 0x18[esp]
0017  89 18				mov		dword ptr [eax],ebx
0019  81 FE 07 01 00 00			cmp		esi,0x00000107
001F  72 05				jb		L$1
0021  BE 06 01 00 00			mov		esi,0x00000106
0026				L$1:
0026  56				push		esi
0027  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
002B  51				push		ecx
002C  E8 00 00 00 00			call		_mbsnccnt
0031  83 C4 08				add		esp,0x00000008
0034  50				push		eax
0035  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
0039  57				push		edi
003A  53				push		ebx
003B  89 C6				mov		esi,eax
003D  E8 00 00 00 00			call		_mbsncpy
0042  83 C4 0C				add		esp,0x0000000c
0045  56				push		esi
0046  53				push		ebx
0047  E8 00 00 00 00			call		_mbsnbcnt
004C  83 C4 08				add		esp,0x00000008
004F  56				push		esi
0050  53				push		ebx
0051  C6 04 03 00			mov		byte ptr [ebx+eax],0x00
0055  E8 00 00 00 00			call		_mbsnbcnt
005A  01 C3				add		ebx,eax
005C  83 C4 08				add		esp,0x00000008
005F  43				inc		ebx
0060				L$2:
0060  89 D8				mov		eax,ebx
0062  5F				pop		edi
0063  5E				pop		esi
0064  5B				pop		ebx
0065  C3				ret		

Routine Size: 102 bytes,    Routine Base: _TEXT + 0000

0066				_splitpath2:
0066  53				push		ebx
0067  56				push		esi
0068  57				push		edi
0069  55				push		ebp
006A  83 EC 04				sub		esp,0x00000004
006D  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0071  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
0075  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0079  80 3B 00				cmp		byte ptr [ebx],0x00
007C  74 2E				je		L$4
007E  31 D2				xor		edx,edx
0080  8A 53 01				mov		dl,byte ptr 0x1[ebx]
0083  83 FA 3A				cmp		edx,0x0000003a
0086  75 24				jne		L$4
0088  85 C0				test		eax,eax
008A  74 11				je		L$3
008C  89 38				mov		dword ptr [eax],edi
008E  8A 03				mov		al,byte ptr [ebx]
0090  C6 47 01 3A			mov		byte ptr 0x1[edi],0x3a
0094  C6 47 02 00			mov		byte ptr 0x2[edi],0x00
0098  88 07				mov		byte ptr [edi],al
009A  83 C7 03				add		edi,0x00000003
009D				L$3:
009D  6A 02				push		0x00000002
009F  53				push		ebx
00A0  E8 00 00 00 00			call		_mbsninc
00A5  83 C4 08				add		esp,0x00000008
00A8  89 C3				mov		ebx,eax
00AA  EB 0A				jmp		L$5
00AC				L$4:
00AC  85 C0				test		eax,eax
00AE  74 06				je		L$5
00B0  89 38				mov		dword ptr [eax],edi
00B2  C6 07 00				mov		byte ptr [edi],0x00
00B5  47				inc		edi
00B6				L$5:
00B6  89 DD				mov		ebp,ebx
00B8  89 1C 24				mov		dword ptr [esp],ebx
00BB				L$6:
00BB  31 F6				xor		esi,esi
00BD				L$7:
00BD  53				push		ebx
00BE  E8 00 00 00 00			call		_mbptov
00C3  83 C4 04				add		esp,0x00000004
00C6  89 C2				mov		edx,eax
00C8  85 C0				test		eax,eax
00CA  74 39				je		L$12
00CC  83 F8 2E				cmp		eax,0x0000002e
00CF  75 05				jne		L$8
00D1  89 DE				mov		esi,ebx
00D3  43				inc		ebx
00D4  EB E7				jmp		L$7
00D6				L$8:
00D6  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00DD  74 13				je		L$9
00DF  31 C0				xor		eax,eax
00E1  8A 03				mov		al,byte ptr [ebx]
00E3  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
00E9  24 01				and		al,0x01
00EB  25 FF 00 00 00			and		eax,0x000000ff
00F0  EB 02				jmp		L$10
00F2				L$9:
00F2  31 C0				xor		eax,eax
00F4				L$10:
00F4  43				inc		ebx
00F5  01 C3				add		ebx,eax
00F7  83 FA 5C				cmp		edx,0x0000005c
00FA  74 05				je		L$11
00FC  83 FA 2F				cmp		edx,0x0000002f
00FF  75 BC				jne		L$7
0101				L$11:
0101  89 DD				mov		ebp,ebx
0103  EB B6				jmp		L$6
0105				L$12:
0105  55				push		ebp
0106  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
010A  50				push		eax
010B  57				push		edi
010C  8B 54 24 30			mov		edx,dword ptr 0x30[esp]
0110  52				push		edx
0111  E8 00 00 00 00			call		pcopy
0116  83 C4 10				add		esp,0x00000010
0119  89 C7				mov		edi,eax
011B  85 F6				test		esi,esi
011D  75 02				jne		L$13
011F  89 DE				mov		esi,ebx
0121				L$13:
0121  56				push		esi
0122  55				push		ebp
0123  57				push		edi
0124  8B 4C 24 34			mov		ecx,dword ptr 0x34[esp]
0128  51				push		ecx
0129  E8 00 00 00 00			call		pcopy
012E  83 C4 10				add		esp,0x00000010
0131  53				push		ebx
0132  56				push		esi
0133  50				push		eax
0134  8B 74 24 38			mov		esi,dword ptr 0x38[esp]
0138  56				push		esi
0139  E8 00 00 00 00			call		pcopy
013E  83 C4 10				add		esp,0x00000010
0141  83 C4 04				add		esp,0x00000004
0144  5D				pop		ebp
0145  5F				pop		edi
0146  5E				pop		esi
0147  5B				pop		ebx
0148  C3				ret		

Routine Size: 227 bytes,    Routine Base: _TEXT + 0066

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

