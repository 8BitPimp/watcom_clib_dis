Module: initargv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001A6 bytes
0000				__Init_Argv_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  55				push		ebp
0006  83 EC 08				sub		esp,0x00000008
0009  89 E3				mov		ebx,esp
000B  A1 00 00 00 00			mov		eax,dword ptr __LpCmdLine
0010  31 D2				xor		edx,edx
0012  E8 00 00 00 00			call		_SplitParms_
0017  8B 0C 24				mov		ecx,dword ptr [esp]
001A  8D 68 01				lea		ebp,0x1[eax]
001D  8B 15 00 00 00 00			mov		edx,dword ptr __LpCmdLine
0023  89 E8				mov		eax,ebp
0025  29 D1				sub		ecx,edx
0027  C1 E0 02				shl		eax,0x02
002A  41				inc		ecx
002B  89 44 24 04			mov		dword ptr 0x4[esp],eax
002F  83 C0 04				add		eax,0x00000004
0032  01 C8				add		eax,ecx
0034  E8 00 00 00 00			call		malloc_
0039  89 C2				mov		edx,eax
003B  85 C0				test		eax,eax
003D  74 5A				je		L$1
003F  8B 35 00 00 00 00			mov		esi,dword ptr __LpCmdLine
0045  01 C8				add		eax,ecx
0047  89 D7				mov		edi,edx
0049  A3 00 00 00 00			mov		dword ptr __argv,eax
004E  06				push		es
004F  8C D8				mov		eax,ds
0051  8E C0				mov		es,eax
0053  57				push		edi
0054  89 C8				mov		eax,ecx
0056  C1 E9 02				shr		ecx,0x02
0059  F2 A5				repne movsd	
005B  8A C8				mov		cl,al
005D  80 E1 03				and		cl,0x03
0060  F2 A4				repne movsb	
0062  5F				pop		edi
0063  07				pop		es
0064  8B 0D 00 00 00 00			mov		ecx,dword ptr __argv
006A  A1 00 00 00 00			mov		eax,dword ptr __LpPgmName
006F  89 E3				mov		ebx,esp
0071  89 01				mov		dword ptr [ecx],eax
0073  83 C1 04				add		ecx,0x00000004
0076  89 D0				mov		eax,edx
0078  89 CA				mov		edx,ecx
007A  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
007E  E8 00 00 00 00			call		_SplitParms_
0083  8B 15 00 00 00 00			mov		edx,dword ptr __argv
0089  01 F2				add		edx,esi
008B  89 2D 00 00 00 00			mov		dword ptr __argc,ebp
0091  C7 02 00 00 00 00			mov		dword ptr [edx],0x00000000
0097  EB 0A				jmp		L$2
0099				L$1:
0099  A3 00 00 00 00			mov		dword ptr __argv,eax
009E  A3 00 00 00 00			mov		dword ptr __argc,eax
00A3				L$2:
00A3  A1 00 00 00 00			mov		eax,dword ptr __argv
00A8  89 2D 00 00 00 00			mov		dword ptr ____Argc,ebp
00AE  A3 00 00 00 00			mov		dword ptr ____Argv,eax
00B3  83 C4 08				add		esp,0x00000008
00B6  5D				pop		ebp
00B7  5F				pop		edi
00B8  5E				pop		esi
00B9  5A				pop		edx
00BA  59				pop		ecx
00BB  5B				pop		ebx
00BC  C3				ret		
00BD				_SplitParms_:
00BD  51				push		ecx
00BE  56				push		esi
00BF  57				push		edi
00C0  55				push		ebp
00C1  83 EC 08				sub		esp,0x00000008
00C4  89 D6				mov		esi,edx
00C6  89 5C 24 04			mov		dword ptr 0x4[esp],ebx
00CA  31 C9				xor		ecx,ecx
00CC				L$3:
00CC  8A 10				mov		dl,byte ptr [eax]
00CE  80 FA 20				cmp		dl,0x20
00D1  74 05				je		L$4
00D3  80 FA 09				cmp		dl,0x09
00D6  75 03				jne		L$5
00D8				L$4:
00D8  40				inc		eax
00D9  EB F1				jmp		L$3
00DB				L$5:
00DB  84 D2				test		dl,dl
00DD  0F 84 B3 00 00 00			je		L$17
00E3  80 FA 22				cmp		dl,0x22
00E6  75 3F				jne		L$10
00E8  40				inc		eax
00E9  89 04 24				mov		dword ptr [esp],eax
00EC  89 C2				mov		edx,eax
00EE				L$6:
00EE  8A 38				mov		bh,byte ptr [eax]
00F0  80 FF 22				cmp		bh,0x22
00F3  0F 84 63 00 00 00			je		L$14
00F9  84 FF				test		bh,bh
00FB  0F 84 5B 00 00 00			je		L$14
0101  80 FF 5C				cmp		bh,0x5c
0104  75 0D				jne		L$8
0106  8A 58 01				mov		bl,byte ptr 0x1[eax]
0109  80 FB 22				cmp		bl,0x22
010C  74 04				je		L$7
010E  38 FB				cmp		bl,bh
0110  75 01				jne		L$8
0112				L$7:
0112  40				inc		eax
0113				L$8:
0113  8D 58 01				lea		ebx,0x1[eax]
0116  85 F6				test		esi,esi
0118  74 09				je		L$9
011A  8A 00				mov		al,byte ptr [eax]
011C  88 02				mov		byte ptr [edx],al
011E  89 D8				mov		eax,ebx
0120  42				inc		edx
0121  EB CB				jmp		L$6
0123				L$9:
0123  89 D8				mov		eax,ebx
0125  EB C7				jmp		L$6
0127				L$10:
0127  89 04 24				mov		dword ptr [esp],eax
012A  89 C2				mov		edx,eax
012C				L$11:
012C  8A 18				mov		bl,byte ptr [eax]
012E  84 DB				test		bl,bl
0130  74 2A				je		L$14
0132  80 FB 20				cmp		bl,0x20
0135  74 25				je		L$14
0137  80 FB 09				cmp		bl,0x09
013A  74 20				je		L$14
013C  80 FB 5C				cmp		bl,0x5c
013F  75 07				jne		L$12
0141  80 78 01 22			cmp		byte ptr 0x1[eax],0x22
0145  75 01				jne		L$12
0147  40				inc		eax
0148				L$12:
0148  8D 58 01				lea		ebx,0x1[eax]
014B  85 F6				test		esi,esi
014D  74 09				je		L$13
014F  8A 00				mov		al,byte ptr [eax]
0151  88 02				mov		byte ptr [edx],al
0153  89 D8				mov		eax,ebx
0155  42				inc		edx
0156  EB D4				jmp		L$11
0158				L$13:
0158  89 D8				mov		eax,ebx
015A  EB D0				jmp		L$11
015C				L$14:
015C  8D 68 01				lea		ebp,0x1[eax]
015F  8D 79 01				lea		edi,0x1[ecx]
0162  85 F6				test		esi,esi
0164  74 21				je		L$16
0166  C1 E1 02				shl		ecx,0x02
0169  8D 1C 0E				lea		ebx,[esi+ecx]
016C  8B 0C 24				mov		ecx,dword ptr [esp]
016F  89 0B				mov		dword ptr [ebx],ecx
0171  8A 18				mov		bl,byte ptr [eax]
0173  89 F9				mov		ecx,edi
0175  84 DB				test		bl,bl
0177  75 04				jne		L$15
0179  88 1A				mov		byte ptr [edx],bl
017B  EB 19				jmp		L$17
017D				L$15:
017D  89 E8				mov		eax,ebp
017F  C6 02 00				mov		byte ptr [edx],0x00
0182  E9 45 FF FF FF			jmp		L$3
0187				L$16:
0187  8A 10				mov		dl,byte ptr [eax]
0189  89 F9				mov		ecx,edi
018B  84 D2				test		dl,dl
018D  74 07				je		L$17
018F  89 E8				mov		eax,ebp
0191  E9 36 FF FF FF			jmp		L$3
0196				L$17:
0196  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
019A  89 02				mov		dword ptr [edx],eax
019C  89 C8				mov		eax,ecx
019E  83 C4 08				add		esp,0x00000008
01A1  5D				pop		ebp
01A2  5F				pop		edi
01A3  5E				pop		esi
01A4  59				pop		ecx
01A5  C3				ret		

Routine Size: 422 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

