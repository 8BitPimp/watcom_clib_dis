Module: split2
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CD bytes
0000				pcopy_:
0000  56				push		esi
0001  57				push		edi
0002  89 DE				mov		esi,ebx
0004  85 C0				test		eax,eax
0006  75 05				jne		L$1
0008  89 D0				mov		eax,edx
000A  5F				pop		edi
000B  5E				pop		esi
000C  C3				ret		
000D				L$1:
000D  89 CB				mov		ebx,ecx
000F  29 F3				sub		ebx,esi
0011  89 10				mov		dword ptr [eax],edx
0013  81 FB 07 01 00 00			cmp		ebx,0x00000107
0019  72 05				jb		L$2
001B  BB 06 01 00 00			mov		ebx,0x00000106
0020				L$2:
0020  89 D7				mov		edi,edx
0022  89 D9				mov		ecx,ebx
0024  06				push		es
0025  8C D8				mov		eax,ds
0027  8E C0				mov		es,eax
0029  57				push		edi
002A  89 C8				mov		eax,ecx
002C  C1 E9 02				shr		ecx,0x02
002F  F2 A5				repne movsd	
0031  8A C8				mov		cl,al
0033  80 E1 03				and		cl,0x03
0036  F2 A4				repne movsb	
0038  5F				pop		edi
0039  07				pop		es
003A  8D 04 1A				lea		eax,[edx+ebx]
003D  C6 00 00				mov		byte ptr [eax],0x00
0040  40				inc		eax
0041  5F				pop		edi
0042  5E				pop		esi
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

0044				_splitpath2_:
0044  56				push		esi
0045  57				push		edi
0046  55				push		ebp
0047  89 C6				mov		esi,eax
0049  80 38 00				cmp		byte ptr [eax],0x00
004C  74 20				je		L$4
004E  80 7E 01 3A			cmp		byte ptr 0x1[esi],0x3a
0052  75 1A				jne		L$4
0054  85 DB				test		ebx,ebx
0056  74 11				je		L$3
0058  89 13				mov		dword ptr [ebx],edx
005A  8A 06				mov		al,byte ptr [esi]
005C  C6 42 01 3A			mov		byte ptr 0x1[edx],0x3a
0060  C6 42 02 00			mov		byte ptr 0x2[edx],0x00
0064  88 02				mov		byte ptr [edx],al
0066  83 C2 03				add		edx,0x00000003
0069				L$3:
0069  83 C6 02				add		esi,0x00000002
006C  EB 0A				jmp		L$5
006E				L$4:
006E  85 DB				test		ebx,ebx
0070  74 06				je		L$5
0072  89 13				mov		dword ptr [ebx],edx
0074  C6 02 00				mov		byte ptr [edx],0x00
0077  42				inc		edx
0078				L$5:
0078  89 F5				mov		ebp,esi
007A  89 F3				mov		ebx,esi
007C				L$6:
007C  31 FF				xor		edi,edi
007E				L$7:
007E  8A 06				mov		al,byte ptr [esi]
0080  84 C0				test		al,al
0082  74 16				je		L$10
0084  3C 2E				cmp		al,0x2e
0086  75 05				jne		L$8
0088  89 F7				mov		edi,esi
008A  46				inc		esi
008B  EB F1				jmp		L$7
008D				L$8:
008D  46				inc		esi
008E  3C 5C				cmp		al,0x5c
0090  74 04				je		L$9
0092  3C 2F				cmp		al,0x2f
0094  75 E8				jne		L$7
0096				L$9:
0096  89 F5				mov		ebp,esi
0098  EB E2				jmp		L$6
009A				L$10:
009A  89 C8				mov		eax,ecx
009C  89 E9				mov		ecx,ebp
009E  E8 00 00 00 00			call		pcopy_
00A3  89 C2				mov		edx,eax
00A5  85 FF				test		edi,edi
00A7  75 02				jne		L$11
00A9  89 F7				mov		edi,esi
00AB				L$11:
00AB  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
00AF  89 EB				mov		ebx,ebp
00B1  89 F9				mov		ecx,edi
00B3  E8 00 00 00 00			call		pcopy_
00B8  89 C2				mov		edx,eax
00BA  89 FB				mov		ebx,edi
00BC  89 F1				mov		ecx,esi
00BE  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
00C2  E8 00 00 00 00			call		pcopy_
00C7  5D				pop		ebp
00C8  5F				pop		edi
00C9  5E				pop		esi
00CA  C2 08 00				ret		0x0008

Routine Size: 137 bytes,    Routine Base: _TEXT + 0044

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

