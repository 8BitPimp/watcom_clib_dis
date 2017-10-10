Module: fclose
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000001B4 bytes
0000				fclose:
0000  53				push		ebx
0001  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0005  FF 15 00 00 00 00			call		dword ptr _AccessIOB
000B  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
0010				L$1:
0010  85 C0				test		eax,eax
0012  75 07				jne		L$2
0014  B8 FF FF FF FF			mov		eax,0xffffffff
0019  5B				pop		ebx
001A  C3				ret		
001B				L$2:
001B  3B 58 04				cmp		ebx,dword ptr 0x4[eax]
001E  74 04				je		L$3
0020  8B 00				mov		eax,dword ptr [eax]
0022  EB EC				jmp		L$1
0024				L$3:
0024  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
002A  6A 01				push		0x00000001
002C  53				push		ebx
002D  E8 00 00 00 00			call		__shutdown_stream
0032  83 C4 08				add		esp,0x00000008
0035  5B				pop		ebx
0036  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 0000

0037				__shutdown_stream:
0037  53				push		ebx
0038  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
003C  52				push		edx
003D  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0041  53				push		ebx
0042  E8 00 00 00 00			call		__doclose
0047  83 C4 08				add		esp,0x00000008
004A  8B 4C 24 08			mov		ecx,dword ptr 0x8[esp]
004E  51				push		ecx
004F  89 C3				mov		ebx,eax
0051  E8 00 00 00 00			call		__freefp
0056  83 C4 04				add		esp,0x00000004
0059  89 D8				mov		eax,ebx
005B  5B				pop		ebx
005C  C3				ret		
005D				__hex:
005D  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0061  83 C0 30				add		eax,0x00000030
0064  83 F8 39				cmp		eax,0x00000039
0067  7E 03				jle		L$4
0069  83 C0 27				add		eax,0x00000027
006C				L$4:
006C  C3				ret		

Routine Size: 54 bytes,    Routine Base: _TEXT + 0037

006D				__MkTmpFile:
006D  53				push		ebx
006E  56				push		esi
006F  57				push		edi
0070  55				push		ebp
0071  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
0075  E8 00 00 00 00			call		getpid
007A  BB 04 00 00 00			mov		ebx,0x00000004
007F  89 C6				mov		esi,eax
0081  89 FD				mov		ebp,edi
0083  C6 07 74				mov		byte ptr [edi],0x74
0086  01 FB				add		ebx,edi
0088				L$5:
0088  89 F0				mov		eax,esi
008A  83 E0 0F				and		eax,0x0000000f
008D  50				push		eax
008E  C1 EE 04				shr		esi,0x04
0091  E8 00 00 00 00			call		__hex
0096  88 03				mov		byte ptr [ebx],al
0098  4B				dec		ebx
0099  83 C4 04				add		esp,0x00000004
009C  39 EB				cmp		ebx,ebp
009E  75 E8				jne		L$5
00A0  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00A4  C1 F8 04				sar		eax,0x04
00A7  83 E0 0F				and		eax,0x0000000f
00AA  50				push		eax
00AB  C6 47 05 5F			mov		byte ptr 0x5[edi],0x5f
00AF  E8 00 00 00 00			call		__hex
00B4  83 C4 04				add		esp,0x00000004
00B7  88 47 06				mov		byte ptr 0x6[edi],al
00BA  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
00BE  83 E0 0F				and		eax,0x0000000f
00C1  50				push		eax
00C2  E8 00 00 00 00			call		__hex
00C7  C6 47 08 2E			mov		byte ptr 0x8[edi],0x2e
00CB  C6 47 09 74			mov		byte ptr 0x9[edi],0x74
00CF  C6 47 0A 6D			mov		byte ptr 0xa[edi],0x6d
00D3  C6 47 0B 70			mov		byte ptr 0xb[edi],0x70
00D7  C6 47 0C 00			mov		byte ptr 0xc[edi],0x00
00DB  83 C4 04				add		esp,0x00000004
00DE  88 47 07				mov		byte ptr 0x7[edi],al
00E1  5D				pop		ebp
00E2  5F				pop		edi
00E3  5E				pop		esi
00E4  5B				pop		ebx
00E5  C3				ret		

