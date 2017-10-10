Module: mbscmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000018D bytes
0000				_mbscmp:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 08				sub		esp,0x00000008
0005  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0009  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000D  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0014  74 44				je		L$4
0016				L$1:
0016  8D 44 24 04			lea		eax,0x4[esp]
001A  50				push		eax
001B  53				push		ebx
001C  E8 00 00 00 00			call		_mbgetcode
0021  83 C4 08				add		esp,0x00000008
0024  89 C3				mov		ebx,eax
0026  89 E0				mov		eax,esp
0028  50				push		eax
0029  56				push		esi
002A  E8 00 00 00 00			call		_mbgetcode
002F  83 C4 08				add		esp,0x00000008
0032  89 C6				mov		esi,eax
0034  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0038  8B 0C 24				mov		ecx,dword ptr [esp]
003B  39 C8				cmp		eax,ecx
003D  74 10				je		L$3
003F  73 07				jae		L$2
0041  B8 FF FF FF FF			mov		eax,0xffffffff
0046  EB 1C				jmp		L$5
0048				L$2:
0048  B8 01 00 00 00			mov		eax,0x00000001
004D  EB 15				jmp		L$5
004F				L$3:
004F  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
0054  75 C0				jne		L$1
0056  31 C8				xor		eax,ecx
0058  EB 0A				jmp		L$5
005A				L$4:
005A  56				push		esi
005B  53				push		ebx
005C  E8 00 00 00 00			call		strcmp
0061  83 C4 08				add		esp,0x00000008
0064				L$5:
0064  83 C4 08				add		esp,0x00000008
0067  5E				pop		esi
0068  5B				pop		ebx
0069  C3				ret		

Routine Size: 106 bytes,    Routine Base: _TEXT + 0000

006A				_mbsncmp:
006A  53				push		ebx
006B  56				push		esi
006C  57				push		edi
006D  83 EC 08				sub		esp,0x00000008
0070  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0074  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0078  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
007C  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0083  74 4A				je		L$10
0085				L$6:
0085  4B				dec		ebx
0086  83 FB FF				cmp		ebx,0xffffffff
0089  74 40				je		L$9
008B  8D 44 24 04			lea		eax,0x4[esp]
008F  50				push		eax
0090  57				push		edi
0091  E8 00 00 00 00			call		_mbgetcode
0096  83 C4 08				add		esp,0x00000008
0099  89 C7				mov		edi,eax
009B  89 E0				mov		eax,esp
009D  50				push		eax
009E  56				push		esi
009F  E8 00 00 00 00			call		_mbgetcode
00A4  83 C4 08				add		esp,0x00000008
00A7  89 C6				mov		esi,eax
00A9  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00AD  8B 0C 24				mov		ecx,dword ptr [esp]
00B0  39 C8				cmp		eax,ecx
00B2  74 10				je		L$8
00B4  73 07				jae		L$7
00B6  B8 FF FF FF FF			mov		eax,0xffffffff
00BB  EB 1D				jmp		L$11
00BD				L$7:
00BD  B8 01 00 00 00			mov		eax,0x00000001
00C2  EB 16				jmp		L$11
00C4				L$8:
00C4  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
00C9  75 BA				jne		L$6
00CB				L$9:
00CB  31 C0				xor		eax,eax
00CD  EB 0B				jmp		L$11
00CF				L$10:
00CF  53				push		ebx
00D0  56				push		esi
00D1  57				push		edi
00D2  E8 00 00 00 00			call		strncmp
00D7  83 C4 0C				add		esp,0x0000000c
00DA				L$11:
00DA  83 C4 08				add		esp,0x00000008
00DD  5F				pop		edi
00DE  5E				pop		esi
00DF  5B				pop		ebx
00E0  C3				ret		

Routine Size: 119 bytes,    Routine Base: _TEXT + 006A

00E1				_mbsnbcmp:
00E1  53				push		ebx
00E2  56				push		esi
00E3  57				push		edi
00E4  55				push		ebp
00E5  83 EC 08				sub		esp,0x00000008
00E8  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
00EC  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
00F0  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
00F4  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
00FB  0F 84 79 00 00 00			je		L$19
0101  85 DB				test		ebx,ebx
0103  7F 07				jg		L$13
0105				L$12:
0105  31 C0				xor		eax,eax
0107  E9 79 00 00 00			jmp		L$20
010C				L$13:
010C  8B 0D 00 00 00 00			mov		ecx,dword ptr __IsDBCS
0112  4B				dec		ebx
0113  85 C9				test		ecx,ecx
0115  74 13				je		L$14
0117  31 C0				xor		eax,eax
0119  8A 06				mov		al,byte ptr [esi]
011B  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
0121  24 01				and		al,0x01
0123  25 FF 00 00 00			and		eax,0x000000ff
0128  EB 02				jmp		L$15
012A				L$14:
012A  31 C0				xor		eax,eax
012C				L$15:
012C  74 01				je		L$16
012E  4B				dec		ebx
012F				L$16:
012F  8D 44 24 04			lea		eax,0x4[esp]
0133  50				push		eax
0134  56				push		esi
0135  E8 00 00 00 00			call		_mbgetcode
013A  83 C4 08				add		esp,0x00000008
013D  89 C6				mov		esi,eax
013F  89 E0				mov		eax,esp
0141  50				push		eax
0142  57				push		edi
0143  E8 00 00 00 00			call		_mbgetcode
0148  83 C4 08				add		esp,0x00000008
014B  89 C7				mov		edi,eax
014D  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0151  8B 2C 24				mov		ebp,dword ptr [esp]
0154  39 E8				cmp		eax,ebp
0156  74 10				je		L$18
0158  73 07				jae		L$17
015A  B8 FF FF FF FF			mov		eax,0xffffffff
015F  EB 24				jmp		L$20
0161				L$17:
0161  B8 01 00 00 00			mov		eax,0x00000001
0166  EB 1D				jmp		L$20
0168				L$18:
0168  83 7C 24 04 00			cmp		dword ptr 0x4[esp],0x00000000
016D  74 96				je		L$12
016F  85 ED				test		ebp,ebp
0171  74 92				je		L$12
0173  83 FB 01				cmp		ebx,0x00000001
0176  7D 94				jge		L$13
0178  EB 8B				jmp		L$12
017A				L$19:
017A  53				push		ebx
017B  57				push		edi
017C  56				push		esi
017D  E8 00 00 00 00			call		strncmp
0182  83 C4 0C				add		esp,0x0000000c
0185				L$20:
0185  83 C4 08				add		esp,0x00000008
0188  5D				pop		ebp
0189  5F				pop		edi
018A  5E				pop		esi
018B  5B				pop		ebx
018C  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 00E1

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

