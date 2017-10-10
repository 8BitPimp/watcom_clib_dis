Module: fclose
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000016C bytes
0000				fclose_:
0000  53				push		ebx
0001  52				push		edx
0002  89 C2				mov		edx,eax
0004  FF 15 00 00 00 00			call		dword ptr __AccessIOB
000A  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
000F				L$1:
000F  85 C0				test		eax,eax
0011  75 08				jne		L$2
0013  B8 FF FF FF FF			mov		eax,0xffffffff
0018  5A				pop		edx
0019  5B				pop		ebx
001A  C3				ret		
001B				L$2:
001B  8B 58 04				mov		ebx,dword ptr 0x4[eax]
001E  39 DA				cmp		edx,ebx
0020  74 04				je		L$3
0022  8B 00				mov		eax,dword ptr [eax]
0024  EB E9				jmp		L$1
0026				L$3:
0026  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
002C  BA 01 00 00 00			mov		edx,0x00000001
0031  89 D8				mov		eax,ebx
0033  E8 00 00 00 00			call		__shutdown_stream_
0038  5A				pop		edx
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

003B				__shutdown_stream_:
003B  53				push		ebx
003C  89 C3				mov		ebx,eax
003E  E8 00 00 00 00			call		__doclose_
0043  89 C2				mov		edx,eax
0045  89 D8				mov		eax,ebx
0047  E8 00 00 00 00			call		__freefp_
004C  89 D0				mov		eax,edx
004E  5B				pop		ebx
004F  C3				ret		
0050				__hex_:
0050  83 C0 30				add		eax,0x00000030
0053  83 F8 39				cmp		eax,0x00000039
0056  7E 03				jle		L$4
0058  83 C0 27				add		eax,0x00000027
005B				L$4:
005B  C3				ret		

Routine Size: 33 bytes,    Routine Base: _TEXT + 003B

005C				__MkTmpFile_:
005C  53				push		ebx
005D  51				push		ecx
005E  56				push		esi
005F  57				push		edi
0060  89 C1				mov		ecx,eax
0062  89 D7				mov		edi,edx
0064  E8 00 00 00 00			call		getpid_
0069  BA 04 00 00 00			mov		edx,0x00000004
006E  89 C3				mov		ebx,eax
0070  89 CE				mov		esi,ecx
0072  C6 01 74				mov		byte ptr [ecx],0x74
0075  01 CA				add		edx,ecx
0077				L$5:
0077  89 D8				mov		eax,ebx
0079  83 E0 0F				and		eax,0x0000000f
007C  E8 00 00 00 00			call		__hex_
0081  88 02				mov		byte ptr [edx],al
0083  4A				dec		edx
0084  C1 EB 04				shr		ebx,0x04
0087  39 F2				cmp		edx,esi
0089  75 EC				jne		L$5
008B  89 F8				mov		eax,edi
008D  C1 F8 04				sar		eax,0x04
0090  83 E0 0F				and		eax,0x0000000f
0093  C6 41 05 5F			mov		byte ptr 0x5[ecx],0x5f
0097  E8 00 00 00 00			call		__hex_
009C  88 41 06				mov		byte ptr 0x6[ecx],al
009F  89 F8				mov		eax,edi
00A1  83 E0 0F				and		eax,0x0000000f
00A4  E8 00 00 00 00			call		__hex_
00A9  C6 41 08 2E			mov		byte ptr 0x8[ecx],0x2e
00AD  C6 41 09 74			mov		byte ptr 0x9[ecx],0x74
00B1  C6 41 0A 6D			mov		byte ptr 0xa[ecx],0x6d
00B5  C6 41 0B 70			mov		byte ptr 0xb[ecx],0x70
00B9  C6 41 0C 00			mov		byte ptr 0xc[ecx],0x00
00BD  88 41 07				mov		byte ptr 0x7[ecx],al
00C0  5F				pop		edi
00C1  5E				pop		esi
00C2  59				pop		ecx
00C3  5B				pop		ebx
00C4  C3				ret		

Routine Size: 105 bytes,    Routine Base: _TEXT + 005C

00C5				__doclose_:
00C5  53				push		ebx
00C6  51				push		ecx
00C7  56				push		esi
00C8  57				push		edi
00C9  83 EC 10				sub		esp,0x00000010
00CC  89 C1				mov		ecx,eax
00CE  89 D7				mov		edi,edx
00D0  83 78 0C 00			cmp		dword ptr 0xc[eax],0x00000000
00D4  75 0A				jne		L$6
00D6  BE FF FF FF FF			mov		esi,0xffffffff
00DB  E9 82 00 00 00			jmp		L$12
00E0				L$6:
00E0  8A 60 0D				mov		ah,byte ptr 0xd[eax]
00E3  31 F6				xor		esi,esi
00E5  F6 C4 10				test		ah,0x10
00E8  74 09				je		L$7
00EA  89 C8				mov		eax,ecx
00EC  E8 00 00 00 00			call		__flush_
00F1  89 C6				mov		esi,eax
00F3				L$7:
00F3  8B 41 10				mov		eax,dword ptr 0x10[ecx]
00F6  FF 15 00 00 00 00			call		dword ptr __AccessFileH
00FC  89 C8				mov		eax,ecx
00FE  E8 00 00 00 00			call		ftell_
0103  89 C2				mov		edx,eax
0105  83 F8 FF				cmp		eax,0xffffffff
0108  74 0A				je		L$8
010A  8B 41 10				mov		eax,dword ptr 0x10[ecx]
010D  31 DB				xor		ebx,ebx
010F  E8 00 00 00 00			call		lseek_
0114				L$8:
0114  85 FF				test		edi,edi
0116  74 0A				je		L$9
0118  8B 41 10				mov		eax,dword ptr 0x10[ecx]
011B  E8 00 00 00 00			call		__close_
0120  09 C6				or		esi,eax
0122				L$9:
0122  F6 41 0C 08			test		byte ptr 0xc[ecx],0x08
0126  74 0F				je		L$10
0128  8B 41 08				mov		eax,dword ptr 0x8[ecx]
012B  E8 00 00 00 00			call		free_
0130  C7 41 08 00 00 00 00		mov		dword ptr 0x8[ecx],0x00000000
0137				L$10:
0137  F6 41 0D 08			test		byte ptr 0xd[ecx],0x08
013B  74 13				je		L$11
013D  31 D2				xor		edx,edx
013F  89 E0				mov		eax,esp
0141  8A 51 19				mov		dl,byte ptr 0x19[ecx]
0144  E8 00 00 00 00			call		__MkTmpFile_
0149  89 E0				mov		eax,esp
014B  E8 00 00 00 00			call		remove_
0150				L$11:
0150  8B 41 10				mov		eax,dword ptr 0x10[ecx]
0153  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
0159  8B 41 10				mov		eax,dword ptr 0x10[ecx]
015C  FF 15 00 00 00 00			call		dword ptr __FiniAccessH
0162				L$12:
0162  89 F0				mov		eax,esi
0164  83 C4 10				add		esp,0x00000010
0167  5F				pop		edi
0168  5E				pop		esi
0169  59				pop		ecx
016A  5B				pop		ebx
016B  C3				ret		

Routine Size: 167 bytes,    Routine Base: _TEXT + 00C5

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