Routine Size: 121 bytes,    Routine Base: _TEXT + 006D

00E6				__doclose:
00E6  53				push		ebx
00E7  56				push		esi
00E8  57				push		edi
00E9  83 EC 10				sub		esp,0x00000010
00EC  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
00F0  83 7B 0C 00			cmp		dword ptr 0xc[ebx],0x00000000
00F4  75 0A				jne		L$6
00F6  BE FF FF FF FF			mov		esi,0xffffffff
00FB  E9 AB 00 00 00			jmp		L$12
0100				L$6:
0100  8A 63 0D				mov		ah,byte ptr 0xd[ebx]
0103  31 F6				xor		esi,esi
0105  F6 C4 10				test		ah,0x10
0108  74 0B				je		L$7
010A  53				push		ebx
010B  E8 00 00 00 00			call		__flush
0110  83 C4 04				add		esp,0x00000004
0113  89 C6				mov		esi,eax
0115				L$7:
0115  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0118  51				push		ecx
0119  FF 15 00 00 00 00			call		dword ptr _AccessFileH
011F  83 C4 04				add		esp,0x00000004
0122  53				push		ebx
0123  E8 00 00 00 00			call		ftell
0128  83 C4 04				add		esp,0x00000004
012B  83 F8 FF				cmp		eax,0xffffffff
012E  74 0F				je		L$8
0130  6A 00				push		0x00000000
0132  50				push		eax
0133  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
0136  57				push		edi
0137  E8 00 00 00 00			call		lseek
013C  83 C4 0C				add		esp,0x0000000c
013F				L$8:
013F  83 7C 24 24 00			cmp		dword ptr 0x24[esp],0x00000000
0144  74 0E				je		L$9
0146  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0149  50				push		eax
014A  E8 00 00 00 00			call		__close
014F  83 C4 04				add		esp,0x00000004
0152  09 C6				or		esi,eax
0154				L$9:
0154  F6 43 0C 08			test		byte ptr 0xc[ebx],0x08
0158  74 13				je		L$10
015A  8B 53 08				mov		edx,dword ptr 0x8[ebx]
015D  52				push		edx
015E  E8 00 00 00 00			call		free
0163  83 C4 04				add		esp,0x00000004
0166  C7 43 08 00 00 00 00		mov		dword ptr 0x8[ebx],0x00000000
016D				L$10:
016D  F6 43 0D 08			test		byte ptr 0xd[ebx],0x08
0171  74 1E				je		L$11
0173  31 C0				xor		eax,eax
0175  8A 43 19				mov		al,byte ptr 0x19[ebx]
0178  50				push		eax
0179  8D 44 24 04			lea		eax,0x4[esp]
017D  50				push		eax
017E  E8 00 00 00 00			call		__MkTmpFile
0183  83 C4 08				add		esp,0x00000008
0186  89 E0				mov		eax,esp
0188  50				push		eax
0189  E8 00 00 00 00			call		remove
018E  83 C4 04				add		esp,0x00000004
0191				L$11:
0191  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
0194  51				push		ecx
0195  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
019B  83 C4 04				add		esp,0x00000004
019E  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
01A1  57				push		edi
01A2  FF 15 00 00 00 00			call		dword ptr _FiniAccessH
01A8  83 C4 04				add		esp,0x00000004
01AB				L$12:
01AB  89 F0				mov		eax,esi
01AD  83 C4 10				add		esp,0x00000010
01B0  5F				pop		edi
01B1  5E				pop		esi
01B2  5B				pop		ebx
01B3  C3				ret		

Routine Size: 206 bytes,    Routine Base: _TEXT + 00E6

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

