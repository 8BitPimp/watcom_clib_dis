Module: putenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000268 bytes
0000				putenv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 08				sub		esp,0x00000008
0007  8B 54 24 1C			mov		edx,dword ptr 0x1c[esp]
000B  85 D2				test		edx,edx
000D  75 0A				jne		L$2
000F				L$1:
000F  B8 FF FF FF FF			mov		eax,0xffffffff
0014  E9 4C 01 00 00			jmp		L$12
0019				L$2:
0019  89 D0				mov		eax,edx
001B  EB 0A				jmp		L$4
001D				L$3:
001D  31 D2				xor		edx,edx
001F  8A 10				mov		dl,byte ptr [eax]
0021  83 FA 3D				cmp		edx,0x0000003d
0024  74 06				je		L$5
0026  40				inc		eax
0027				L$4:
0027  80 38 00				cmp		byte ptr [eax],0x00
002A  75 F1				jne		L$3
002C				L$5:
002C  80 38 00				cmp		byte ptr [eax],0x00
002F  74 DE				je		L$1
0031  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
0035  0F 94 C0				sete		al
0038  8B 1D 00 00 00 00			mov		ebx,dword ptr environ
003E  0F B6 E8				movzx		ebp,al
0041  85 DB				test		ebx,ebx
0043  75 2F				jne		L$6
0045  85 ED				test		ebp,ebp
0047  0F 85 16 01 00 00			jne		L$11
004D  6A 09				push		0x00000009
004F  E8 00 00 00 00			call		malloc
0054  83 C4 04				add		esp,0x00000004
0057  89 C3				mov		ebx,eax
0059  85 C0				test		eax,eax
005B  74 B2				je		L$1
005D  A3 00 00 00 00			mov		dword ptr environ,eax
0062  89 28				mov		dword ptr [eax],ebp
0064  83 C0 08				add		eax,0x00000008
0067  89 68 FC				mov		dword ptr -0x4[eax],ebp
006A  A3 00 00 00 00			mov		dword ptr __env_mask,eax
006F  E9 D9 00 00 00			jmp		L$10
0074				L$6:
0074  55				push		ebp
0075  8B 4C 24 20			mov		ecx,dword ptr 0x20[esp]
0079  51				push		ecx
007A  E8 00 00 00 00			call		findenv
007F  83 C4 08				add		esp,0x00000008
0082  85 ED				test		ebp,ebp
0084  0F 85 D9 00 00 00			jne		L$11
008A  85 C0				test		eax,eax
008C  0F 8F B8 00 00 00			jg		L$9
0092  F7 D8				neg		eax
0094  89 C5				mov		ebp,eax
0096  8B 15 00 00 00 00			mov		edx,dword ptr __env_mask
009C  89 EE				mov		esi,ebp
009E  40				inc		eax
009F  C1 E6 02				shl		esi,0x02
00A2  89 04 24				mov		dword ptr [esp],eax
00A5  8D 46 08				lea		eax,0x8[esi]
00A8  8B 3C 24				mov		edi,dword ptr [esp]
00AB  89 44 24 04			mov		dword ptr 0x4[esp],eax
00AF  01 F8				add		eax,edi
00B1  85 D2				test		edx,edx
00B3  75 52				jne		L$7
00B5  50				push		eax
00B6  E8 00 00 00 00			call		malloc
00BB  89 C2				mov		edx,eax
00BD  83 C4 04				add		esp,0x00000004
00C0  89 C3				mov		ebx,eax
00C2  85 C0				test		eax,eax
00C4  0F 84 45 FF FF FF			je		L$1
00CA  A1 00 00 00 00			mov		eax,dword ptr environ
00CF  89 F1				mov		ecx,esi
00D1  89 D7				mov		edi,edx
00D3  89 C6				mov		esi,eax
00D5  06				push		es
00D6  8C D8				mov		eax,ds
00D8  8E C0				mov		es,eax
00DA  57				push		edi
00DB  89 C8				mov		eax,ecx
00DD  C1 E9 02				shr		ecx,0x02
00E0  F2 A5				repne movsd	
00E2  8A C8				mov		cl,al
00E4  80 E1 03				and		cl,0x03
00E7  F2 A4				repne movsb	
00E9  5F				pop		edi
00EA  07				pop		es
00EB  8B 34 24				mov		esi,dword ptr [esp]
00EE  56				push		esi
00EF  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00F3  6A 00				push		0x00000000
00F5  01 D0				add		eax,edx
00F7  50				push		eax
00F8  A3 00 00 00 00			mov		dword ptr __env_mask,eax
00FD  E8 00 00 00 00			call		memset
0102  83 C4 0C				add		esp,0x0000000c
0105  EB 31				jmp		L$8
0107				L$7:
0107  50				push		eax
0108  53				push		ebx
0109  E8 00 00 00 00			call		realloc
010E  83 C4 08				add		esp,0x00000008
0111  89 C3				mov		ebx,eax
0113  85 C0				test		eax,eax
0115  0F 84 F4 FE FF FF			je		L$1
011B  55				push		ebp
011C  8B 0D 00 00 00 00			mov		ecx,dword ptr __env_mask
0122  8B 74 24 08			mov		esi,dword ptr 0x8[esp]
0126  51				push		ecx
0127  01 C6				add		esi,eax
0129  56				push		esi
012A  E8 00 00 00 00			call		memmove
012F  83 C4 0C				add		esp,0x0000000c
0132  89 35 00 00 00 00			mov		dword ptr __env_mask,esi
0138				L$8:
0138  89 E8				mov		eax,ebp
013A  89 1D 00 00 00 00			mov		dword ptr environ,ebx
0140  C7 44 83 04 00 00 00 00		mov		dword ptr 0x4[ebx+eax*4],0x00000000
0148  EB 03				jmp		L$10
014A				L$9:
014A  8D 68 FF				lea		ebp,-0x1[eax]
014D				L$10:
014D  89 E8				mov		eax,ebp
014F  C1 E0 02				shl		eax,0x02
0152  01 C3				add		ebx,eax
0154  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
0158  89 03				mov		dword ptr [ebx],eax
015A  A1 00 00 00 00			mov		eax,dword ptr __env_mask
015F  C6 04 28 00			mov		byte ptr [eax+ebp],0x00
0163				L$11:
0163  31 C0				xor		eax,eax
0165				L$12:
0165  83 C4 08				add		esp,0x00000008
0168  5D				pop		ebp
0169  5F				pop		edi
016A  5E				pop		esi
016B  5B				pop		ebx
016C  C3				ret		
016D				findenv:
016D  53				push		ebx
016E  56				push		esi
016F  57				push		edi
0170  55				push		ebp
0171  8B 2D 00 00 00 00			mov		ebp,dword ptr environ
0177  E9 D2 00 00 00			jmp		L$25
017C				L$13:
017C  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0180  E9 BD 00 00 00			jmp		L$23
0185				L$14:
0185  31 C0				xor		eax,eax
0187  8A 03				mov		al,byte ptr [ebx]
0189  50				push		eax
018A  E8 00 00 00 00			call		toupper
018F  89 C7				mov		edi,eax
0191  31 C0				xor		eax,eax
0193  83 C4 04				add		esp,0x00000004
0196  8A 06				mov		al,byte ptr [esi]
0198  50				push		eax
0199  E8 00 00 00 00			call		toupper
019E  83 C4 04				add		esp,0x00000004
01A1  39 C7				cmp		edi,eax
01A3  0F 85 A2 00 00 00			jne		L$24
01A9  31 C0				xor		eax,eax
01AB  8A 03				mov		al,byte ptr [ebx]
01AD  83 F8 3D				cmp		eax,0x0000003d
01B0  0F 85 8A 00 00 00			jne		L$22
01B6  8B 15 00 00 00 00			mov		edx,dword ptr environ
01BC  89 EE				mov		esi,ebp
01BE  29 D6				sub		esi,edx
01C0  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
01C4  C1 FE 02				sar		esi,0x02
01C7  85 DB				test		ebx,ebx
01C9  0F 84 69 00 00 00			je		L$21
01CF  89 EB				mov		ebx,ebp
01D1  8B 7D 00				mov		edi,dword ptr [ebp]
01D4  EB 08				jmp		L$16
01D6				L$15:
01D6  8B 43 04				mov		eax,dword ptr 0x4[ebx]
01D9  89 03				mov		dword ptr [ebx],eax
01DB  83 C3 04				add		ebx,0x00000004
01DE				L$16:
01DE  83 3B 00				cmp		dword ptr [ebx],0x00000000
01E1  75 F3				jne		L$15
01E3  8B 2D 00 00 00 00			mov		ebp,dword ptr __env_mask
01E9  85 ED				test		ebp,ebp
01EB  74 44				je		L$20
01ED  89 E8				mov		eax,ebp
01EF  80 3C 06 00			cmp		byte ptr [esi+eax],0x00
01F3  74 09				je		L$17
01F5  57				push		edi
01F6  E8 00 00 00 00			call		free
01FB  83 C4 04				add		esp,0x00000004
01FE				L$17:
01FE  A1 00 00 00 00			mov		eax,dword ptr environ
0203  89 DF				mov		edi,ebx
0205  29 C7				sub		edi,eax
0207  C1 FF 02				sar		edi,0x02
020A  57				push		edi
020B  8B 15 00 00 00 00			mov		edx,dword ptr __env_mask
0211  52				push		edx
0212  53				push		ebx
0213  E8 00 00 00 00			call		memmove
0218  83 C4 0C				add		esp,0x0000000c
021B  89 1D 00 00 00 00			mov		dword ptr __env_mask,ebx
0221  8D 04 1E				lea		eax,[esi+ebx]
0224  EB 07				jmp		L$19
0226				L$18:
0226  8A 58 01				mov		bl,byte ptr 0x1[eax]
0229  46				inc		esi
022A  88 18				mov		byte ptr [eax],bl
022C  40				inc		eax
022D				L$19:
022D  39 FE				cmp		esi,edi
022F  7C F5				jl		L$18
0231				L$20:
0231  31 C0				xor		eax,eax
0233  5D				pop		ebp
0234  5F				pop		edi
0235  5E				pop		esi
0236  5B				pop		ebx
0237  C3				ret		
0238				L$21:
0238  8D 46 01				lea		eax,0x1[esi]
023B  5D				pop		ebp
023C  5F				pop		edi
023D  5E				pop		esi
023E  5B				pop		ebx
023F  C3				ret		
0240				L$22:
0240  43				inc		ebx
0241  46				inc		esi
0242				L$23:
0242  80 3E 00				cmp		byte ptr [esi],0x00
0245  0F 85 3A FF FF FF			jne		L$14
024B				L$24:
024B  83 C5 04				add		ebp,0x00000004
024E				L$25:
024E  8B 5D 00				mov		ebx,dword ptr [ebp]
0251  85 DB				test		ebx,ebx
0253  0F 85 23 FF FF FF			jne		L$13
0259  A1 00 00 00 00			mov		eax,dword ptr environ
025E  29 E8				sub		eax,ebp
0260  C1 F8 02				sar		eax,0x02
0263  5D				pop		ebp
0264  5F				pop		edi
0265  5E				pop		esi
0266  5B				pop		ebx
0267  C3				ret		

Routine Size: 616 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

