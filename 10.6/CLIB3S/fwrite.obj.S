Module: fwrite
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000212 bytes
0000				fwrite:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
000B  8B 5C 24 2C			mov		ebx,dword ptr 0x2c[esp]
000F  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0012  52				push		edx
0013  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0019  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
001C  83 C4 04				add		esp,0x00000004
001F  F6 C4 02				test		ah,0x02
0022  75 27				jne		L$1
0024  6A 04				push		0x00000004
0026  E8 00 00 00 00			call		__set_errno
002B  83 C4 04				add		esp,0x00000004
002E  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0031  8B 53 10				mov		edx,dword ptr 0x10[ebx]
0034  80 CC 20				or		ah,0x20
0037  52				push		edx
0038  88 63 0C				mov		byte ptr 0xc[ebx],ah
003B  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
0041  83 C4 04				add		esp,0x00000004
0044  31 C0				xor		eax,eax
0046  E9 BF 01 00 00			jmp		L$16
004B				L$1:
004B  0F AF 7C 24 24			imul		edi,dword ptr 0x24[esp]
0050  85 FF				test		edi,edi
0052  75 14				jne		L$2
0054  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0057  50				push		eax
0058  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
005E  83 C4 04				add		esp,0x00000004
0061  89 F8				mov		eax,edi
0063  E9 A2 01 00 00			jmp		L$16
0068				L$2:
0068  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
006C  75 09				jne		L$3
006E  53				push		ebx
006F  E8 00 00 00 00			call		__ioalloc
0074  83 C4 04				add		esp,0x00000004
0077				L$3:
0077  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
007A  8A 53 0C				mov		dl,byte ptr 0xc[ebx]
007D  31 ED				xor		ebp,ebp
007F  83 E0 30				and		eax,0x00000030
0082  80 E2 CF				and		dl,0xcf
0085  89 6C 24 04			mov		dword ptr 0x4[esp],ebp
0089  89 04 24				mov		dword ptr [esp],eax
008C  88 53 0C				mov		byte ptr 0xc[ebx],dl
008F  F6 C2 40				test		dl,0x40
0092  0F 84 E2 00 00 00			je		L$11
0098  89 7C 24 08			mov		dword ptr 0x8[esp],edi
009C				L$4:
009C  83 7B 04 00			cmp		dword ptr 0x4[ebx],0x00000000
00A0  75 4A				jne		L$7
00A2  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00A6  3B 43 14				cmp		eax,dword ptr 0x14[ebx]
00A9  72 41				jb		L$7
00AB  30 C0				xor		al,al
00AD  80 E4 FE				and		ah,0xfe
00B0  85 C0				test		eax,eax
00B2  75 04				jne		L$5
00B4  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00B8				L$5:
00B8  50				push		eax
00B9  8B 74 24 24			mov		esi,dword ptr 0x24[esp]
00BD  56				push		esi
00BE  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
00C1  57				push		edi
00C2  E8 00 00 00 00			call		__qwrite
00C7  83 C4 0C				add		esp,0x0000000c
00CA  89 C5				mov		ebp,eax
00CC  83 F8 FF				cmp		eax,0xffffffff
00CF  74 15				je		L$6
00D1  85 C0				test		eax,eax
00D3  0F 85 71 00 00 00			jne		L$10
00D9  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
00DF  C7 40 04 0C 00 00 00		mov		dword ptr 0x4[eax],0x0000000c
00E6				L$6:
00E6  80 4B 0C 20			or		byte ptr 0xc[ebx],0x20
00EA  EB 5E				jmp		L$10
00EC				L$7:
00EC  8B 6B 14				mov		ebp,dword ptr 0x14[ebx]
00EF  8B 73 04				mov		esi,dword ptr 0x4[ebx]
00F2  8B 7C 24 08			mov		edi,dword ptr 0x8[esp]
00F6  29 F5				sub		ebp,esi
00F8  39 FD				cmp		ebp,edi
00FA  76 02				jbe		L$8
00FC  89 FD				mov		ebp,edi
00FE				L$8:
00FE  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
0102  89 E9				mov		ecx,ebp
0104  8B 3B				mov		edi,dword ptr [ebx]
0106  06				push		es
0107  8C D8				mov		eax,ds
0109  8E C0				mov		es,eax
010B  57				push		edi
010C  89 C8				mov		eax,ecx
010E  C1 E9 02				shr		ecx,0x02
0111  F2 A5				repne movsd	
0113  8A C8				mov		cl,al
0115  80 E1 03				and		cl,0x03
0118  F2 A4				repne movsb	
011A  5F				pop		edi
011B  07				pop		es
011C  8B 03				mov		eax,dword ptr [ebx]
011E  8B 53 04				mov		edx,dword ptr 0x4[ebx]
0121  8A 6B 0D				mov		ch,byte ptr 0xd[ebx]
0124  01 E8				add		eax,ebp
0126  01 EA				add		edx,ebp
0128  89 03				mov		dword ptr [ebx],eax
012A  80 CD 10				or		ch,0x10
012D  89 53 04				mov		dword ptr 0x4[ebx],edx
0130  88 6B 0D				mov		byte ptr 0xd[ebx],ch
0133  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0136  3B 43 14				cmp		eax,dword ptr 0x14[ebx]
0139  74 06				je		L$9
013B  F6 43 0D 04			test		byte ptr 0xd[ebx],0x04
013F  74 09				je		L$10
0141				L$9:
0141  53				push		ebx
0142  E8 00 00 00 00			call		__flush
0147  83 C4 04				add		esp,0x00000004
014A				L$10:
014A  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
014E  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0152  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0156  01 E8				add		eax,ebp
0158  01 EA				add		edx,ebp
015A  89 44 24 20			mov		dword ptr 0x20[esp],eax
015E  89 54 24 04			mov		dword ptr 0x4[esp],edx
0162  29 E9				sub		ecx,ebp
0164  89 4C 24 08			mov		dword ptr 0x8[esp],ecx
0168  0F 84 6E 00 00 00			je		L$14
016E  F6 43 0C 20			test		byte ptr 0xc[ebx],0x20
0172  0F 84 24 FF FF FF			je		L$4
0178  EB 62				jmp		L$14
017A				L$11:
017A  8A 4B 0D				mov		cl,byte ptr 0xd[ebx]
017D  F6 C1 04				test		cl,0x04
0180  74 11				je		L$12
0182  88 CD				mov		ch,cl
0184  80 E5 FA				and		ch,0xfa
0187  88 E8				mov		al,ch
0189  0C 01				or		al,0x01
018B  BD 01 00 00 00			mov		ebp,0x00000001
0190  88 43 0D				mov		byte ptr 0xd[ebx],al
0193				L$12:
0193  8B 54 24 20			mov		edx,dword ptr 0x20[esp]
0197  31 C0				xor		eax,eax
0199  53				push		ebx
019A  8A 02				mov		al,byte ptr [edx]
019C  8D 4A 01				lea		ecx,0x1[edx]
019F  50				push		eax
01A0  89 4C 24 28			mov		dword ptr 0x28[esp],ecx
01A4  E8 00 00 00 00			call		fputc
01A9  8A 53 0C				mov		dl,byte ptr 0xc[ebx]
01AC  83 C4 08				add		esp,0x00000008
01AF  F6 C2 30				test		dl,0x30
01B2  75 0D				jne		L$13
01B4  8B 74 24 04			mov		esi,dword ptr 0x4[esp]
01B8  46				inc		esi
01B9  89 74 24 04			mov		dword ptr 0x4[esp],esi
01BD  39 F7				cmp		edi,esi
01BF  75 D2				jne		L$12
01C1				L$13:
01C1  85 ED				test		ebp,ebp
01C3  74 17				je		L$14
01C5  8A 73 0D				mov		dh,byte ptr 0xd[ebx]
01C8  80 E6 FA				and		dh,0xfa
01CB  88 F1				mov		cl,dh
01CD  80 C9 04				or		cl,0x04
01D0  53				push		ebx
01D1  88 4B 0D				mov		byte ptr 0xd[ebx],cl
01D4  E8 00 00 00 00			call		__flush
01D9  83 C4 04				add		esp,0x00000004
01DC				L$14:
01DC  F6 43 0C 20			test		byte ptr 0xc[ebx],0x20
01E0  74 06				je		L$15
01E2  31 FF				xor		edi,edi
01E4  89 7C 24 04			mov		dword ptr 0x4[esp],edi
01E8				L$15:
01E8  8B 04 24				mov		eax,dword ptr [esp]
01EB  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
01EE  09 C5				or		ebp,eax
01F0  8B 43 10				mov		eax,dword ptr 0x10[ebx]
01F3  50				push		eax
01F4  89 6B 0C				mov		dword ptr 0xc[ebx],ebp
01F7  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
01FD  83 C4 04				add		esp,0x00000004
0200  31 D2				xor		edx,edx
0202  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0206  F7 74 24 24			div		dword ptr 0x24[esp]
020A				L$16:
020A  83 C4 0C				add		esp,0x0000000c
020D  5D				pop		ebp
020E  5F				pop		edi
020F  5E				pop		esi
0210  5B				pop		ebx
0211  C3				ret		

Routine Size: 530 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

