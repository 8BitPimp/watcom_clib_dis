Module: initargv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001D5 bytes
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
004D  89 D9				mov		ecx,ebx
004F  01 D8				add		eax,ebx
0051  89 D7				mov		edi,edx
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
00C7  83 EC 08				sub		esp,0x00000008
00CA  8B 35 00 00 00 00			mov		esi,dword ptr __historical_splitparms
00D0  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00D4  8B 7C 24 1C			mov		edi,dword ptr 0x1c[esp]
00D8  31 D2				xor		edx,edx
00DA  89 14 24				mov		dword ptr [esp],edx
00DD				L$3:
00DD  31 DB				xor		ebx,ebx
00DF  8A 18				mov		bl,byte ptr [eax]
00E1  83 FB 20				cmp		ebx,0x00000020
00E4  74 05				je		L$4
00E6  83 FB 09				cmp		ebx,0x00000009
00E9  75 03				jne		L$5
00EB				L$4:
00EB  40				inc		eax
00EC  EB EF				jmp		L$3
00EE				L$5:
00EE  84 DB				test		bl,bl
00F0  0F 84 C9 00 00 00			je		L$21
00F6  30 D2				xor		dl,dl
00F8  83 FB 22				cmp		ebx,0x00000022
00FB  75 03				jne		L$6
00FD  B2 01				mov		dl,0x01
00FF  40				inc		eax
0100				L$6:
0100  89 44 24 04			mov		dword ptr 0x4[esp],eax
0104  89 C3				mov		ebx,eax
0106				L$7:
0106  31 C9				xor		ecx,ecx
0108  8A 08				mov		cl,byte ptr [eax]
010A  83 F9 22				cmp		ecx,0x00000022
010D  75 20				jne		L$10
010F  80 FA 01				cmp		dl,0x01
0112  0F 84 76 00 00 00			je		L$18
0118  85 F6				test		esi,esi
011A  75 13				jne		L$10
011C  84 D2				test		dl,dl
011E  75 05				jne		L$9
0120  B2 02				mov		dl,0x02
0122				L$8:
0122  40				inc		eax
0123  EB E1				jmp		L$7
0125				L$9:
0125  80 FA 02				cmp		dl,0x02
0128  75 05				jne		L$10
012A  40				inc		eax
012B  30 D2				xor		dl,dl
012D  EB D7				jmp		L$7
012F				L$10:
012F  31 C9				xor		ecx,ecx
0131  8A 08				mov		cl,byte ptr [eax]
0133  83 F9 20				cmp		ecx,0x00000020
0136  74 05				je		L$11
0138  83 F9 09				cmp		ecx,0x00000009
013B  75 04				jne		L$12
013D				L$11:
013D  84 D2				test		dl,dl
013F  74 4D				je		L$18
0141				L$12:
0141  8A 30				mov		dh,byte ptr [eax]
0143  84 F6				test		dh,dh
0145  74 47				je		L$18
0147  31 C9				xor		ecx,ecx
0149  88 F1				mov		cl,dh
014B  83 F9 5C				cmp		ecx,0x0000005c
014E  75 2F				jne		L$17
0150  85 F6				test		esi,esi
0152  75 0C				jne		L$14
0154  31 C9				xor		ecx,ecx
0156  8A 48 01				mov		cl,byte ptr 0x1[eax]
0159  83 F9 22				cmp		ecx,0x00000022
015C				L$13:
015C  75 21				jne		L$17
015E  EB 1E				jmp		L$16
0160				L$14:
0160  80 FA 01				cmp		dl,0x01
0163  75 0F				jne		L$15
0165  31 C9				xor		ecx,ecx
0167  8A 48 01				mov		cl,byte ptr 0x1[eax]
016A  83 F9 22				cmp		ecx,0x00000022
016D  74 0F				je		L$16
016F  83 F9 5C				cmp		ecx,0x0000005c
0172  EB E8				jmp		L$13
0174				L$15:
0174  31 C9				xor		ecx,ecx
0176  8A 48 01				mov		cl,byte ptr 0x1[eax]
0179  83 F9 22				cmp		ecx,0x00000022
017C  75 01				jne		L$17
017E				L$16:
017E  40				inc		eax
017F				L$17:
017F  85 FF				test		edi,edi
0181  74 9F				je		L$8
0183  8A 08				mov		cl,byte ptr [eax]
0185  40				inc		eax
0186  88 0B				mov		byte ptr [ebx],cl
0188  43				inc		ebx
0189  E9 78 FF FF FF			jmp		L$7
018E				L$18:
018E  85 FF				test		edi,edi
0190  74 21				je		L$20
0192  8B 0C 24				mov		ecx,dword ptr [esp]
0195  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0199  89 14 8F				mov		dword ptr [edi+ecx*4],edx
019C  41				inc		ecx
019D  89 0C 24				mov		dword ptr [esp],ecx
01A0  8A 08				mov		cl,byte ptr [eax]
01A2  84 C9				test		cl,cl
01A4  75 04				jne		L$19
01A6  88 0B				mov		byte ptr [ebx],cl
01A8  EB 15				jmp		L$21
01AA				L$19:
01AA  40				inc		eax
01AB  C6 03 00				mov		byte ptr [ebx],0x00
01AE  E9 2A FF FF FF			jmp		L$3
01B3				L$20:
01B3  FF 04 24				inc		dword ptr [esp]
01B6  80 38 00				cmp		byte ptr [eax],0x00
01B9  0F 85 2C FF FF FF			jne		L$4
01BF				L$21:
01BF  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
01C3  89 02				mov		dword ptr [edx],eax
01C5  8B 04 24				mov		eax,dword ptr [esp]
01C8  89 35 00 00 00 00			mov		dword ptr __historical_splitparms,esi
01CE  83 C4 08				add		esp,0x00000008
01D1  5F				pop		edi
01D2  5E				pop		esi
01D3  5B				pop		ebx
01D4  C3				ret		

Routine Size: 469 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

