Module: setenv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000338 bytes
0000				setenv:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 10				sub		esp,0x00000010
0007  8B 54 24 24			mov		edx,dword ptr 0x24[esp]
000B  85 D2				test		edx,edx
000D  75 0A				jne		L$2
000F				L$1:
000F  B8 FF FF FF FF			mov		eax,0xffffffff
0014  E9 01 02 00 00			jmp		L$13
0019				L$2:
0019  80 3A 00				cmp		byte ptr [edx],0x00
001C  74 F1				je		L$1
001E  8B 2D 00 00 00 00			mov		ebp,dword ptr environ
0024  85 ED				test		ebp,ebp
0026  75 3C				jne		L$3
0028  83 7C 24 28 00			cmp		dword ptr 0x28[esp],0x00000000
002D  0F 84 E5 01 00 00			je		L$12
0033  6A 09				push		0x00000009
0035  E8 00 00 00 00			call		malloc
003A  83 C4 04				add		esp,0x00000004
003D  89 C5				mov		ebp,eax
003F  85 C0				test		eax,eax
0041  74 CC				je		L$1
0043  C7 00 00 00 00 00			mov		dword ptr [eax],0x00000000
0049  A3 00 00 00 00			mov		dword ptr environ,eax
004E  C7 40 04 00 00 00 00		mov		dword ptr 0x4[eax],0x00000000
0055  83 C0 08				add		eax,0x00000008
0058  31 DB				xor		ebx,ebx
005A  A3 00 00 00 00			mov		dword ptr __env_mask,eax
005F  E9 F7 00 00 00			jmp		L$7
0064				L$3:
0064  8B 5C 24 28			mov		ebx,dword ptr 0x28[esp]
0068  53				push		ebx
0069  8B 4C 24 28			mov		ecx,dword ptr 0x28[esp]
006D  51				push		ecx
006E  E8 00 00 00 00			call		findenv
0073  83 C4 08				add		esp,0x00000008
0076  85 DB				test		ebx,ebx
0078  0F 84 9A 01 00 00			je		L$12
007E  85 C0				test		eax,eax
0080  0F 8F C7 00 00 00			jg		L$6
0086  F7 D8				neg		eax
0088  89 C3				mov		ebx,eax
008A  40				inc		eax
008B  89 44 24 04			mov		dword ptr 0x4[esp],eax
008F  89 D8				mov		eax,ebx
0091  C1 E0 02				shl		eax,0x02
0094  8B 0D 00 00 00 00			mov		ecx,dword ptr __env_mask
009A  89 04 24				mov		dword ptr [esp],eax
009D  83 C0 08				add		eax,0x00000008
00A0  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
00A4  89 44 24 08			mov		dword ptr 0x8[esp],eax
00A8  01 D0				add		eax,edx
00AA  85 C9				test		ecx,ecx
00AC  75 53				jne		L$4
00AE  50				push		eax
00AF  E8 00 00 00 00			call		malloc
00B4  89 C2				mov		edx,eax
00B6  83 C4 04				add		esp,0x00000004
00B9  89 C5				mov		ebp,eax
00BB  85 C0				test		eax,eax
00BD  0F 84 4C FF FF FF			je		L$1
00C3  8B 0C 24				mov		ecx,dword ptr [esp]
00C6  8B 35 00 00 00 00			mov		esi,dword ptr environ
00CC  89 C7				mov		edi,eax
00CE  06				push		es
00CF  8C D8				mov		eax,ds
00D1  8E C0				mov		es,eax
00D3  57				push		edi
00D4  89 C8				mov		eax,ecx
00D6  C1 E9 02				shr		ecx,0x02
00D9  F2 A5				repne movsd	
00DB  8A C8				mov		cl,al
00DD  80 E1 03				and		cl,0x03
00E0  F2 A4				repne movsb	
00E2  5F				pop		edi
00E3  07				pop		es
00E4  8B 7C 24 04			mov		edi,dword ptr 0x4[esp]
00E8  57				push		edi
00E9  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00ED  6A 00				push		0x00000000
00EF  01 D0				add		eax,edx
00F1  50				push		eax
00F2  A3 00 00 00 00			mov		dword ptr __env_mask,eax
00F7  E8 00 00 00 00			call		memset
00FC  83 C4 0C				add		esp,0x0000000c
00FF  EB 31				jmp		L$5
0101				L$4:
0101  50				push		eax
0102  55				push		ebp
0103  E8 00 00 00 00			call		realloc
0108  83 C4 08				add		esp,0x00000008
010B  89 C5				mov		ebp,eax
010D  85 C0				test		eax,eax
010F  0F 84 FA FE FF FF			je		L$1
0115  53				push		ebx
0116  8B 35 00 00 00 00			mov		esi,dword ptr __env_mask
011C  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
0120  56				push		esi
0121  01 C7				add		edi,eax
0123  57				push		edi
0124  E8 00 00 00 00			call		memmove
0129  83 C4 0C				add		esp,0x0000000c
012C  89 3D 00 00 00 00			mov		dword ptr __env_mask,edi
0132				L$5:
0132  89 D8				mov		eax,ebx
0134  C7 44 85 04 00 00 00 00		mov		dword ptr 0x4[ebp+eax*4],0x00000000
013C  A1 00 00 00 00			mov		eax,dword ptr __env_mask
0141  89 2D 00 00 00 00			mov		dword ptr environ,ebp
0147  C6 04 03 00			mov		byte ptr [ebx+eax],0x00
014B  EB 0E				jmp		L$7
014D				L$6:
014D  83 7C 24 2C 00			cmp		dword ptr 0x2c[esp],0x00000000
0152  0F 84 C0 00 00 00			je		L$12
0158  8D 58 FF				lea		ebx,-0x1[eax]
015B				L$7:
015B  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
015F  06				push		es
0160  8C D8				mov		eax,ds
0162  8E C0				mov		es,eax
0164  29 C9				sub		ecx,ecx
0166  49				dec		ecx
0167  31 C0				xor		eax,eax
0169  F2 AE				repne scasb	
016B  F7 D1				not		ecx
016D  49				dec		ecx
016E  07				pop		es
016F  A1 00 00 00 00			mov		eax,dword ptr __env_mask
0174  8A 34 03				mov		dh,byte ptr [ebx+eax]
0177  89 4C 24 0C			mov		dword ptr 0xc[esp],ecx
017B  84 F6				test		dh,dh
017D  74 08				je		L$8
017F  89 DA				mov		edx,ebx
0181  8B 54 95 00			mov		edx,dword ptr [ebp+edx*4]
0185  EB 02				jmp		L$9
0187				L$8:
0187  31 D2				xor		edx,edx
0189				L$9:
0189  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
018D  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0191  06				push		es
0192  8C D8				mov		eax,ds
0194  8E C0				mov		es,eax
0196  29 C9				sub		ecx,ecx
0198  49				dec		ecx
0199  31 C0				xor		eax,eax
019B  F2 AE				repne scasb	
019D  F7 D1				not		ecx
019F  49				dec		ecx
01A0  07				pop		es
01A1  01 F1				add		ecx,esi
01A3  83 C1 02				add		ecx,0x00000002
01A6  51				push		ecx
01A7  52				push		edx
01A8  E8 00 00 00 00			call		realloc
01AD  89 C2				mov		edx,eax
01AF  83 C4 08				add		esp,0x00000008
01B2  85 C0				test		eax,eax
01B4  0F 84 55 FE FF FF			je		L$1
01BA  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
01BE  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
01C2  89 C7				mov		edi,eax
01C4  06				push		es
01C5  8C D8				mov		eax,ds
01C7  8E C0				mov		es,eax
01C9  57				push		edi
01CA  89 C8				mov		eax,ecx
01CC  C1 E9 02				shr		ecx,0x02
01CF  F2 A5				repne movsd	
01D1  8A C8				mov		cl,al
01D3  80 E1 03				and		cl,0x03
01D6  F2 A4				repne movsb	
01D8  5F				pop		edi
01D9  07				pop		es
01DA  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
01DE  8D 78 01				lea		edi,0x1[eax]
01E1  8B 74 24 28			mov		esi,dword ptr 0x28[esp]
01E5  01 D7				add		edi,edx
01E7  C6 04 02 3D			mov		byte ptr [edx+eax],0x3d
01EB  57				push		edi
01EC				L$10:
01EC  8A 06				mov		al,byte ptr [esi]
01EE  88 07				mov		byte ptr [edi],al
01F0  3C 00				cmp		al,0x00
01F2  0F 84 10 00 00 00			je		L$11
01F8  8A 46 01				mov		al,byte ptr 0x1[esi]
01FB  83 C6 02				add		esi,0x00000002
01FE  88 47 01				mov		byte ptr 0x1[edi],al
0201  83 C7 02				add		edi,0x00000002
0204  3C 00				cmp		al,0x00
0206  75 E4				jne		L$10
0208				L$11:
0208  5F				pop		edi
0209  89 D8				mov		eax,ebx
020B  89 54 85 00			mov		dword ptr [ebp+eax*4],edx
020F  A1 00 00 00 00			mov		eax,dword ptr __env_mask
0214  C6 04 03 01			mov		byte ptr [ebx+eax],0x01
0218				L$12:
0218  31 C0				xor		eax,eax
021A				L$13:
021A  83 C4 10				add		esp,0x00000010
021D  5D				pop		ebp
021E  5F				pop		edi
021F  5E				pop		esi
0220  5B				pop		ebx
0221  C3				ret		
0222				findenv:
0222  53				push		ebx
0223  56				push		esi
0224  57				push		edi
0225  55				push		ebp
0226  83 EC 08				sub		esp,0x00000008
0229  A1 00 00 00 00			mov		eax,dword ptr environ
022E  89 04 24				mov		dword ptr [esp],eax
0231  E9 DC 00 00 00			jmp		L$24
0236				L$14:
0236  8B 6C 24 1C			mov		ebp,dword ptr 0x1c[esp]
023A				L$15:
023A  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
023E  80 38 3D				cmp		byte ptr [eax],0x3d
0241  0F 85 8D 00 00 00			jne		L$22
0247  80 7D 00 00			cmp		byte ptr [ebp],0x00
024B  0F 85 83 00 00 00			jne		L$22
0251  8B 34 24				mov		esi,dword ptr [esp]
0254  2B 35 00 00 00 00			sub		esi,dword ptr environ
025A  8B 7C 24 20			mov		edi,dword ptr 0x20[esp]
025E  C1 FE 02				sar		esi,0x02
0261  85 FF				test		edi,edi
0263  0F 85 66 00 00 00			jne		L$21
0269  8B 3C 24				mov		edi,dword ptr [esp]
026C  8B 1C 24				mov		ebx,dword ptr [esp]
026F  8B 3F				mov		edi,dword ptr [edi]
0271  EB 08				jmp		L$17
0273				L$16:
0273  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0276  89 03				mov		dword ptr [ebx],eax
0278  83 C3 04				add		ebx,0x00000004
027B				L$17:
027B  83 3B 00				cmp		dword ptr [ebx],0x00000000
027E  75 F3				jne		L$16
0280  8B 15 00 00 00 00			mov		edx,dword ptr __env_mask
0286  85 D2				test		edx,edx
0288  74 4A				je		L$22
028A  89 D0				mov		eax,edx
028C  80 3C 06 00			cmp		byte ptr [esi+eax],0x00
0290  74 09				je		L$18
0292  57				push		edi
0293  E8 00 00 00 00			call		free
0298  83 C4 04				add		esp,0x00000004
029B				L$18:
029B  8B 0D 00 00 00 00			mov		ecx,dword ptr environ
02A1  89 DF				mov		edi,ebx
02A3  29 CF				sub		edi,ecx
02A5  C1 FF 02				sar		edi,0x02
02A8  57				push		edi
02A9  A1 00 00 00 00			mov		eax,dword ptr __env_mask
02AE  50				push		eax
02AF  53				push		ebx
02B0  E8 00 00 00 00			call		memmove
02B5  83 C4 0C				add		esp,0x0000000c
02B8  89 1D 00 00 00 00			mov		dword ptr __env_mask,ebx
02BE  01 F3				add		ebx,esi
02C0  EB 07				jmp		L$20
02C2				L$19:
02C2  8A 43 01				mov		al,byte ptr 0x1[ebx]
02C5  46				inc		esi
02C6  88 03				mov		byte ptr [ebx],al
02C8  43				inc		ebx
02C9				L$20:
02C9  39 FE				cmp		esi,edi
02CB  7D 07				jge		L$22
02CD  EB F3				jmp		L$19
02CF				L$21:
02CF  8D 46 01				lea		eax,0x1[esi]
02D2  EB 5C				jmp		L$25
02D4				L$22:
02D4  8B 5C 24 04			mov		ebx,dword ptr 0x4[esp]
02D8  31 C0				xor		eax,eax
02DA  8A 03				mov		al,byte ptr [ebx]
02DC  50				push		eax
02DD  E8 00 00 00 00			call		toupper
02E2  89 C3				mov		ebx,eax
02E4  31 C0				xor		eax,eax
02E6  83 C4 04				add		esp,0x00000004
02E9  8A 45 00				mov		al,byte ptr [ebp]
02EC  50				push		eax
02ED  E8 00 00 00 00			call		toupper
02F2  83 C4 04				add		esp,0x00000004
02F5  39 C3				cmp		ebx,eax
02F7  75 15				jne		L$23
02F9  80 7D 00 00			cmp		byte ptr [ebp],0x00
02FD  74 0F				je		L$23
02FF  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0303  42				inc		edx
0304  45				inc		ebp
0305  89 54 24 04			mov		dword ptr 0x4[esp],edx
0309  E9 2C FF FF FF			jmp		L$15
030E				L$23:
030E  83 04 24 04			add		dword ptr [esp],0x00000004
0312				L$24:
0312  8B 04 24				mov		eax,dword ptr [esp]
0315  8B 00				mov		eax,dword ptr [eax]
0317  89 44 24 04			mov		dword ptr 0x4[esp],eax
031B  85 C0				test		eax,eax
031D  0F 85 13 FF FF FF			jne		L$14
0323  8B 1C 24				mov		ebx,dword ptr [esp]
0326  A1 00 00 00 00			mov		eax,dword ptr environ
032B  29 D8				sub		eax,ebx
032D  C1 F8 02				sar		eax,0x02
0330				L$25:
0330  83 C4 08				add		esp,0x00000008
0333  5D				pop		ebp
0334  5F				pop		edi
0335  5E				pop		esi
0336  5B				pop		ebx
0337  C3				ret		

Routine Size: 824 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

