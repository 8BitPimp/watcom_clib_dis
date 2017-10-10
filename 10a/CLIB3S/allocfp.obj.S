Module: allocfp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010A bytes
0000				__allocfp:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  FF 15 00 00 00 00			call		dword ptr _AccessIOB
0009  8B 35 00 00 00 00			mov		esi,dword ptr __ClosedStreams
000F  85 F6				test		esi,esi
0011  74 19				je		L$1
0013  8B 5E 04				mov		ebx,dword ptr 0x4[esi]
0016  8B 7B 0C				mov		edi,dword ptr 0xc[ebx]
0019  8B 06				mov		eax,dword ptr [esi]
001B  81 E7 03 40 00 00			and		edi,0x00004003
0021  A3 00 00 00 00			mov		dword ptr __ClosedStreams,eax
0026  66 83 CF 03			or		di,0x0003
002A  EB 47				jmp		L$5
002C				L$1:
002C  BB 00 00 00 00			mov		ebx,offset __iob
0031  EB 20				jmp		L$4
0033				L$2:
0033  F6 43 0C 03			test		byte ptr 0xc[ebx],0x03
0037  75 17				jne		L$3
0039  6A 08				push		0x00000008
003B  E8 00 00 00 00			call		malloc
0040  83 C4 04				add		esp,0x00000004
0043  89 C6				mov		esi,eax
0045  85 C0				test		eax,eax
0047  74 56				je		L$6
0049  BF 03 00 00 00			mov		edi,0x00000003
004E  EB 23				jmp		L$5
0050				L$3:
0050  83 C3 1A				add		ebx,0x0000001a
0053				L$4:
0053  81 FB 08 02 00 00			cmp		ebx,offset __iob+0x208
0059  72 D8				jb		L$2
005B  6A 22				push		0x00000022
005D  BF 03 40 00 00			mov		edi,0x00004003
0062  E8 00 00 00 00			call		malloc
0067  83 C4 04				add		esp,0x00000004
006A  89 C6				mov		esi,eax
006C  85 C0				test		eax,eax
006E  74 2F				je		L$6
0070  8D 58 08				lea		ebx,0x8[eax]
0073				L$5:
0073  6A 1A				push		0x0000001a
0075  6A 00				push		0x00000000
0077  53				push		ebx
0078  E8 00 00 00 00			call		memset
007D  A1 00 00 00 00			mov		eax,dword ptr __OpenStreams
0082  89 7B 0C				mov		dword ptr 0xc[ebx],edi
0085  83 C4 0C				add		esp,0x0000000c
0088  89 5E 04				mov		dword ptr 0x4[esi],ebx
008B  89 35 00 00 00 00			mov		dword ptr __OpenStreams,esi
0091  89 06				mov		dword ptr [esi],eax
0093  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
0099  89 D8				mov		eax,ebx
009B  5F				pop		edi
009C  5E				pop		esi
009D  5B				pop		ebx
009E  C3				ret		
009F				L$6:
009F  6A 05				push		0x00000005
00A1  E8 00 00 00 00			call		__set_errno
00A6  83 C4 04				add		esp,0x00000004
00A9  FF 15 00 00 00 00			call		dword ptr _ReleaseIOB
00AF  31 C0				xor		eax,eax
00B1  5F				pop		edi
00B2  5E				pop		esi
00B3  5B				pop		ebx
00B4  C3				ret		

Routine Size: 181 bytes,    Routine Base: _TEXT + 0000

00B5				__freefp:
00B5  53				push		ebx
00B6  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
00BA  BA 00 00 00 00			mov		edx,offset __OpenStreams
00BF				L$7:
00BF  8B 02				mov		eax,dword ptr [edx]
00C1  85 C0				test		eax,eax
00C3  74 25				je		L$9
00C5  8B 48 04				mov		ecx,dword ptr 0x4[eax]
00C8  39 CB				cmp		ebx,ecx
00CA  74 04				je		L$8
00CC  89 C2				mov		edx,eax
00CE  EB EF				jmp		L$7
00D0				L$8:
00D0  8A 49 0C				mov		cl,byte ptr 0xc[ecx]
00D3  80 C9 03				or		cl,0x03
00D6  88 4B 0C				mov		byte ptr 0xc[ebx],cl
00D9  8B 18				mov		ebx,dword ptr [eax]
00DB  89 1A				mov		dword ptr [edx],ebx
00DD  8B 15 00 00 00 00			mov		edx,dword ptr __ClosedStreams
00E3  A3 00 00 00 00			mov		dword ptr __ClosedStreams,eax
00E8  89 10				mov		dword ptr [eax],edx
00EA				L$9:
00EA  5B				pop		ebx
00EB  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 00B5

00EC				__purgefp:
00EC  53				push		ebx
00ED				L$10:
00ED  8B 15 00 00 00 00			mov		edx,dword ptr __ClosedStreams
00F3  85 D2				test		edx,edx
00F5  74 F3				je		L$9
00F7  52				push		edx
00F8  8B 1A				mov		ebx,dword ptr [edx]
00FA  E8 00 00 00 00			call		free
00FF  83 C4 04				add		esp,0x00000004
0102  89 1D 00 00 00 00			mov		dword ptr __ClosedStreams,ebx
0108  EB E3				jmp		L$10

Routine Size: 30 bytes,    Routine Base: _TEXT + 00EC

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

