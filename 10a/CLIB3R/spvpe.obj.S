Module: spvpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000136 bytes
0000				spawnvpe_:
0000  68 28 01 00 00			push		0x00000128
0005  E8 00 00 00 00			call		__CHK
000A  56				push		esi
000B  57				push		edi
000C  C8 14 01 00			enter		0x0114,0x00
0010  50				push		eax
0011  89 D6				mov		esi,edx
0013  89 5D F8				mov		dword ptr -0x8[ebp],ebx
0016  89 4D F4				mov		dword ptr -0xc[ebp],ecx
0019  E8 00 00 00 00			call		spawnve_
001E  89 C1				mov		ecx,eax
0020  89 C2				mov		edx,eax
0022  83 F8 FF				cmp		eax,0xffffffff
0025  0F 85 05 01 00 00			jne		L$6
002B  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
0031  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0035  0F 85 F5 00 00 00			jne		L$6
003B  80 3E 5C				cmp		byte ptr [esi],0x5c
003E  0F 84 EC 00 00 00			je		L$6
0044  80 3E 00				cmp		byte ptr [esi],0x00
0047  0F 84 E3 00 00 00			je		L$6
004D  80 7E 01 3A			cmp		byte ptr 0x1[esi],0x3a
0051  0F 84 D9 00 00 00			je		L$6
0057  B8 00 00 00 00			mov		eax,offset DGROUP:L$7
005C  E8 00 00 00 00			call		getenv_
0061  89 C3				mov		ebx,eax
0063  85 C0				test		eax,eax
0065  75 06				jne		L$1
0067  89 C8				mov		eax,ecx
0069  C9				leave		
006A  5F				pop		edi
006B  5E				pop		esi
006C  C3				ret		
006D				L$1:
006D  89 F0				mov		eax,esi
006F  E8 00 00 00 00			call		strlen_
0074  40				inc		eax
0075  89 45 FC				mov		dword ptr -0x4[ebp],eax
0078  B8 04 01 00 00			mov		eax,0x00000104
007D  2B 45 FC				sub		eax,dword ptr -0x4[ebp]
0080  89 45 F0				mov		dword ptr -0x10[ebp],eax
0083				L$2:
0083  80 3B 00				cmp		byte ptr [ebx],0x00
0086  0F 84 A4 00 00 00			je		L$6
008C  BA 3B 00 00 00			mov		edx,0x0000003b
0091  89 D8				mov		eax,ebx
0093  E8 00 00 00 00			call		strchr_
0098  89 C7				mov		edi,eax
009A  85 C0				test		eax,eax
009C  75 0A				jne		L$3
009E  89 D8				mov		eax,ebx
00A0  E8 00 00 00 00			call		strlen_
00A5  8D 3C 03				lea		edi,[ebx+eax]
00A8				L$3:
00A8  89 F9				mov		ecx,edi
00AA  29 D9				sub		ecx,ebx
00AC  3B 4D F0				cmp		ecx,dword ptr -0x10[ebp]
00AF  76 1D				jbe		L$4
00B1  B8 02 00 00 00			mov		eax,0x00000002
00B6  E8 00 00 00 00			call		__set_errno_
00BB  B8 0A 00 00 00			mov		eax,0x0000000a
00C0  E8 00 00 00 00			call		__set_doserrno_
00C5  B8 FF FF FF FF			mov		eax,0xffffffff
00CA  C9				leave		
00CB  5F				pop		edi
00CC  5E				pop		esi
00CD  C3				ret		
00CE				L$4:
00CE  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
00D4  89 DA				mov		edx,ebx
00D6  89 CB				mov		ebx,ecx
00D8  E8 00 00 00 00			call		memcpy_
00DD  8D 85 EC FE FF FF			lea		eax,-0x114[ebp]
00E3  01 C8				add		eax,ecx
00E5  80 78 FF 5C			cmp		byte ptr -0x1[eax],0x5c
00E9  74 04				je		L$5
00EB  C6 00 5C				mov		byte ptr [eax],0x5c
00EE  40				inc		eax
00EF				L$5:
00EF  8B 5D FC				mov		ebx,dword ptr -0x4[ebp]
00F2  89 F2				mov		edx,esi
00F4  8B 4D F4				mov		ecx,dword ptr -0xc[ebp]
00F7  E8 00 00 00 00			call		memcpy_
00FC  8B 85 E8 FE FF FF			mov		eax,dword ptr -0x118[ebp]
0102  8D 95 EC FE FF FF			lea		edx,-0x114[ebp]
0108  8B 5D F8				mov		ebx,dword ptr -0x8[ebp]
010B  E8 00 00 00 00			call		spawnve_
0110  89 C2				mov		edx,eax
0112  83 F8 FF				cmp		eax,0xffffffff
0115  75 19				jne		L$6
0117  FF 15 00 00 00 00			call		dword ptr ___GetThreadPtr
011D  83 78 04 01			cmp		dword ptr 0x4[eax],0x00000001
0121  75 0D				jne		L$6
0123  80 3F 3B				cmp		byte ptr [edi],0x3b
0126  75 08				jne		L$6
0128  8D 5F 01				lea		ebx,0x1[edi]
012B  E9 53 FF FF FF			jmp		L$2
0130				L$6:
0130  89 D0				mov		eax,edx
0132  C9				leave		
0133  5F				pop		edi
0134  5E				pop		esi
0135  C3				ret		

Routine Size: 310 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000005 bytes
0000				L$7:
0000  50 41 54 48 00                                  PATH.

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

