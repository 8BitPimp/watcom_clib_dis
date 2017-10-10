Module: strtol
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A0 bytes
0000				_stol_:
0000  56				push		esi
0001  57				push		edi
0002  55				push		ebp
0003  83 EC 10				sub		esp,0x00000010
0006  89 C5				mov		ebp,eax
0008  89 D7				mov		edi,edx
000A  89 DE				mov		esi,ebx
000C  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
0010  85 D2				test		edx,edx
0012  74 02				je		L$1
0014  89 02				mov		dword ptr [edx],eax
0016				L$1:
0016  89 EA				mov		edx,ebp
0018				L$2:
0018  8A 02				mov		al,byte ptr [edx]
001A  FE C0				inc		al
001C  25 FF 00 00 00			and		eax,0x000000ff
0021  F6 80 00 00 00 00 02		test		byte ptr __IsTable[eax],0x02
0028  74 03				je		L$3
002A  42				inc		edx
002B  EB EB				jmp		L$2
002D				L$3:
002D  8A 02				mov		al,byte ptr [edx]
002F  88 44 24 0C			mov		byte ptr 0xc[esp],al
0033  3C 2B				cmp		al,0x2b
0035  74 04				je		L$4
0037  3C 2D				cmp		al,0x2d
0039  75 01				jne		L$5
003B				L$4:
003B  42				inc		edx
003C				L$5:
003C  85 F6				test		esi,esi
003E  75 28				jne		L$9
0040  80 3A 30				cmp		byte ptr [edx],0x30
0043  75 12				jne		L$7
0045  8A 42 01				mov		al,byte ptr 0x1[edx]
0048  3C 78				cmp		al,0x78
004A  74 04				je		L$6
004C  3C 58				cmp		al,0x58
004E  75 07				jne		L$7
0050				L$6:
0050  BE 10 00 00 00			mov		esi,0x00000010
0055  EB 11				jmp		L$9
0057				L$7:
0057  80 3A 30				cmp		byte ptr [edx],0x30
005A  75 07				jne		L$8
005C  BE 08 00 00 00			mov		esi,0x00000008
0061  EB 05				jmp		L$9
0063				L$8:
0063  BE 0A 00 00 00			mov		esi,0x0000000a
0068				L$9:
0068  83 FE 02				cmp		esi,0x00000002
006B  7C 05				jl		L$10
006D  83 FE 24				cmp		esi,0x00000024
0070  7E 11				jle		L$11
0072				L$10:
0072  B8 0D 00 00 00			mov		eax,0x0000000d
0077  E8 00 00 00 00			call		__set_errno_
007C  31 C0				xor		eax,eax
007E  E9 AF 00 00 00			jmp		L$25
0083				L$11:
0083  83 FE 10				cmp		esi,0x00000010
0086  75 15				jne		L$13
0088  80 3A 30				cmp		byte ptr [edx],0x30
008B  75 10				jne		L$13
008D  8A 4A 01				mov		cl,byte ptr 0x1[edx]
0090  80 F9 78				cmp		cl,0x78
0093  74 05				je		L$12
0095  80 F9 58				cmp		cl,0x58
0098  75 03				jne		L$13
009A				L$12:
009A  83 C2 02				add		edx,0x00000002
009D				L$13:
009D  89 14 24				mov		dword ptr [esp],edx
00A0  30 C0				xor		al,al
00A2  31 DB				xor		ebx,ebx
00A4  88 44 24 08			mov		byte ptr 0x8[esp],al
00A8				L$14:
00A8  31 C0				xor		eax,eax
00AA  8A 02				mov		al,byte ptr [edx]
00AC  E8 00 00 00 00			call		radix_value_
00B1  39 F0				cmp		eax,esi
00B3  7D 13				jge		L$16
00B5  89 D9				mov		ecx,ebx
00B7  0F AF DE				imul		ebx,esi
00BA  01 C3				add		ebx,eax
00BC  39 CB				cmp		ebx,ecx
00BE  73 05				jae		L$15
00C0  C6 44 24 08 01			mov		byte ptr 0x8[esp],0x01
00C5				L$15:
00C5  42				inc		edx
00C6  EB E0				jmp		L$14
00C8				L$16:
00C8  3B 14 24				cmp		edx,dword ptr [esp]
00CB  75 02				jne		L$17
00CD  89 EA				mov		edx,ebp
00CF				L$17:
00CF  85 FF				test		edi,edi
00D1  74 02				je		L$18
00D3  89 17				mov		dword ptr [edi],edx
00D5				L$18:
00D5  83 7C 24 04 01			cmp		dword ptr 0x4[esp],0x00000001
00DA  75 16				jne		L$20
00DC  81 FB 00 00 00 80			cmp		ebx,0x80000000
00E2  72 0E				jb		L$20
00E4  75 07				jne		L$19
00E6  80 7C 24 0C 2D			cmp		byte ptr 0xc[esp],0x2d
00EB  74 05				je		L$20
00ED				L$19:
00ED  C6 44 24 08 01			mov		byte ptr 0x8[esp],0x01
00F2				L$20:
00F2  80 7C 24 08 00			cmp		byte ptr 0x8[esp],0x00
00F7  74 2E				je		L$23
00F9  B8 0E 00 00 00			mov		eax,0x0000000e
00FE  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
0102  E8 00 00 00 00			call		__set_errno_
0107  85 FF				test		edi,edi
0109  75 07				jne		L$21
010B  B8 FF FF FF FF			mov		eax,0xffffffff
0110  EB 20				jmp		L$25
0112				L$21:
0112  80 7C 24 0C 2D			cmp		byte ptr 0xc[esp],0x2d
0117  75 07				jne		L$22
0119  B8 00 00 00 80			mov		eax,0x80000000
011E  EB 12				jmp		L$25
0120				L$22:
0120  B8 FF FF FF 7F			mov		eax,0x7fffffff
0125  EB 0B				jmp		L$25
0127				L$23:
0127  80 7C 24 0C 2D			cmp		byte ptr 0xc[esp],0x2d
012C  75 02				jne		L$24
012E  F7 DB				neg		ebx
0130				L$24:
0130  89 D8				mov		eax,ebx
0132				L$25:
0132  83 C4 10				add		esp,0x00000010
0135  5D				pop		ebp
0136  5F				pop		edi
0137  5E				pop		esi
0138  C3				ret		

