Module: nthdl
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001CD bytes
0000				__NTAtMaxFiles_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  8B 0D 00 00 00 00			mov		ecx,dword ptr ___FileHandleIDs
0009  A1 00 00 00 00			mov		eax,dword ptr _topFileID
000E  3B 05 00 00 00 00			cmp		eax,dword ptr ___NFiles
0014  73 04				jae		L$2
0016				L$1:
0016  31 C0				xor		eax,eax
0018  EB 21				jmp		L$5
001A				L$2:
001A  8B 1D 00 00 00 00			mov		ebx,dword ptr _topFileID
0020  31 C0				xor		eax,eax
0022  C1 E3 02				shl		ebx,0x02
0025  EB 0B				jmp		L$4
0027				L$3:
0027  89 CA				mov		edx,ecx
0029  83 3C 02 00			cmp		dword ptr [edx+eax],0x00000000
002D  74 E7				je		L$1
002F  83 C0 04				add		eax,0x00000004
0032				L$4:
0032  39 D8				cmp		eax,ebx
0034  7C F1				jl		L$3
0036  B8 01 00 00 00			mov		eax,0x00000001
003B				L$5:
003B  89 0D 00 00 00 00			mov		dword ptr ___FileHandleIDs,ecx
0041  5A				pop		edx
0042  59				pop		ecx
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

0045				__NTAddFileHandle_:
0045  53				push		ebx
0046  51				push		ecx
0047  52				push		edx
0048  56				push		esi
0049  89 C6				mov		esi,eax
004B  FF 15 00 00 00 00			call		dword ptr __AccessFList
0051  8B 0D 00 00 00 00			mov		ecx,dword ptr _topFileID
0057  31 DB				xor		ebx,ebx
0059  31 C0				xor		eax,eax
005B  C1 E1 02				shl		ecx,0x02
005E  EB 20				jmp		L$8
0060				L$6:
0060  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0066  01 C2				add		edx,eax
0068  83 3A 00				cmp		dword ptr [edx],0x00000000
006B  75 0F				jne		L$7
006D  89 32				mov		dword ptr [edx],esi
006F  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0075  89 D8				mov		eax,ebx
0077  5E				pop		esi
0078  5A				pop		edx
0079  59				pop		ecx
007A  5B				pop		ebx
007B  C3				ret		
007C				L$7:
007C  83 C0 04				add		eax,0x00000004
007F  43				inc		ebx
0080				L$8:
0080  39 C8				cmp		eax,ecx
0082  7C DC				jl		L$6
0084  8B 15 00 00 00 00			mov		edx,dword ptr _topFileID
008A  42				inc		edx
008B  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0090  C1 E2 02				shl		edx,0x02
0093  E8 00 00 00 00			call		realloc_
0098  89 C2				mov		edx,eax
009A  A3 00 00 00 00			mov		dword ptr ___FileHandleIDs,eax
009F  A1 00 00 00 00			mov		eax,dword ptr _topFileID
00A4  89 34 82				mov		dword ptr [edx+eax*4],esi
00A7  8D 50 01				lea		edx,0x1[eax]
00AA  89 15 00 00 00 00			mov		dword ptr _topFileID,edx
00B0  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
00B6  A1 00 00 00 00			mov		eax,dword ptr _topFileID
00BB  48				dec		eax
00BC  5E				pop		esi
00BD  5A				pop		edx
00BE  59				pop		ecx
00BF  5B				pop		ebx
00C0  C3				ret		

Routine Size: 124 bytes,    Routine Base: _TEXT + 0045

