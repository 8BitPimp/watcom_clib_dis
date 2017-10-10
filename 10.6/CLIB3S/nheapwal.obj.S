Module: nheapwal
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D1 bytes
0000				_heapwalk:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_nheapwalk
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				_nheapwalk:
000E  53				push		ebx
000F  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
0015  8B 15 00 00 00 00			mov		edx,dword ptr __nheapbeg
001B  52				push		edx
001C  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0020  53				push		ebx
0021  E8 00 00 00 00			call		__NHeapWalk
0026  83 C4 08				add		esp,0x00000008
0029  89 C3				mov		ebx,eax
002B  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
0031  89 D8				mov		eax,ebx
0033  5B				pop		ebx
0034  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 000E

0035				__NHeapWalk:
0035  53				push		ebx
0036  55				push		ebp
0037  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
003B  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
003F  85 C0				test		eax,eax
0041  75 08				jne		L$1
0043  B8 01 00 00 00			mov		eax,0x00000001
0048  5D				pop		ebp
0049  5B				pop		ebx
004A  C3				ret		
004B				L$1:
004B  8B 13				mov		edx,dword ptr [ebx]
004D  85 D2				test		edx,edx
004F  75 05				jne		L$2
0051  8D 50 2C				lea		edx,0x2c[eax]
0054  EB 2E				jmp		L$7
0056				L$2:
0056  A1 00 00 00 00			mov		eax,dword ptr __nheapbeg
005B				L$3:
005B  8B 48 08				mov		ecx,dword ptr 0x8[eax]
005E  85 C9				test		ecx,ecx
0060  74 0D				je		L$5
0062  39 D0				cmp		eax,edx
0064  77 04				ja		L$4
0066  39 CA				cmp		edx,ecx
0068  72 05				jb		L$5
006A				L$4:
006A  8B 40 08				mov		eax,dword ptr 0x8[eax]
006D  EB EC				jmp		L$3
006F				L$5:
006F  8B 0A				mov		ecx,dword ptr [edx]
0071  80 E1 FE				and		cl,0xfe
0074  01 D1				add		ecx,edx
0076  39 D1				cmp		ecx,edx
0078  77 08				ja		L$6
007A  B8 03 00 00 00			mov		eax,0x00000003
007F  5D				pop		ebp
0080  5B				pop		ebx
0081  C3				ret		
0082				L$6:
0082  89 CA				mov		edx,ecx
0084				L$7:
0084  83 3A FF				cmp		dword ptr [edx],0xffffffff
0087  75 24				jne		L$9
0089  8B 68 08				mov		ebp,dword ptr 0x8[eax]
008C  85 ED				test		ebp,ebp
008E  75 16				jne		L$8
0090  66 C7 43 04 00 00			mov		word ptr 0x4[ebx],0x0000
0096  89 6B 0A				mov		dword ptr 0xa[ebx],ebp
0099  89 6B 06				mov		dword ptr 0x6[ebx],ebp
009C  B8 04 00 00 00			mov		eax,0x00000004
00A1  89 2B				mov		dword ptr [ebx],ebp
00A3  5D				pop		ebp
00A4  5B				pop		ebx
00A5  C3				ret		
00A6				L$8:
00A6  89 E8				mov		eax,ebp
00A8  8D 55 2C				lea		edx,0x2c[ebp]
00AB  EB D7				jmp		L$7
00AD				L$9:
00AD  C7 43 0A 01 00 00 00		mov		dword ptr 0xa[ebx],0x00000001
00B4  8C 5B 04				mov		dword ptr 0x4[ebx],ds
00B7  89 13				mov		dword ptr [ebx],edx
00B9  8B 02				mov		eax,dword ptr [edx]
00BB  24 FE				and		al,0xfe
00BD  89 43 06				mov		dword ptr 0x6[ebx],eax
00C0  F6 02 01				test		byte ptr [edx],0x01
00C3  74 07				je		L$10
00C5  C7 43 0A 00 00 00 00		mov		dword ptr 0xa[ebx],0x00000000
00CC				L$10:
00CC  31 C0				xor		eax,eax
00CE  5D				pop		ebp
00CF  5B				pop		ebx
00D0  C3				ret		

Routine Size: 156 bytes,    Routine Base: _TEXT + 0035

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

