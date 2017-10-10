Module: nfree
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000006A bytes
0000				free_:
0000				_nfree_:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 C3				mov		ebx,eax
0006  FF 15 00 00 00 00			call		dword ptr __AccessNHeap
000C  8B 0D 00 00 00 00			mov		ecx,dword ptr ___nheapbeg
0012  EB 0B				jmp		L$3
0014				L$1:
0014  39 D9				cmp		ecx,ebx
0016  77 04				ja		L$2
0018  39 D3				cmp		ebx,edx
001A  72 0A				jb		L$4
001C				L$2:
001C  8B 49 08				mov		ecx,dword ptr 0x8[ecx]
001F				L$3:
001F  8B 51 08				mov		edx,dword ptr 0x8[ecx]
0022  85 D2				test		edx,edx
0024  75 EE				jne		L$1
0026				L$4:
0026  B8 00 00 00 00			mov		eax,offset ___nheapbeg
002B  8C DA				mov		edx,ds
002D  81 E2 FF FF 00 00			and		edx,0x0000ffff
0033  89 D8				mov		eax,ebx
0035  89 CB				mov		ebx,ecx
0037  E8 00 00 00 00			call		__MemFree
003C  3B 0D 00 00 00 00			cmp		ecx,dword ptr ___MiniHeapRover
0042  74 13				je		L$5
0044  8B 2D 00 00 00 00			mov		ebp,dword ptr ___LargestSizeB4MiniHeapRover
004A  8B 51 14				mov		edx,dword ptr 0x14[ecx]
004D  39 EA				cmp		edx,ebp
004F  76 06				jbe		L$5
0051  89 15 00 00 00 00			mov		dword ptr ___LargestSizeB4MiniHeapRover,edx
0057				L$5:
0057  30 E4				xor		ah,ah
0059  88 25 00 00 00 00			mov		byte ptr ___nheap_clean,ah
005F  FF 15 00 00 00 00			call		dword ptr __ReleaseNHeap
0065  5D				pop		ebp
0066  5A				pop		edx
0067  59				pop		ecx
0068  5B				pop		ebx
0069  C3				ret		

Routine Size: 106 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

