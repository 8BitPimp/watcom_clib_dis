Module: grownear
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000159 bytes
0000				__LinkUpNewMHeap:
0000  53				push		ebx
0001  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0005  A1 00 00 00 00			mov		eax,dword ptr __nheapbeg
000A  31 DB				xor		ebx,ebx
000C  EB 09				jmp		L$2
000E				L$1:
000E  39 C2				cmp		edx,eax
0010  72 09				jb		L$3
0012  89 C3				mov		ebx,eax
0014  8B 40 08				mov		eax,dword ptr 0x8[eax]
0017				L$2:
0017  85 C0				test		eax,eax
0019  75 F3				jne		L$1
001B				L$3:
001B  89 5A 04				mov		dword ptr 0x4[edx],ebx
001E  89 42 08				mov		dword ptr 0x8[edx],eax
0021  85 DB				test		ebx,ebx
0023  74 05				je		L$4
0025  89 53 08				mov		dword ptr 0x8[ebx],edx
0028  EB 06				jmp		L$5
002A				L$4:
002A  89 15 00 00 00 00			mov		dword ptr __nheapbeg,edx
0030				L$5:
0030  85 C0				test		eax,eax
0032  74 03				je		L$6
0034  89 50 04				mov		dword ptr 0x4[eax],edx
0037				L$6:
0037  8D 5A 20				lea		ebx,0x20[edx]
003A  8B 02				mov		eax,dword ptr [edx]
003C  83 C2 2C				add		edx,0x0000002c
003F  C7 42 F4 00 00 00 00		mov		dword ptr -0xc[edx],0x00000000
0046  C7 42 E4 00 00 00 00		mov		dword ptr -0x1c[edx],0x00000000
004D  C7 42 EC 00 00 00 00		mov		dword ptr -0x14[edx],0x00000000
0054  C7 42 F0 00 00 00 00		mov		dword ptr -0x10[edx],0x00000000
005B  89 5A F8				mov		dword ptr -0x8[edx],ebx
005E  89 5A FC				mov		dword ptr -0x4[edx],ebx
0061  83 E8 2C				sub		eax,0x0000002c
0064  89 5A E0				mov		dword ptr -0x20[edx],ebx
0067  89 02				mov		dword ptr [edx],eax
0069  C7 04 02 FF FF FF FF		mov		dword ptr [edx+eax],0xffffffff
0070  89 D0				mov		eax,edx
0072  5B				pop		ebx
0073  C3				ret		
0074				__CreateNewNHeap:
0074  53				push		ebx
0075  56				push		esi
0076  57				push		edi
0077  83 3D 00 00 00 00 00		cmp		dword ptr __heap_enabled,0x00000000
007E  75 06				jne		L$8
0080				L$7:
0080  31 C0				xor		eax,eax
0082  5F				pop		edi
0083  5E				pop		esi
0084  5B				pop		ebx
0085  C3				ret		
0086				L$8:
0086  83 3D 00 00 00 00 FE		cmp		dword ptr _curbrk,0xfffffffe
008D  74 F1				je		L$7
008F  8D 44 24 10			lea		eax,0x10[esp]
0093  50				push		eax
0094  E8 00 00 00 00			call		__AdjustAmount
0099  83 C4 04				add		esp,0x00000004
009C  85 C0				test		eax,eax
009E  74 60				je		L$9
00A0  8B 4C 24 10			mov		ecx,dword ptr 0x10[esp]
00A4  51				push		ecx
00A5  6A 00				push		0x00000000
00A7  E8 00 00 00 00			call		_LocalAlloc
00AC  89 C3				mov		ebx,eax
00AE  85 C0				test		eax,eax
00B0  74 4E				je		L$9
00B2  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00B6  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
00BA  83 E8 04				sub		eax,0x00000004
00BD  39 F0				cmp		eax,esi
00BF  77 BF				ja		L$7
00C1  89 44 24 10			mov		dword ptr 0x10[esp],eax
00C5  83 F8 38				cmp		eax,0x00000038
00C8  72 B6				jb		L$7
00CA  53				push		ebx
00CB  89 03				mov		dword ptr [ebx],eax
00CD  E8 00 00 00 00			call		__LinkUpNewMHeap
00D2  89 C2				mov		edx,eax
00D4  83 C4 04				add		esp,0x00000004
00D7  8B 00				mov		eax,dword ptr [eax]
00D9  89 44 24 10			mov		dword ptr 0x10[esp],eax
00DD  0C 01				or		al,0x01
00DF  89 02				mov		dword ptr [edx],eax
00E1  83 C2 04				add		edx,0x00000004
00E4  8B 7B 18				mov		edi,dword ptr 0x18[ebx]
00E7  C7 43 14 FF FF FF FF		mov		dword ptr 0x14[ebx],0xffffffff
00EE  47				inc		edi
00EF  52				push		edx
00F0  89 7B 18				mov		dword ptr 0x18[ebx],edi
00F3  E8 00 00 00 00			call		_nfree
00F8  B8 01 00 00 00			mov		eax,0x00000001
00FD  83 C4 04				add		esp,0x00000004
0100				L$9:
0100  5F				pop		edi
0101  5E				pop		esi
0102  5B				pop		ebx
0103  C3				ret		

Routine Size: 260 bytes,    Routine Base: _TEXT + 0000

0104				__ExpandDGROUP:
0104  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0108  52				push		edx
0109  E8 00 00 00 00			call		__CreateNewNHeap
010E  83 C4 04				add		esp,0x00000004
0111  C3				ret		
0112				__AdjustAmount:
0112  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0116  8B 02				mov		eax,dword ptr [edx]
0118  83 C0 03				add		eax,0x00000003
011B  24 FC				and		al,0xfc
011D  85 C0				test		eax,eax
011F  75 01				jne		L$10
0121  C3				ret		
0122				L$10:
0122  89 02				mov		dword ptr [edx],eax
0124  83 C0 3C				add		eax,0x0000003c
0127  3B 02				cmp		eax,dword ptr [edx]
0129  73 03				jae		L$12
012B				L$11:
012B  31 C0				xor		eax,eax
012D  C3				ret		
012E				L$12:
012E  8B 0D 00 00 00 00			mov		ecx,dword ptr _amblksiz
0134  39 C8				cmp		eax,ecx
0136  73 04				jae		L$13
0138  89 C8				mov		eax,ecx
013A  24 FE				and		al,0xfe
013C				L$13:
013C  89 02				mov		dword ptr [edx],eax
013E  05 FF 0F 00 00			add		eax,0x00000fff
0143  3B 02				cmp		eax,dword ptr [edx]
0145  72 E4				jb		L$11
0147  80 E4 F0				and		ah,0xf0
014A  30 C0				xor		al,al
014C  89 02				mov		dword ptr [edx],eax
014E  85 C0				test		eax,eax
0150  0F 95 C0				setne		al
0153  25 FF 00 00 00			and		eax,0x000000ff
0158  C3				ret		

Routine Size: 85 bytes,    Routine Base: _TEXT + 0104

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