00C1				__NTAddSpecificFileHandle_:
00C1  53				push		ebx
00C2  51				push		ecx
00C3  56				push		esi
00C4  57				push		edi
00C5  89 C7				mov		edi,eax
00C7  89 D6				mov		esi,edx
00C9  FF 15 00 00 00 00			call		dword ptr __AccessFList
00CF  83 FA 01				cmp		edx,0x00000001
00D2  72 09				jb		L$9
00D4  76 10				jbe		L$10
00D6  83 FA 02				cmp		edx,0x00000002
00D9  74 10				je		L$11
00DB  EB 16				jmp		L$13
00DD				L$9:
00DD  85 D2				test		edx,edx
00DF  75 12				jne		L$13
00E1  57				push		edi
00E2  6A F6				push		0xfffffff6
00E4  EB 08				jmp		L$12
00E6				L$10:
00E6  57				push		edi
00E7  6A F5				push		0xfffffff5
00E9  EB 03				jmp		L$12
00EB				L$11:
00EB  57				push		edi
00EC  6A F4				push		0xfffffff4
00EE				L$12:
00EE  E8 00 00 00 00			call		_SetStdHandle
00F3				L$13:
00F3  89 F1				mov		ecx,esi
00F5  8B 15 00 00 00 00			mov		edx,dword ptr _topFileID
00FB  C1 E1 02				shl		ecx,0x02
00FE  39 D6				cmp		esi,edx
0100  7D 0A				jge		L$14
0102  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0107  89 3C 01				mov		dword ptr [ecx+eax],edi
010A  EB 45				jmp		L$17
010C				L$14:
010C  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0111  8D 51 04				lea		edx,0x4[ecx]
0114  E8 00 00 00 00			call		realloc_
0119  8B 1D 00 00 00 00			mov		ebx,dword ptr _topFileID
011F  A3 00 00 00 00			mov		dword ptr ___FileHandleIDs,eax
0124  89 D8				mov		eax,ebx
0126  C1 E0 02				shl		eax,0x02
0129  EB 11				jmp		L$16
012B				L$15:
012B  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0131  43				inc		ebx
0132  C7 04 02 00 00 00 00		mov		dword ptr [edx+eax],0x00000000
0139  83 C0 04				add		eax,0x00000004
013C				L$16:
013C  39 C8				cmp		eax,ecx
013E  7C EB				jl		L$15
0140  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0145  89 F2				mov		edx,esi
0147  46				inc		esi
0148  89 3C 90				mov		dword ptr [eax+edx*4],edi
014B  89 35 00 00 00 00			mov		dword ptr _topFileID,esi
0151				L$17:
0151  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0157  5F				pop		edi
0158  5E				pop		esi
0159  59				pop		ecx
015A  5B				pop		ebx
015B  C3				ret		

Routine Size: 155 bytes,    Routine Base: _TEXT + 00C1

015C				__NTRemoveFileHandle_:
015C  52				push		edx
015D  89 C2				mov		edx,eax
015F  FF 15 00 00 00 00			call		dword ptr __AccessFList
0165  3B 15 00 00 00 00			cmp		edx,dword ptr _topFileID
016B  7D 0F				jge		L$18
016D  89 D0				mov		eax,edx
016F  8B 15 00 00 00 00			mov		edx,dword ptr ___FileHandleIDs
0175  C7 04 82 00 00 00 00		mov		dword ptr [edx+eax*4],0x00000000
017C				L$18:
017C  FF 15 00 00 00 00			call		dword ptr __ReleaseFList
0182  5A				pop		edx
0183  C3				ret		

Routine Size: 40 bytes,    Routine Base: _TEXT + 015C

0184				__NTInitFileHandles_:
0184  51				push		ecx
0185  52				push		edx
0186  31 D2				xor		edx,edx
0188  6A F6				push		0xfffffff6
018A  89 15 00 00 00 00			mov		dword ptr _topFileID,edx
0190  89 15 00 00 00 00			mov		dword ptr ___FileHandleIDs,edx
0196  E8 00 00 00 00			call		_GetStdHandle
019B  E8 00 00 00 00			call		__NTAddFileHandle_
01A0  6A F5				push		0xfffffff5
01A2  E8 00 00 00 00			call		_GetStdHandle
01A7  E8 00 00 00 00			call		__NTAddFileHandle_
01AC  6A F4				push		0xfffffff4
01AE  E8 00 00 00 00			call		_GetStdHandle
01B3  E8 00 00 00 00			call		__NTAddFileHandle_
01B8  5A				pop		edx
01B9  59				pop		ecx
01BA  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0184

01BB				__NTGetFakeHandle_:
01BB  52				push		edx
01BC  8B 15 00 00 00 00			mov		edx,dword ptr _fakeHandle
01C2  42				inc		edx
01C3  89 15 00 00 00 00			mov		dword ptr _fakeHandle,edx
01C9  89 D0				mov		eax,edx
01CB  5A				pop		edx
01CC  C3				ret		

Routine Size: 18 bytes,    Routine Base: _TEXT + 01BB

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000004 bytes
0000				_fakeHandle:
0000  00 00 00 80                                     ....

Segment: _BSS DWORD USE32 00000008 bytes
0000				___FileHandleIDs:
0004				_topFileID:

BSS Size: 8 bytes

