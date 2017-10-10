Module: nheapchk
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000015F bytes
0000				checkFreeList:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 35 00 00 00 00			mov		esi,dword ptr __nheapbeg
000A  31 DB				xor		ebx,ebx
000C  31 FF				xor		edi,edi
000E  EB 45				jmp		L$5
0010				L$1:
0010  8B 46 28				mov		eax,dword ptr 0x28[esi]
0013  8B 50 04				mov		edx,dword ptr 0x4[eax]
0016  39 D7				cmp		edi,edx
0018  75 0A				jne		L$3
001A				L$2:
001A  B8 03 00 00 00			mov		eax,0x00000003
001F  5D				pop		ebp
0020  5F				pop		edi
0021  5E				pop		esi
0022  5B				pop		ebx
0023  C3				ret		
0024				L$3:
0024  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
0027  39 C8				cmp		eax,ecx
0029  75 EF				jne		L$2
002B				L$4:
002B  8B 68 08				mov		ebp,dword ptr 0x8[eax]
002E  39 EF				cmp		edi,ebp
0030  74 E8				je		L$2
0032  89 EA				mov		edx,ebp
0034  8B 6D 04				mov		ebp,dword ptr 0x4[ebp]
0037  39 E8				cmp		eax,ebp
0039  75 DF				jne		L$2
003B  F6 45 00 01			test		byte ptr [ebp],0x01
003F  75 D9				jne		L$2
0041  8B 45 00				mov		eax,dword ptr [ebp]
0044  01 D8				add		eax,ebx
0046  39 D8				cmp		eax,ebx
0048  72 D0				jb		L$2
004A  89 C3				mov		ebx,eax
004C  89 D0				mov		eax,edx
004E  39 CA				cmp		edx,ecx
0050  75 D9				jne		L$4
0052  8B 76 08				mov		esi,dword ptr 0x8[esi]
0055				L$5:
0055  85 F6				test		esi,esi
0057  75 B7				jne		L$1
0059  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
005D  89 18				mov		dword ptr [eax],ebx
005F  31 C0				xor		eax,eax
0061  5D				pop		ebp
0062  5F				pop		edi
0063  5E				pop		esi
0064  5B				pop		ebx
0065  C3				ret		
0066				checkFree:
0066  53				push		ebx
0067  57				push		edi
0068  55				push		ebp
0069  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
006D  F6 03 01				test		byte ptr [ebx],0x01
0070  74 09				je		L$7
0072				L$6:
0072  B8 03 00 00 00			mov		eax,0x00000003
0077  5D				pop		ebp
0078  5F				pop		edi
0079  5B				pop		ebx
007A  C3				ret		
007B				L$7:
007B  8B 53 08				mov		edx,dword ptr 0x8[ebx]
007E  8B 4A 04				mov		ecx,dword ptr 0x4[edx]
0081  8B 43 04				mov		eax,dword ptr 0x4[ebx]
0084  39 CB				cmp		ebx,ecx
0086  75 EA				jne		L$6
0088  3B 48 08				cmp		ecx,dword ptr 0x8[eax]
008B  75 E5				jne		L$6
008D  8B 5A 08				mov		ebx,dword ptr 0x8[edx]
0090  8B 7B 04				mov		edi,dword ptr 0x4[ebx]
0093  8B 48 04				mov		ecx,dword ptr 0x4[eax]
0096  39 FA				cmp		edx,edi
0098  75 D8				jne		L$6
009A  8B 69 08				mov		ebp,dword ptr 0x8[ecx]
009D  39 E8				cmp		eax,ebp
009F  75 D1				jne		L$6
00A1  39 FF				cmp		edi,edi
00A3  75 CD				jne		L$6
00A5  39 ED				cmp		ebp,ebp
00A7  75 C9				jne		L$6
00A9  31 E8				xor		eax,ebp
00AB  5D				pop		ebp
00AC  5F				pop		edi
00AD  5B				pop		ebx
00AE  C3				ret		

Routine Size: 175 bytes,    Routine Base: _TEXT + 0000

00AF				_heapchk:

Routine Size: 0 bytes,    Routine Base: _TEXT + 00AF

00AF				_nheapchk:
00AF  53				push		ebx
00B0  83 EC 14				sub		esp,0x00000014
00B3  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
00B9  80 3D 00 00 00 00 00		cmp		byte ptr __nheap_clean,0x00
00C0  74 0D				je		L$8
00C2  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
00C8  31 C0				xor		eax,eax
00CA  83 C4 14				add		esp,0x00000014
00CD  5B				pop		ebx
00CE  C3				ret		
00CF				L$8:
00CF  8D 44 24 10			lea		eax,0x10[esp]
00D3  50				push		eax
00D4  E8 00 00 00 00			call		checkFreeList
00D9  89 C3				mov		ebx,eax
00DB  83 C4 04				add		esp,0x00000004
00DE  85 C0				test		eax,eax
00E0  0F 85 6C 00 00 00			jne		L$14
00E6  31 D2				xor		edx,edx
00E8  89 04 24				mov		dword ptr [esp],eax
00EB  66 89 54 24 04			mov		word ptr 0x4[esp],dx
00F0				L$9:
00F0  8B 1D 00 00 00 00			mov		ebx,dword ptr __nheapbeg
00F6  53				push		ebx
00F7  8D 44 24 04			lea		eax,0x4[esp]
00FB  50				push		eax
00FC  E8 00 00 00 00			call		__NHeapWalk
0101  83 C4 08				add		esp,0x00000008
0104  89 C3				mov		ebx,eax
0106  85 C0				test		eax,eax
0108  75 23				jne		L$10
010A  83 7C 24 0A 01			cmp		dword ptr 0xa[esp],0x00000001
010F  75 DF				jne		L$9
0111  8B 04 24				mov		eax,dword ptr [esp]
0114  50				push		eax
0115  E8 00 00 00 00			call		checkFree
011A  83 C4 04				add		esp,0x00000004
011D  89 C3				mov		ebx,eax
011F  85 C0				test		eax,eax
0121  75 0A				jne		L$10
0123  8B 44 24 06			mov		eax,dword ptr 0x6[esp]
0127  29 44 24 10			sub		dword ptr 0x10[esp],eax
012B  EB C3				jmp		L$9
012D				L$10:
012D  83 7C 24 10 00			cmp		dword ptr 0x10[esp],0x00000000
0132  74 07				je		L$12
0134				L$11:
0134  BB 03 00 00 00			mov		ebx,0x00000003
0139  EB 17				jmp		L$14
013B				L$12:
013B  83 FB 05				cmp		ebx,0x00000005
013E  74 F4				je		L$11
0140  83 FB 04				cmp		ebx,0x00000004
0143  75 02				jne		L$13
0145  31 DB				xor		ebx,ebx
0147				L$13:
0147  85 DB				test		ebx,ebx
0149  75 07				jne		L$14
014B  C6 05 00 00 00 00 01		mov		byte ptr __nheap_clean,0x01
0152				L$14:
0152  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
0158  89 D8				mov		eax,ebx
015A  83 C4 14				add		esp,0x00000014
015D  5B				pop		ebx
015E  C3				ret		

Routine Size: 176 bytes,    Routine Base: _TEXT + 00AF

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

