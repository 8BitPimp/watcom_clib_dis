Module: allocfp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000111 bytes
0000				__allocfp_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  56				push		esi
0004  57				push		edi
0005  FF 15 00 00 00 00			call		dword ptr __AccessIOB
000B  8B 35 00 00 00 00			mov		esi,dword ptr ___ClosedStreams
0011  85 F6				test		esi,esi
0013  74 19				je		L$1
0015  8B 4E 04				mov		ecx,dword ptr 0x4[esi]
0018  8B 79 0C				mov		edi,dword ptr 0xc[ecx]
001B  8B 06				mov		eax,dword ptr [esi]
001D  81 E7 03 40 00 00			and		edi,0x00004003
0023  A3 00 00 00 00			mov		dword ptr ___ClosedStreams,eax
0028  66 83 CF 03			or		di,0x0003
002C  EB 49				jmp		L$5
002E				L$1:
002E  B9 00 00 00 00			mov		ecx,offset ___iob
0033  EB 20				jmp		L$4
0035				L$2:
0035  F6 41 0C 03			test		byte ptr 0xc[ecx],0x03
0039  75 17				jne		L$3
003B  B8 08 00 00 00			mov		eax,0x00000008
0040  E8 00 00 00 00			call		malloc_
0045  89 C6				mov		esi,eax
0047  85 C0				test		eax,eax
0049  74 57				je		L$6
004B  BF 03 00 00 00			mov		edi,0x00000003
0050  EB 25				jmp		L$5
0052				L$3:
0052  83 C1 1A				add		ecx,0x0000001a
0055				L$4:
0055  81 F9 08 02 00 00			cmp		ecx,offset ___iob+0x208
005B  72 D8				jb		L$2
005D  B8 22 00 00 00			mov		eax,0x00000022
0062  BF 03 40 00 00			mov		edi,0x00004003
0067  E8 00 00 00 00			call		malloc_
006C  89 C1				mov		ecx,eax
006E  89 C6				mov		esi,eax
0070  85 C0				test		eax,eax
0072  74 2E				je		L$6
0074  8D 48 08				lea		ecx,0x8[eax]
0077				L$5:
0077  BB 1A 00 00 00			mov		ebx,0x0000001a
007C  89 C8				mov		eax,ecx
007E  31 D2				xor		edx,edx
0080  E8 00 00 00 00			call		memset_
0085  89 79 0C				mov		dword ptr 0xc[ecx],edi
0088  A1 00 00 00 00			mov		eax,dword ptr ___OpenStreams
008D  89 4E 04				mov		dword ptr 0x4[esi],ecx
0090  89 35 00 00 00 00			mov		dword ptr ___OpenStreams,esi
0096  89 06				mov		dword ptr [esi],eax
0098  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
009E  89 C8				mov		eax,ecx
00A0  EB 12				jmp		L$7
00A2				L$6:
00A2  B8 05 00 00 00			mov		eax,0x00000005
00A7  E8 00 00 00 00			call		__set_errno_
00AC  FF 15 00 00 00 00			call		dword ptr __ReleaseIOB
00B2  31 C0				xor		eax,eax
00B4				L$7:
00B4  5F				pop		edi
00B5  5E				pop		esi
00B6  5A				pop		edx
00B7  59				pop		ecx
00B8  5B				pop		ebx
00B9  C3				ret		

Routine Size: 186 bytes,    Routine Base: _TEXT + 0000

00BA				__freefp_:
00BA  53				push		ebx
00BB  51				push		ecx
00BC  52				push		edx
00BD  89 C3				mov		ebx,eax
00BF  BA 00 00 00 00			mov		edx,offset ___OpenStreams
00C4				L$8:
00C4  8B 02				mov		eax,dword ptr [edx]
00C6  85 C0				test		eax,eax
00C8  74 25				je		L$10
00CA  8B 48 04				mov		ecx,dword ptr 0x4[eax]
00CD  39 CB				cmp		ebx,ecx
00CF  74 04				je		L$9
00D1  89 C2				mov		edx,eax
00D3  EB EF				jmp		L$8
00D5				L$9:
00D5  8A 49 0C				mov		cl,byte ptr 0xc[ecx]
00D8  80 C9 03				or		cl,0x03
00DB  88 4B 0C				mov		byte ptr 0xc[ebx],cl
00DE  8B 18				mov		ebx,dword ptr [eax]
00E0  89 1A				mov		dword ptr [edx],ebx
00E2  8B 15 00 00 00 00			mov		edx,dword ptr ___ClosedStreams
00E8  A3 00 00 00 00			mov		dword ptr ___ClosedStreams,eax
00ED  89 10				mov		dword ptr [eax],edx
00EF				L$10:
00EF  5A				pop		edx
00F0  59				pop		ecx
00F1  5B				pop		ebx
00F2  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 00BA

00F3				__purgefp_:
00F3  52				push		edx
00F4				L$11:
00F4  8B 15 00 00 00 00			mov		edx,dword ptr ___ClosedStreams
00FA  85 D2				test		edx,edx
00FC  74 11				je		L$12
00FE  89 D0				mov		eax,edx
0100  8B 12				mov		edx,dword ptr [edx]
0102  E8 00 00 00 00			call		free_
0107  89 15 00 00 00 00			mov		dword ptr ___ClosedStreams,edx
010D  EB E5				jmp		L$11
010F				L$12:
010F  5A				pop		edx
0110  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 00F3

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

