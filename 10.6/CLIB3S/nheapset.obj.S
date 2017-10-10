Module: nheapset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000007C bytes
0000				_heapset:
0000  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0004  52				push		edx
0005  E8 00 00 00 00			call		_nheapset
000A  83 C4 04				add		esp,0x00000004
000D  C3				ret		

Routine Size: 14 bytes,    Routine Base: _TEXT + 0000

000E				_nheapset:
000E  53				push		ebx
000F  56				push		esi
0010  57				push		edi
0011  55				push		ebp
0012  E8 00 00 00 00			call		_heapchk
0017  85 C0				test		eax,eax
0019  75 5C				jne		L$5
001B  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
001F  8B 54 24 14			mov		edx,dword ptr 0x14[esp]
0023  C1 E0 08				shl		eax,0x08
0026  09 C2				or		edx,eax
0028  89 54 24 14			mov		dword ptr 0x14[esp],edx
002C  FF 15 00 00 00 00			call		dword ptr _AccessNHeap
0032  8A 44 24 14			mov		al,byte ptr 0x14[esp]
0036  8B 2D 00 00 00 00			mov		ebp,dword ptr __nheapbeg
003C  8C DA				mov		edx,ds
003E  EB 2B				jmp		L$4
0040				L$1:
0040  8D 75 20				lea		esi,0x20[ebp]
0043  8B 5D 28				mov		ebx,dword ptr 0x28[ebp]
0046				L$2:
0046  39 F3				cmp		ebx,esi
0048  74 1E				je		L$3
004A  8B 0B				mov		ecx,dword ptr [ebx]
004C  8D 7B 0C				lea		edi,0xc[ebx]
004F  83 E9 0C				sub		ecx,0x0000000c
0052  06				push		es
0053  57				push		edi
0054  8E C2				mov		es,edx
0056  88 C4				mov		ah,al
0058  D1 E9				shr		ecx,0x01
005A  F2 66 AB				repne stosw	
005D  11 C9				adc		ecx,ecx
005F  F2 AA				repne stosb	
0061  5F				pop		edi
0062  07				pop		es
0063  8B 5B 08				mov		ebx,dword ptr 0x8[ebx]
0066  EB DE				jmp		L$2
0068				L$3:
0068  8B 6D 08				mov		ebp,dword ptr 0x8[ebp]
006B				L$4:
006B  85 ED				test		ebp,ebp
006D  75 D1				jne		L$1
006F  FF 15 00 00 00 00			call		dword ptr _ReleaseNHeap
0075  31 C0				xor		eax,eax
0077				L$5:
0077  5D				pop		ebp
0078  5F				pop		edi
0079  5E				pop		esi
007A  5B				pop		ebx
007B  C3				ret		

Routine Size: 110 bytes,    Routine Base: _TEXT + 000E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

