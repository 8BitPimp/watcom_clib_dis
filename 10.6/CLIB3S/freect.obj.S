Module: freect
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				_freect:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 7C 24 14			mov		edi,dword ptr 0x14[esp]
0008  83 C7 07				add		edi,0x00000007
000B  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
000F  66 83 E7 FC			and		di,0xfffc
0013  31 F6				xor		esi,esi
0015  39 D7				cmp		edi,edx
0017  73 07				jae		L$1
0019  31 C0				xor		eax,eax
001B  5D				pop		ebp
001C  5F				pop		edi
001D  5E				pop		esi
001E  5B				pop		ebx
001F  C3				ret		
0020				L$1:
0020  83 FF 0C				cmp		edi,0x0000000c
0023  73 05				jae		L$2
0025  BF 0C 00 00 00			mov		edi,0x0000000c
002A				L$2:
002A  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
0030  8B 2D 00 00 00 00			mov		ebp,dword ptr __nheapbeg
0036  EB 1A				jmp		L$6
0038				L$3:
0038  8D 4D 20				lea		ecx,0x20[ebp]
003B  8B 5D 28				mov		ebx,dword ptr 0x28[ebp]
003E				L$4:
003E  39 CB				cmp		ebx,ecx
0040  74 0D				je		L$5
0042  8B 03				mov		eax,dword ptr [ebx]
0044  31 D2				xor		edx,edx
0046  F7 F7				div		edi
0048  8B 5B 08				mov		ebx,dword ptr 0x8[ebx]
004B  01 C6				add		esi,eax
004D  EB EF				jmp		L$4
004F				L$5:
004F  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
0052				L$6:
0052  85 ED				test		ebp,ebp
0054  75 E2				jne		L$3
0056  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
005C  89 F0				mov		eax,esi
005E  5D				pop		ebp
005F  5F				pop		edi
0060  5E				pop		esi
0061  5B				pop		ebx
0062  C3				ret		

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

