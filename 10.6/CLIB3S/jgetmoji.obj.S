Module: jgetmoji
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000004A bytes
0000				jgetmoji:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0009  30 FF				xor		bh,bh
000B  8A 18				mov		bl,byte ptr [eax]
000D  66 89 1A				mov		word ptr [edx],bx
0010  66 85 DB				test		bx,bx
0013  74 33				je		L$2
0015  31 DB				xor		ebx,ebx
0017  8A 1A				mov		bl,byte ptr [edx]
0019  8A 9B 01 00 00 00			mov		bl,byte ptr _IsKTable+0x1[ebx]
001F  80 E3 04				and		bl,0x04
0022  81 E3 FF 00 00 00			and		ebx,0x000000ff
0028  40				inc		eax
0029  85 DB				test		ebx,ebx
002B  74 1B				je		L$2
002D  8A 18				mov		bl,byte ptr [eax]
002F  84 DB				test		bl,bl
0031  74 10				je		L$1
0033  66 8B 0A				mov		cx,word ptr [edx]
0036  30 FF				xor		bh,bh
0038  C1 E1 08				shl		ecx,0x08
003B  09 D9				or		ecx,ebx
003D  40				inc		eax
003E  66 89 0A				mov		word ptr [edx],cx
0041  5B				pop		ebx
0042  C3				ret		
0043				L$1:
0043  66 C7 02 00 00			mov		word ptr [edx],0x0000
0048				L$2:
0048  5B				pop		ebx
0049  C3				ret		

Routine Size: 74 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

