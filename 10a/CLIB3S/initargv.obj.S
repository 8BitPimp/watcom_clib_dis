Module: initargv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A9 bytes
0000				__Init_Argv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  89 E0				mov		eax,esp
0009  50				push		eax
000A  6A 00				push		0x00000000
000C  8B 15 00 00 00 00			mov		edx,dword ptr _LpCmdLine
0012  52				push		edx
0013  E8 00 00 00 00			call		_SplitParms
0018  8B 0D 00 00 00 00			mov		ecx,dword ptr _LpCmdLine
001E  83 C4 0C				add		esp,0x0000000c
0021  8D 68 01				lea		ebp,0x1[eax]
0024  8B 1C 24				mov		ebx,dword ptr [esp]
0027  89 E8				mov		eax,ebp
0029  29 CB				sub		ebx,ecx
002B  C1 E0 02				shl		eax,0x02
002E  43				inc		ebx
002F  89 44 24 04			mov		dword ptr 0x4[esp],eax
0033  83 C0 04				add		eax,0x00000004
0036  01 D8				add		eax,ebx
0038  50				push		eax
0039  E8 00 00 00 00			call		malloc
003E  89 C2				mov		edx,eax
0040  83 C4 04				add		esp,0x00000004
0043  85 C0				test		eax,eax
0045  74 5B				je		L$1
0047  8B 35 00 00 00 00			mov		esi,dword ptr _LpCmdLine
004D  89 D7				mov		edi,edx
004F  01 D8				add		eax,ebx
0051  89 D9				mov		ecx,ebx
0053  A3 00 00 00 00			mov		dword ptr _argv,eax
0058  06				push		es
0059  8C D8				mov		eax,ds
005B  8E C0				mov		es,eax
005D  57				push		edi
005E  89 C8				mov		eax,ecx
0060  C1 E9 02				shr		ecx,0x02
0063  F2 A5				repne movsd	
0065  8A C8				mov		cl,al
0067  80 E1 03				and		cl,0x03
006A  F2 A4				repne movsb	
006C  5F				pop		edi
006D  07				pop		es
006E  8B 1D 00 00 00 00			mov		ebx,dword ptr _argv
0074  A1 00 00 00 00			mov		eax,dword ptr _LpPgmName
0079  89 03				mov		dword ptr [ebx],eax
007B  89 E0				mov		eax,esp
007D  50				push		eax
007E  83 C3 04				add		ebx,0x00000004
0081  53				push		ebx
0082  52				push		edx
0083  E8 00 00 00 00			call		_SplitParms
0088  83 C4 0C				add		esp,0x0000000c
008B  A1 00 00 00 00			mov		eax,dword ptr _argv
0090  03 44 24 04			add		eax,dword ptr 0x4[esp]
0094  89 2D 00 00 00 00			mov		dword ptr _argc,ebp
009A  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
00A0  EB 0A				jmp		L$2
00A2				L$1:
00A2  A3 00 00 00 00			mov		dword ptr _argv,eax
00A7  A3 00 00 00 00			mov		dword ptr _argc,eax
00AC				L$2:
00AC  A1 00 00 00 00			mov		eax,dword ptr _argv
00B1  89 2D 00 00 00 00			mov		dword ptr ___Argc,ebp
00B7  A3 00 00 00 00			mov		dword ptr ___Argv,eax
00BC  83 C4 08				add		esp,0x00000008
00BF  5D				pop		ebp
00C0  5F				pop		edi
00C1  5E				pop		esi
00C2  5B				pop		ebx
00C3  C3				ret		
00C4				_SplitParms:
00C4  53				push		ebx
00C5  56				push		esi
00C6  57				push		edi
00C7  55				push		ebp
00C8  83 EC 04				sub		esp,0x00000004
00CB  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00CF  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
00D3  31 C9				xor		ecx,ecx
00D5				L$3:
00D5  8A 10				mov		dl,byte ptr [eax]
00D7  80 FA 20				cmp		dl,0x20
00DA  74 05				je		L$4
00DC  80 FA 09				cmp		dl,0x09
00DF  75 03				jne		L$5
00E1				L$4:
00E1  40				inc		eax
00E2  EB F1				jmp		L$3
00E4				L$5:
00E4  84 D2				test		dl,dl
00E6  0F 84 AD 00 00 00			je		L$17
00EC  80 FA 22				cmp		dl,0x22
00EF  75 3E				jne		L$10
00F1  40				inc		eax
00F2  89 C7				mov		edi,eax
00F4  89 C2				mov		edx,eax
00F6				L$6:
00F6  8A 38				mov		bh,byte ptr [eax]
00F8  80 FF 22				cmp		bh,0x22
00FB  0F 84 62 00 00 00			je		L$14
0101  84 FF				test		bh,bh
0103  0F 84 5A 00 00 00			je		L$14
0109  80 FF 5C				cmp		bh,0x5c
010C  75 0D				jne		L$8
010E  8A 58 01				mov		bl,byte ptr 0x1[eax]
0111  80 FB 22				cmp		bl,0x22
0114  74 04				je		L$7
0116  38 FB				cmp		bl,bh
0118  75 01				jne		L$8
011A				L$7:
011A  40				inc		eax
011B				L$8:
011B  8D 58 01				lea		ebx,0x1[eax]
011E  85 F6				test		esi,esi
0120  74 09				je		L$9
0122  8A 00				mov		al,byte ptr [eax]
0124  88 02				mov		byte ptr [edx],al
0126  89 D8				mov		eax,ebx
0128  42				inc		edx
0129  EB CB				jmp		L$6
012B				L$9:
012B  89 D8				mov		eax,ebx
012D  EB C7				jmp		L$6
012F				L$10:
012F  89 C7				mov		edi,eax
0131  89 C2				mov		edx,eax
0133				L$11:
0133  8A 18				mov		bl,byte ptr [eax]
0135  84 DB				test		bl,bl
0137  74 2A				je		L$14
0139  80 FB 20				cmp		bl,0x20
013C  74 25				je		L$14
013E  80 FB 09				cmp		bl,0x09
0141  74 20				je		L$14
0143  80 FB 5C				cmp		bl,0x5c
0146  75 07				jne		L$12
0148  80 78 01 22			cmp		byte ptr 0x1[eax],0x22
014C  75 01				jne		L$12
014E  40				inc		eax
014F				L$12:
014F  8D 58 01				lea		ebx,0x1[eax]
0152  85 F6				test		esi,esi
0154  74 09				je		L$13
0156  8A 00				mov		al,byte ptr [eax]
0158  88 02				mov		byte ptr [edx],al
015A  89 D8				mov		eax,ebx
015C  42				inc		edx
015D  EB D4				jmp		L$11
015F				L$13:
015F  89 D8				mov		eax,ebx
0161  EB D0				jmp		L$11
0163				L$14:
0163  8D 58 01				lea		ebx,0x1[eax]
0166  8D 69 01				lea		ebp,0x1[ecx]
0169  89 1C 24				mov		dword ptr [esp],ebx
016C  85 F6				test		esi,esi
016E  74 1A				je		L$16
0170  89 3C 8E				mov		dword ptr [esi+ecx*4],edi
0173  8A 18				mov		bl,byte ptr [eax]
0175  89 E9				mov		ecx,ebp
0177  84 DB				test		bl,bl
0179  75 04				jne		L$15
017B  88 1A				mov		byte ptr [edx],bl
017D  EB 1A				jmp		L$17
017F				L$15:
017F  8B 04 24				mov		eax,dword ptr [esp]
0182  C6 02 00				mov		byte ptr [edx],0x00
0185  E9 4B FF FF FF			jmp		L$3
018A				L$16:
018A  8A 10				mov		dl,byte ptr [eax]
018C  89 E9				mov		ecx,ebp
018E  84 D2				test		dl,dl
0190  74 07				je		L$17
0192  89 D8				mov		eax,ebx
0194  E9 3C FF FF FF			jmp		L$3
0199				L$17:
0199  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
019D  89 02				mov		dword ptr [edx],eax
019F  89 C8				mov		eax,ecx
01A1  83 C4 04				add		esp,0x00000004
01A4  5D				pop		ebp
01A5  5F				pop		edi
01A6  5E				pop		esi
01A7  5B				pop		ebx
01A8  C3				ret		

Routine Size: 425 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

