Module: nmalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010F bytes
0000				malloc:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_nmalloc
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				_nmalloc:
000E  53				push		ebx
000F  56				push		esi
0010  57				push		edi
0011  06				push		es
0012  0F A0				push		fs
0014  0F A8				push		gs
0016  55				push		ebp
0017  83 EC 08				sub		esp,0x00000008
001A  8B 7C 24 28			mov		edi,dword ptr 0x28[esp]
001E  85 FF				test		edi,edi
0020  74 05				je		L$1
0022  83 FF D4				cmp		edi,0xffffffd4
0025  76 07				jbe		L$2
0027				L$1:
0027  31 C0				xor		eax,eax
0029  E9 D4 00 00 00			jmp		L$12
002E				L$2:
002E  30 E4				xor		ah,ah
0030  88 64 24 04			mov		byte ptr 0x4[esp],ah
0034  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
003A  8D 47 03				lea		eax,0x3[edi]
003D  24 FC				and		al,0xfc
003F  31 ED				xor		ebp,ebp
0041  89 04 24				mov		dword ptr [esp],eax
0044				L$3:
0044  8B 04 24				mov		eax,dword ptr [esp]
0047  83 F8 0C				cmp		eax,0x0000000c
004A  73 05				jae		L$4
004C  B8 0C 00 00 00			mov		eax,0x0000000c
0051				L$4:
0051  3B 05 00 00 00 00			cmp		eax,dword ptr __LargestSizeB4MiniHeapRover
0057  76 18				jbe		L$5
0059  8B 35 00 00 00 00			mov		esi,dword ptr __MiniHeapRover
005F  85 F6				test		esi,esi
0061  75 55				jne		L$8
0063  89 35 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,esi
0069  8B 35 00 00 00 00			mov		esi,dword ptr __nheapbeg
006F  EB 47				jmp		L$8
0071				L$5:
0071  31 C9				xor		ecx,ecx
0073  8B 35 00 00 00 00			mov		esi,dword ptr __nheapbeg
0079  89 0D 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,ecx
007F  EB 37				jmp		L$8
0081				L$6:
0081  B8 00 00 00 00			mov		eax,offset __nheapbeg
0086  8C DA				mov		edx,ds
0088  89 35 00 00 00 00			mov		dword ptr __MiniHeapRover,esi
008E  81 E2 FF FF 00 00			and		edx,0x0000ffff
0094  89 F3				mov		ebx,esi
0096  89 F8				mov		eax,edi
0098  E8 00 00 00 00			call		__MemAllocator
009D  89 C5				mov		ebp,eax
009F  85 C0				test		eax,eax
00A1  75 4F				jne		L$11
00A3  8B 15 00 00 00 00			mov		edx,dword ptr __LargestSizeB4MiniHeapRover
00A9  8B 46 14				mov		eax,dword ptr 0x14[esi]
00AC  39 D0				cmp		eax,edx
00AE  76 05				jbe		L$7
00B0  A3 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,eax
00B5				L$7:
00B5  8B 76 08				mov		esi,dword ptr 0x8[esi]
00B8				L$8:
00B8  85 F6				test		esi,esi
00BA  75 C5				jne		L$6
00BC  80 7C 24 04 00			cmp		byte ptr 0x4[esp],0x00
00C1  75 0D				jne		L$9
00C3  57				push		edi
00C4  E8 00 00 00 00			call		__ExpandDGROUP
00C9  83 C4 04				add		esp,0x00000004
00CC  85 C0				test		eax,eax
00CE  75 18				jne		L$10
00D0				L$9:
00D0  57				push		edi
00D1  E8 00 00 00 00			call		__nmemneed
00D6  83 C4 04				add		esp,0x00000004
00D9  85 C0				test		eax,eax
00DB  74 15				je		L$11
00DD  30 DB				xor		bl,bl
00DF  88 5C 24 04			mov		byte ptr 0x4[esp],bl
00E3  E9 5C FF FF FF			jmp		L$3
00E8				L$10:
00E8  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
00ED  E9 52 FF FF FF			jmp		L$3
00F2				L$11:
00F2  30 FF				xor		bh,bh
00F4  88 3D 00 00 00 00			mov		byte ptr __nheap_clean,bh
00FA  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
0100  89 E8				mov		eax,ebp
0102				L$12:
0102  83 C4 08				add		esp,0x00000008
0105  5D				pop		ebp
0106  0F A9				pop		gs
0108  0F A1				pop		fs
010A  07				pop		es
010B  5F				pop		edi
010C  5E				pop		esi
010D  5B				pop		ebx
010E  C3				ret		

Routine Size: 257 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 0000000C bytes
0000				__nheapbeg:
0000  00 00 00 00                                     ....
0004				__MiniHeapRover:
0004  00 00 00 00                                     ....
0008				__LargestSizeB4MiniHeapRover:
0008  00 00 00 00                                     ....

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

