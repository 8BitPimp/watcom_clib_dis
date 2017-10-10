Module: nmalloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000104 bytes
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
0029  E9 C9 00 00 00			jmp		L$13
002E				L$2:
002E  30 E4				xor		ah,ah
0030  88 64 24 04			mov		byte ptr 0x4[esp],ah
0034  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
003A  8D 47 03				lea		eax,0x3[edi]
003D  24 FC				and		al,0xfc
003F  31 ED				xor		ebp,ebp
0041  89 04 24				mov		dword ptr [esp],eax
0044				L$3:
0044  8B 14 24				mov		edx,dword ptr [esp]
0047  83 FA 0C				cmp		edx,0x0000000c
004A  73 05				jae		L$4
004C  BA 0C 00 00 00			mov		edx,0x0000000c
0051				L$4:
0051  3B 15 00 00 00 00			cmp		edx,dword ptr __LargestSizeB4MiniHeapRover
0057  76 18				jbe		L$6
0059  8B 35 00 00 00 00			mov		esi,dword ptr __MiniHeapRover
005F  85 F6				test		esi,esi
0061  75 4A				jne		L$9
0063				L$5:
0063  89 35 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,esi
0069  8B 35 00 00 00 00			mov		esi,dword ptr __nheapbeg
006F  EB 3C				jmp		L$9
0071				L$6:
0071  31 F6				xor		esi,esi
0073  EB EE				jmp		L$5
0075				L$7:
0075  B8 00 00 00 00			mov		eax,offset __nheapbeg
007A  8C DA				mov		edx,ds
007C  89 35 00 00 00 00			mov		dword ptr __MiniHeapRover,esi
0082  81 E2 FF FF 00 00			and		edx,0x0000ffff
0088  89 F8				mov		eax,edi
008A  89 F3				mov		ebx,esi
008C  E8 00 00 00 00			call		__MemAllocator
0091  89 C5				mov		ebp,eax
0093  85 C0				test		eax,eax
0095  75 50				jne		L$12
0097  8B 1D 00 00 00 00			mov		ebx,dword ptr __LargestSizeB4MiniHeapRover
009D  8B 56 14				mov		edx,dword ptr 0x14[esi]
00A0  39 DA				cmp		edx,ebx
00A2  76 06				jbe		L$8
00A4  89 15 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,edx
00AA				L$8:
00AA  8B 76 08				mov		esi,dword ptr 0x8[esi]
00AD				L$9:
00AD  85 F6				test		esi,esi
00AF  75 C4				jne		L$7
00B1  80 7C 24 04 00			cmp		byte ptr 0x4[esp],0x00
00B6  75 0D				jne		L$10
00B8  57				push		edi
00B9  E8 00 00 00 00			call		__ExpandDGROUP
00BE  83 C4 04				add		esp,0x00000004
00C1  85 C0				test		eax,eax
00C3  75 18				jne		L$11
00C5				L$10:
00C5  57				push		edi
00C6  E8 00 00 00 00			call		__nmemneed
00CB  83 C4 04				add		esp,0x00000004
00CE  85 C0				test		eax,eax
00D0  74 15				je		L$12
00D2  30 DB				xor		bl,bl
00D4  88 5C 24 04			mov		byte ptr 0x4[esp],bl
00D8  E9 67 FF FF FF			jmp		L$3
00DD				L$11:
00DD  C6 44 24 04 01			mov		byte ptr 0x4[esp],0x01
00E2  E9 5D FF FF FF			jmp		L$3
00E7				L$12:
00E7  30 FF				xor		bh,bh
00E9  88 3D 00 00 00 00			mov		byte ptr __nheap_clean,bh
00EF  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
00F5  89 E8				mov		eax,ebp
00F7				L$13:
00F7  83 C4 08				add		esp,0x00000008
00FA  5D				pop		ebp
00FB  0F A9				pop		gs
00FD  0F A1				pop		fs
00FF  07				pop		es
0100  5F				pop		edi
0101  5E				pop		esi
0102  5B				pop		ebx
0103  C3				ret		

Routine Size: 246 bytes,    Routine Base: _TEXT + 000E

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