Routine Size: 313 bytes,    Routine Base: _TEXT + 0000

0139				strtoul_:
0139  51				push		ecx
013A  31 C9				xor		ecx,ecx
013C				L$26:
013C  E8 00 00 00 00			call		_stol_
0141  59				pop		ecx
0142  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0139

0143				strtol_:
0143  51				push		ecx
0144  B9 01 00 00 00			mov		ecx,0x00000001
0149  EB F1				jmp		L$26
014B				radix_value_:
014B  52				push		edx
014C  88 C2				mov		dl,al
014E  3C 30				cmp		al,0x30
0150  72 0D				jb		L$27
0152  3C 39				cmp		al,0x39
0154  77 09				ja		L$27
0156  31 C0				xor		eax,eax
0158  88 D0				mov		al,dl
015A  83 E8 30				sub		eax,0x00000030
015D  5A				pop		edx
015E  C3				ret		
015F				L$27:
015F  31 C0				xor		eax,eax
0161  88 D0				mov		al,dl
0163  E8 00 00 00 00			call		tolower_
0168  88 C2				mov		dl,al
016A  3C 61				cmp		al,0x61
016C  72 0E				jb		L$28
016E  3C 69				cmp		al,0x69
0170  77 0A				ja		L$28
0172  25 FF 00 00 00			and		eax,0x000000ff
0177  83 E8 57				sub		eax,0x00000057
017A  5A				pop		edx
017B  C3				ret		
017C				L$28:
017C  80 FA 6A				cmp		dl,0x6a
017F  72 0E				jb		L$30
0181  80 FA 72				cmp		dl,0x72
0184  77 09				ja		L$30
0186				L$29:
0186  31 C0				xor		eax,eax
0188  88 D0				mov		al,dl
018A  83 E8 57				sub		eax,0x00000057
018D  5A				pop		edx
018E  C3				ret		
018F				L$30:
018F  80 FA 73				cmp		dl,0x73
0192  72 05				jb		L$31
0194  80 FA 7A				cmp		dl,0x7a
0197  76 ED				jbe		L$29
0199				L$31:
0199  B8 25 00 00 00			mov		eax,0x00000025
019E  5A				pop		edx
019F  C3				ret		

Routine Size: 93 bytes,    Routine Base: _TEXT + 0143

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

