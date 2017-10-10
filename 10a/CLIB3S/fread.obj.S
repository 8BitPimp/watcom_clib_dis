Module: fread
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001E4 bytes
0000				fread:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
000B  8B 5C 24 24			mov		ebx,dword ptr 0x24[esp]
000F  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0012  52				push		edx
0013  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0019  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
001C  83 C4 04				add		esp,0x00000004
001F  F6 C4 01				test		ah,0x01
0022  75 22				jne		L$1
0024  6A 04				push		0x00000004
0026  E8 00 00 00 00			call		__set_errno
002B  80 4B 0C 20			or		byte ptr 0xc[ebx],0x20
002F  83 C4 04				add		esp,0x00000004
0032  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0035  52				push		edx
0036  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003C  83 C4 04				add		esp,0x00000004
003F  31 C0				xor		eax,eax
0041  E9 96 01 00 00			jmp		L$19
0046				L$1:
0046  0F AF 74 24 1C			imul		esi,dword ptr 0x1c[esp]
004B  85 F6				test		esi,esi
004D  75 14				jne		L$2
004F  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0052  50				push		eax
0053  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0059  83 C4 04				add		esp,0x00000004
005C  89 F0				mov		eax,esi
005E  E9 79 01 00 00			jmp		L$19
0063				L$2:
0063  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
0067  75 09				jne		L$3
0069  53				push		ebx
006A  E8 00 00 00 00			call		__ioalloc
006F  83 C4 04				add		esp,0x00000004
0072				L$3:
0072  31 ED				xor		ebp,ebp
0074  8A 53 0C				mov		dl,byte ptr 0xc[ebx]
0077  89 2C 24				mov		dword ptr [esp],ebp
007A  F6 C2 40				test		dl,0x40
007D  0F 84 D4 00 00 00			je		L$13
0083  89 F5				mov		ebp,esi
0085				L$4:
0085  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0088  85 C0				test		eax,eax
008A  74 45				je		L$6
008C  89 C2				mov		edx,eax
008E  39 E8				cmp		eax,ebp
0090  76 02				jbe		L$5
0092  89 EA				mov		edx,ebp
0094				L$5:
0094  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0098  89 D1				mov		ecx,edx
009A  8B 33				mov		esi,dword ptr [ebx]
009C  06				push		es
009D  8C D8				mov		eax,ds
009F  8E C0				mov		es,eax
00A1  57				push		edi
00A2  89 C8				mov		eax,ecx
00A4  C1 E9 02				shr		ecx,0x02
00A7  F2 A5				repne movsd	
00A9  8A C8				mov		cl,al
00AB  80 E1 03				and		cl,0x03
00AE  F2 A4				repne movsb	
00B0  5F				pop		edi
00B1  07				pop		es
00B2  29 D5				sub		ebp,edx
00B4  8B 04 24				mov		eax,dword ptr [esp]
00B7  8D 34 17				lea		esi,[edi+edx]
00BA  8B 0B				mov		ecx,dword ptr [ebx]
00BC  89 74 24 18			mov		dword ptr 0x18[esp],esi
00C0  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
00C3  01 D1				add		ecx,edx
00C5  01 D0				add		eax,edx
00C7  29 D7				sub		edi,edx
00C9  89 0B				mov		dword ptr [ebx],ecx
00CB  89 04 24				mov		dword ptr [esp],eax
00CE  89 7B 04				mov		dword ptr 0x4[ebx],edi
00D1				L$6:
00D1  85 ED				test		ebp,ebp
00D3  0F 84 ED 00 00 00			je		L$18
00D9  3B 6B 14				cmp		ebp,dword ptr 0x14[ebx]
00DC  73 06				jae		L$7
00DE  F6 43 0D 04			test		byte ptr 0xd[ebx],0x04
00E2  74 5D				je		L$12
00E4				L$7:
00E4  8A 53 0D				mov		dl,byte ptr 0xd[ebx]
00E7  89 E8				mov		eax,ebp
00E9  F6 C2 04				test		dl,0x04
00EC  75 0D				jne		L$8
00EE  81 FD 00 02 00 00			cmp		ebp,0x00000200
00F4  76 05				jbe		L$8
00F6  80 E4 FE				and		ah,0xfe
00F9  30 C0				xor		al,al
00FB				L$8:
00FB  50				push		eax
00FC  8B 4C 24 1C			mov		ecx,dword ptr 0x1c[esp]
0100  51				push		ecx
0101  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0104  56				push		esi
0105  E8 00 00 00 00			call		__qread
010A  83 C4 0C				add		esp,0x0000000c
010D  83 F8 FF				cmp		eax,0xffffffff
0110  75 09				jne		L$9
0112  80 4B 0C 20			or		byte ptr 0xc[ebx],0x20
0116  E9 AB 00 00 00			jmp		L$18
011B				L$9:
011B  85 C0				test		eax,eax
011D  75 09				jne		L$11
011F				L$10:
011F  80 4B 0C 10			or		byte ptr 0xc[ebx],0x10
0123  E9 9E 00 00 00			jmp		L$18
0128				L$11:
0128  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
012C  8B 14 24				mov		edx,dword ptr [esp]
012F  29 C5				sub		ebp,eax
0131  01 C7				add		edi,eax
0133  01 C2				add		edx,eax
0135  89 7C 24 18			mov		dword ptr 0x18[esp],edi
0139  89 14 24				mov		dword ptr [esp],edx
013C  E9 44 FF FF FF			jmp		L$4
0141				L$12:
0141  53				push		ebx
0142  E8 00 00 00 00			call		__fill_buffer
0147  83 C4 04				add		esp,0x00000004
014A  85 C0				test		eax,eax
014C  0F 84 74 00 00 00			je		L$18
0152  E9 2E FF FF FF			jmp		L$4
0157				L$13:
0157  8B 6C 24 18			mov		ebp,dword ptr 0x18[esp]
015B  01 EE				add		esi,ebp
015D				L$14:
015D  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
0161  75 0D				jne		L$15
0163  53				push		ebx
0164  E8 00 00 00 00			call		__fill_buffer
0169  83 C4 04				add		esp,0x00000004
016C  85 C0				test		eax,eax
016E  74 56				je		L$18
0170				L$15:
0170  FF 4B 04				dec		dword ptr 0x4[ebx]
0173  8B 03				mov		eax,dword ptr [ebx]
0175  8D 50 01				lea		edx,0x1[eax]
0178  89 13				mov		dword ptr [ebx],edx
017A  8A 00				mov		al,byte ptr [eax]
017C  25 FF 00 00 00			and		eax,0x000000ff
0181  83 F8 0D				cmp		eax,0x0000000d
0184  75 28				jne		L$17
0186  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
018A  75 0D				jne		L$16
018C  53				push		ebx
018D  E8 00 00 00 00			call		__fill_buffer
0192  83 C4 04				add		esp,0x00000004
0195  85 C0				test		eax,eax
0197  74 2D				je		L$18
0199				L$16:
0199  8B 4B 04				mov		ecx,dword ptr 0x4[ebx]
019C  8B 03				mov		eax,dword ptr [ebx]
019E  49				dec		ecx
019F  8D 50 01				lea		edx,0x1[eax]
01A2  89 4B 04				mov		dword ptr 0x4[ebx],ecx
01A5  89 13				mov		dword ptr [ebx],edx
01A7  8A 00				mov		al,byte ptr [eax]
01A9  25 FF 00 00 00			and		eax,0x000000ff
01AE				L$17:
01AE  83 F8 1A				cmp		eax,0x0000001a
01B1  0F 84 68 FF FF FF			je		L$10
01B7  8B 3C 24				mov		edi,dword ptr [esp]
01BA  88 45 00				mov		byte ptr [ebp],al
01BD  47				inc		edi
01BE  45				inc		ebp
01BF  89 3C 24				mov		dword ptr [esp],edi
01C2  39 F5				cmp		ebp,esi
01C4  75 97				jne		L$14
01C6				L$18:
01C6  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
01C9  51				push		ecx
01CA  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
01D0  83 C4 04				add		esp,0x00000004
01D3  31 D2				xor		edx,edx
01D5  8B 04 24				mov		eax,dword ptr [esp]
01D8  F7 74 24 1C			div		dword ptr 0x1c[esp]
01DC				L$19:
01DC  83 C4 04				add		esp,0x00000004
01DF  5D				pop		ebp
01E0  5F				pop		edi
01E1  5E				pop		esi
01E2  5B				pop		ebx
01E3  C3				ret		

Routine Size: 484 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

