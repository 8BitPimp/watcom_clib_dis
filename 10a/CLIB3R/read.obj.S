Module: read
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000175 bytes
0000				read_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 10				sub		esp,0x00000010
0007  50				push		eax
0008  89 D5				mov		ebp,edx
000A  89 C2				mov		edx,eax
000C  A1 00 00 00 00			mov		eax,dword ptr ___FileHandleIDs
0011  8B 04 90				mov		eax,dword ptr [eax+edx*4]
0014  89 44 24 10			mov		dword ptr 0x10[esp],eax
0018  89 D0				mov		eax,edx
001A  E8 00 00 00 00			call		__IOMode_
001F  89 C2				mov		edx,eax
0021  89 44 24 04			mov		dword ptr 0x4[esp],eax
0025  85 C0				test		eax,eax
0027  75 14				jne		L$2
0029  B8 04 00 00 00			mov		eax,0x00000004
002E  E8 00 00 00 00			call		__set_errno_
0033				L$1:
0033  B8 FF FF FF FF			mov		eax,0xffffffff
0038  E9 30 01 00 00			jmp		L$15
003D				L$2:
003D  8B 04 24				mov		eax,dword ptr [esp]
0040  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0046  F6 C2 01				test		dl,0x01
0049  75 15				jne		L$3
004B  B8 06 00 00 00			mov		eax,0x00000006
0050  E8 00 00 00 00			call		__set_errno_
0055  8B 04 24				mov		eax,dword ptr [esp]
0058  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
005E  EB D3				jmp		L$1
0060				L$3:
0060  F6 C2 40				test		dl,0x40
0063  74 57				je		L$6
0065  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
006C  74 1C				je		L$4
006E  8B 04 24				mov		eax,dword ptr [esp]
0071  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
0077  85 C0				test		eax,eax
0079  74 0F				je		L$4
007B  89 EA				mov		edx,ebp
007D  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
0083  89 C7				mov		edi,eax
0085  E9 D8 00 00 00			jmp		L$14
008A				L$4:
008A  6A 00				push		0x00000000
008C  8D 44 24 0C			lea		eax,0xc[esp]
0090  50				push		eax
0091  53				push		ebx
0092  55				push		ebp
0093  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0097  53				push		ebx
0098  E8 00 00 00 00			call		_ReadFile
009D  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
00A1  85 C0				test		eax,eax
00A3  0F 85 B9 00 00 00			jne		L$14
00A9				L$5:
00A9  8B 04 24				mov		eax,dword ptr [esp]
00AC  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
00B2  E8 00 00 00 00			call		__set_errno_nt_
00B7  E9 B1 00 00 00			jmp		L$15
00BC				L$6:
00BC  89 5C 24 0C			mov		dword ptr 0xc[esp],ebx
00C0  31 FF				xor		edi,edi
00C2				L$7:
00C2  83 3D 00 00 00 00 00		cmp		dword ptr __WindowsStdin,0x00000000
00C9  74 1F				je		L$8
00CB  8B 04 24				mov		eax,dword ptr [esp]
00CE  FF 15 00 00 00 00			call		dword ptr __WindowsIsWindowedHandle
00D4  85 C0				test		eax,eax
00D6  74 12				je		L$8
00D8  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
00DC  89 EA				mov		edx,ebp
00DE  FF 15 00 00 00 00			call		dword ptr __WindowsStdin
00E4  89 44 24 08			mov		dword ptr 0x8[esp],eax
00E8  EB 1B				jmp		L$9
00EA				L$8:
00EA  6A 00				push		0x00000000
00EC  8D 44 24 0C			lea		eax,0xc[esp]
00F0  50				push		eax
00F1  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
00F5  56				push		esi
00F6  55				push		ebp
00F7  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
00FB  50				push		eax
00FC  E8 00 00 00 00			call		_ReadFile
0101  85 C0				test		eax,eax
0103  74 A4				je		L$5
0105				L$9:
0105  83 7C 24 08 00			cmp		dword ptr 0x8[esp],0x00000000
010A  74 56				je		L$14
010C  89 E8				mov		eax,ebp
010E  31 DB				xor		ebx,ebx
0110  31 D2				xor		edx,edx
0112  EB 2B				jmp		L$13
0114				L$10:
0114  8A 08				mov		cl,byte ptr [eax]
0116  80 F9 1A				cmp		cl,0x1a
0119  75 16				jne		L$11
011B  2B 5C 24 08			sub		ebx,dword ptr 0x8[esp]
011F  8B 04 24				mov		eax,dword ptr [esp]
0122  8D 53 01				lea		edx,0x1[ebx]
0125  BB 01 00 00 00			mov		ebx,0x00000001
012A  E8 00 00 00 00			call		lseek_
012F  EB 31				jmp		L$14
0131				L$11:
0131  80 F9 0D				cmp		cl,0x0d
0134  74 07				je		L$12
0136  89 D6				mov		esi,edx
0138  47				inc		edi
0139  42				inc		edx
013A  88 0C 2E				mov		byte ptr [esi+ebp],cl
013D				L$12:
013D  40				inc		eax
013E  43				inc		ebx
013F				L$13:
013F  3B 5C 24 08			cmp		ebx,dword ptr 0x8[esp]
0143  72 CF				jb		L$10
0145  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0149  8A 64 24 05			mov		ah,byte ptr 0x5[esp]
014D  29 D6				sub		esi,edx
014F  01 D5				add		ebp,edx
0151  89 74 24 0C			mov		dword ptr 0xc[esp],esi
0155  F6 C4 20				test		ah,0x20
0158  75 08				jne		L$14
015A  85 F6				test		esi,esi
015C  0F 85 60 FF FF FF			jne		L$7
0162				L$14:
0162  8B 04 24				mov		eax,dword ptr [esp]
0165  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
016B  89 F8				mov		eax,edi
016D				L$15:
016D  83 C4 14				add		esp,0x00000014
0170  5D				pop		ebp
0171  5F				pop		edi
0172  5E				pop		esi
0173  59				pop		ecx
0174  C3				ret		

Routine Size: 373 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

