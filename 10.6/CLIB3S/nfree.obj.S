Module: nfree
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009D bytes
0000				free:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_nfree
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				_nfree:
000E  53				push		ebx
000F  56				push		esi
0010  57				push		edi
0011  55				push		ebp
0012  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
0016  85 FF				test		edi,edi
0018  0F 84 7A 00 00 00			je		L$7
001E  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
0024  8B 35 00 00 00 00			mov		esi,dword ptr __MiniHeapFreeRover
002A  85 F6				test		esi,esi
002C  74 09				je		L$1
002E  39 FE				cmp		esi,edi
0030  77 05				ja		L$1
0032  3B 7E 08				cmp		edi,dword ptr 0x8[esi]
0035  72 1A				jb		L$5
0037				L$1:
0037  8B 35 00 00 00 00			mov		esi,dword ptr __nheapbeg
003D  EB 0B				jmp		L$4
003F				L$2:
003F  39 FE				cmp		esi,edi
0041  77 04				ja		L$3
0043  39 DF				cmp		edi,ebx
0045  72 0A				jb		L$5
0047				L$3:
0047  8B 76 08				mov		esi,dword ptr 0x8[esi]
004A				L$4:
004A  8B 5E 08				mov		ebx,dword ptr 0x8[esi]
004D  85 DB				test		ebx,ebx
004F  75 EE				jne		L$2
0051				L$5:
0051  B8 00 00 00 00			mov		eax,offset __nheapbeg
0056  8C DA				mov		edx,ds
0058  81 E2 FF FF 00 00			and		edx,0x0000ffff
005E  89 F3				mov		ebx,esi
0060  89 F8				mov		eax,edi
0062  E8 00 00 00 00			call		__MemFree
0067  8B 3D 00 00 00 00			mov		edi,dword ptr __MiniHeapRover
006D  89 35 00 00 00 00			mov		dword ptr __MiniHeapFreeRover,esi
0073  39 FE				cmp		esi,edi
0075  73 13				jae		L$6
0077  8B 2D 00 00 00 00			mov		ebp,dword ptr __LargestSizeB4MiniHeapRover
007D  8B 56 14				mov		edx,dword ptr 0x14[esi]
0080  39 EA				cmp		edx,ebp
0082  76 06				jbe		L$6
0084  89 15 00 00 00 00			mov		dword ptr __LargestSizeB4MiniHeapRover,edx
008A				L$6:
008A  30 E4				xor		ah,ah
008C  88 25 00 00 00 00			mov		byte ptr __nheap_clean,ah
0092  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
0098				L$7:
0098  5D				pop		ebp
0099  5F				pop		edi
009A  5E				pop		esi
009B  5B				pop		ebx
009C  C3				ret		

Routine Size: 143 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				__MiniHeapFreeRover:

BSS Size: 4 bytes

