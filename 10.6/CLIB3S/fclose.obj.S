Module: fclose
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001B6 bytes
0000				fclose:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  FF 15 00 00 00 00			call		dword ptr _AccessIOB
000B  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
0010				L$1:
0010  85 C0				test		eax,eax
0012  75 0D				jne		L$2
0014  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
001A  B8 FF FF FF FF			mov		eax,0xffffffff
001F  5B				pop		ebx
0020  C3				ret		
0021				L$2:
0021  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
0024  74 04				je		L$3
0026  8B 00				mov		eax,dword ptr [eax]
0028  EB E6				jmp		L$1
002A				L$3:
002A  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
0030  6A 01				push		0x00000001
0032  53				push		ebx
0033  E8 00 00 00 00			call		__shutdown_stream
0038  83 C4 08				add		esp,0x00000008
003B  5B				pop		ebx
003C  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0000

003D				__shutdown_stream:
003D  53				push		ebx
003E  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0042  52				push		edx
0043  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0047  53				push		ebx
0048  E8 00 00 00 00			call		__doclose
004D  83 C4 08				add		esp,0x00000008
0050  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
0054  51				push		ecx
0055  89 C3				mov		ebx,eax
0057  E8 00 00 00 00			call		__freefp
005C  83 C4 04				add		esp,0x00000004
005F  89 D8				mov		eax,ebx
0061  5B				pop		ebx
0062  C3				ret		
0063				__hex:
0063  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0067  83 C0 30				add		eax,0x00000030
006A  83 F8 39				cmp		eax,0x00000039
006D  7E 03				jle		L$4
006F  83 C0 27				add		eax,0x00000027
0072				L$4:
0072  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 003D

0073				__MkTmpFile:
0073  53				push		ebx
0074  56				push		esi
0075  57				push		edi
0076  55				push		ebp
0077  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
007B  E8 00 00 00 00			call		getpid
0080  89 C6				mov		esi,eax
0082  8D 5F 04				lea		ebx,0x4[edi]
0085  C6 07 74				mov		byte ptr [edi],0x74
0088  89 FD				mov		ebp,edi
008A				L$5:
008A  89 F0				mov		eax,esi
008C  83 E0 0F				and		eax,0x0000000f
008F  50				push		eax
0090  C1 EE 04				shr		esi,0x04
0093  E8 00 00 00 00			call		__hex
0098  88 03				mov		byte ptr [ebx],al
009A  4B				dec		ebx
009B  83 C4 04				add		esp,0x00000004
009E  39 EB				cmp		ebx,ebp
00A0  75 E8				jne		L$5
00A2  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00A6  C1 F8 04				sar		eax,0x04
00A9  83 E0 0F				and		eax,0x0000000f
00AC  50				push		eax
00AD  C6 47 05 5F			mov		byte ptr 0x5[edi],0x5f
00B1  E8 00 00 00 00			call		__hex
00B6  83 C4 04				add		esp,0x00000004
00B9  88 47 06				mov		byte ptr 0x6[edi],al
00BC  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00C0  83 E0 0F				and		eax,0x0000000f
00C3  50				push		eax
00C4  E8 00 00 00 00			call		__hex
00C9  C6 47 08 2E			mov		byte ptr 0x8[edi],0x2e
00CD  C6 47 09 74			mov		byte ptr 0x9[edi],0x74
00D1  C6 47 0A 6D			mov		byte ptr 0xa[edi],0x6d
00D5  C6 47 0B 70			mov		byte ptr 0xb[edi],0x70
00D9  C6 47 0C 00			mov		byte ptr 0xc[edi],0x00
00DD  83 C4 04				add		esp,0x00000004
00E0  88 47 07				mov		byte ptr 0x7[edi],al
00E3  5D				pop		ebp
00E4  5F				pop		edi
00E5  5E				pop		esi
00E6  5B				pop		ebx
00E7  C3				ret		

Routine Size: 117 bytes,    Routine Base: _TEXT + 0073

00E8				__doclose:
00E8  53				push		ebx
00E9  56				push		esi
00EA  57				push		edi
00EB  83 EC 10				sub		esp,0x00000010
00EE  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
00F2  83 7B 0C 00			cmp		dword ptr 0xc[ebx],0x00000000
00F6  75 0A				jne		L$6
00F8  BE FF FF FF FF			mov		esi,0xffffffff
00FD  E9 AB 00 00 00			jmp		L$12
0102				L$6:
0102  8A 63 0D				mov		ah,byte ptr 0xd[ebx]
0105  31 F6				xor		esi,esi
0107  F6 C4 10				test		ah,0x10
010A  74 0B				je		L$7
010C  53				push		ebx
010D  E8 00 00 00 00			call		__flush
0112  83 C4 04				add		esp,0x00000004
0115  89 C6				mov		esi,eax
0117				L$7:
0117  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
011A  51				push		ecx
011B  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0121  83 C4 04				add		esp,0x00000004
0124  53				push		ebx
0125  E8 00 00 00 00			call		ftell
012A  83 C4 04				add		esp,0x00000004
012D  83 F8 FF				cmp		eax,0xffffffff
0130  74 0F				je		L$8
0132  6A 00				push		0x00000000
0134  50				push		eax
0135  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
0138  57				push		edi
0139  E8 00 00 00 00			call		lseek
013E  83 C4 0C				add		esp,0x0000000c
0141				L$8:
0141  83 7C 24 24 00			cmp		dword ptr 0x24[esp],0x00000000
0146  74 0E				je		L$9
0148  8B 43 10				mov		eax,dword ptr 0x10[ebx]
014B  50				push		eax
014C  E8 00 00 00 00			call		__close
0151  83 C4 04				add		esp,0x00000004
0154  09 C6				or		esi,eax
0156				L$9:
0156  F6 43 0C 08			test		byte ptr 0xc[ebx],0x08
015A  74 13				je		L$10
015C  8B 53 08				mov		edx,dword ptr 0x8[ebx]
015F  52				push		edx
0160  E8 00 00 00 00			call		free
0165  83 C4 04				add		esp,0x00000004
0168  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
016F				L$10:
016F  F6 43 0D 08			test		byte ptr 0xd[ebx],0x08
0173  74 1E				je		L$11
0175  31 C0				xor		eax,eax
0177  8A 43 19				mov		al,byte ptr 0x19[ebx]
017A  50				push		eax
017B  8D 44 24 04			lea		eax,0x4[esp]
017F  50				push		eax
0180  E8 00 00 00 00			call		__MkTmpFile
0185  83 C4 08				add		esp,0x00000008
0188  89 E0				mov		eax,esp
018A  50				push		eax
018B  E8 00 00 00 00			call		remove
0190  83 C4 04				add		esp,0x00000004
0193				L$11:
0193  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0196  51				push		ecx
0197  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
019D  83 C4 04				add		esp,0x00000004
01A0  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
01A3  57				push		edi
01A4  FF 15 00 00 00 00			call		dword ptr _FiniAccessH
01AA  83 C4 04				add		esp,0x00000004
01AD				L$12:
01AD  89 F0				mov		eax,esi
01AF  83 C4 10				add		esp,0x00000010
01B2  5F				pop		edi
01B3  5E				pop		esi
01B4  5B				pop		ebx
01B5  C3				ret		

Routine Size: 206 bytes,    Routine Base: _TEXT + 00E8

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

