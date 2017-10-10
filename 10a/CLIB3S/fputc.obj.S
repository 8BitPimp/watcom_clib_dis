Module: fputc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000FC bytes
0000				fputc:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0008  8B 53 10				mov		edx,dword ptr 0x10[ebx]
000B  52				push		edx
000C  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0012  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0015  83 C4 04				add		esp,0x00000004
0018  F6 C4 02				test		ah,0x02
001B  75 2A				jne		L$2
001D  6A 04				push		0x00000004
001F  E8 00 00 00 00			call		__set_errno
0024  83 C4 04				add		esp,0x00000004
0027  8A 6B 0C				mov		ch,byte ptr 0xc[ebx]
002A  8B 6B 10				mov		ebp,dword ptr 0x10[ebx]
002D  80 CD 20				or		ch,0x20
0030  55				push		ebp
0031  88 6B 0C				mov		byte ptr 0xc[ebx],ch
0034				L$1:
0034  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
003A  B8 FF FF FF FF			mov		eax,0xffffffff
003F  83 C4 04				add		esp,0x00000004
0042  5D				pop		ebp
0043  5F				pop		edi
0044  5E				pop		esi
0045  5B				pop		ebx
0046  C3				ret		
0047				L$2:
0047  83 7B 08 00			cmp		dword ptr 0x8[ebx],0x00000000
004B  75 09				jne		L$3
004D  53				push		ebx
004E  E8 00 00 00 00			call		__ioalloc
0053  83 C4 04				add		esp,0x00000004
0056				L$3:
0056  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
005A  BE 00 04 00 00			mov		esi,0x00000400
005F  83 FF 0A				cmp		edi,0x0000000a
0062  75 41				jne		L$4
0064  8A 53 0C				mov		dl,byte ptr 0xc[ebx]
0067  BE 00 06 00 00			mov		esi,0x00000600
006C  F6 C2 40				test		dl,0x40
006F  75 34				jne		L$4
0071  8A 73 0D				mov		dh,byte ptr 0xd[ebx]
0074  80 CE 10				or		dh,0x10
0077  8B 03				mov		eax,dword ptr [ebx]
0079  88 73 0D				mov		byte ptr 0xd[ebx],dh
007C  C6 00 0D				mov		byte ptr [eax],0x0d
007F  8B 2B				mov		ebp,dword ptr [ebx]
0081  45				inc		ebp
0082  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0085  89 2B				mov		dword ptr [ebx],ebp
0087  40				inc		eax
0088  8B 53 14				mov		edx,dword ptr 0x14[ebx]
008B  89 43 04				mov		dword ptr 0x4[ebx],eax
008E  39 D0				cmp		eax,edx
0090  75 13				jne		L$4
0092  53				push		ebx
0093  E8 00 00 00 00			call		__flush
0098  83 C4 04				add		esp,0x00000004
009B  85 C0				test		eax,eax
009D  74 06				je		L$4
009F  8B 7B 10				mov		edi,dword ptr 0x10[ebx]
00A2  57				push		edi
00A3  EB 8F				jmp		L$1
00A5				L$4:
00A5  8A 4B 0D				mov		cl,byte ptr 0xd[ebx]
00A8  8B 03				mov		eax,dword ptr [ebx]
00AA  80 C9 10				or		cl,0x10
00AD  8A 54 24 14			mov		dl,byte ptr 0x14[esp]
00B1  88 4B 0D				mov		byte ptr 0xd[ebx],cl
00B4  88 10				mov		byte ptr [eax],dl
00B6  8B 0B				mov		ecx,dword ptr [ebx]
00B8  41				inc		ecx
00B9  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
00BC  89 0B				mov		dword ptr [ebx],ecx
00BE  47				inc		edi
00BF  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
00C2  89 7B 04				mov		dword ptr 0x4[ebx],edi
00C5  85 EE				test		esi,ebp
00C7  75 05				jne		L$5
00C9  3B 7B 14				cmp		edi,dword ptr 0x14[ebx]
00CC  75 16				jne		L$6
00CE				L$5:
00CE  53				push		ebx
00CF  E8 00 00 00 00			call		__flush
00D4  83 C4 04				add		esp,0x00000004
00D7  85 C0				test		eax,eax
00D9  74 09				je		L$6
00DB  8B 73 10				mov		esi,dword ptr 0x10[ebx]
00DE  56				push		esi
00DF  E9 50 FF FF FF			jmp		L$1
00E4				L$6:
00E4  8B 4B 10				mov		ecx,dword ptr 0x10[ebx]
00E7  51				push		ecx
00E8  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00EE  83 C4 04				add		esp,0x00000004
00F1  31 C0				xor		eax,eax
00F3  8A 44 24 14			mov		al,byte ptr 0x14[esp]
00F7  5D				pop		ebp
00F8  5F				pop		edi
00F9  5E				pop		esi
00FA  5B				pop		ebx
00FB  C3				ret		

Routine Size: 252 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

