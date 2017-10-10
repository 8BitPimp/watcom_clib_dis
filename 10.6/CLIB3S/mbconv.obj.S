Module: mbconv
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000094 bytes
0000				_mbptov:
0000  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0004  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
000A  85 D2				test		edx,edx
000C  74 13				je		L$1
000E  31 D2				xor		edx,edx
0010  8A 10				mov		dl,byte ptr [eax]
0012  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
0018  80 E2 01				and		dl,0x01
001B  81 E2 FF 00 00 00			and		edx,0x000000ff
0021				L$1:
0021  85 D2				test		edx,edx
0023  74 12				je		L$2
0025  31 D2				xor		edx,edx
0027  8A 10				mov		dl,byte ptr [eax]
0029  C1 E2 08				shl		edx,0x08
002C  8A 40 01				mov		al,byte ptr 0x1[eax]
002F  25 FF 00 00 00			and		eax,0x000000ff
0034  09 D0				or		eax,edx
0036  C3				ret		
0037				L$2:
0037  8A 00				mov		al,byte ptr [eax]
0039  25 FF 00 00 00			and		eax,0x000000ff
003E  C3				ret		

Routine Size: 63 bytes,    Routine Base: _TEXT + 0000

003F				_mbvtop:
003F  53				push		ebx
0040  8B 5C 24 08			mov		ebx,dword ptr 0x8[esp]
0044  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0048  F6 C7 FF				test		bh,0xff
004B  74 0C				je		L$3
004D  89 DA				mov		edx,ebx
004F  88 58 01				mov		byte ptr 0x1[eax],bl
0052  C1 EA 08				shr		edx,0x08
0055  88 10				mov		byte ptr [eax],dl
0057  5B				pop		ebx
0058  C3				ret		
0059				L$3:
0059  88 18				mov		byte ptr [eax],bl
005B  5B				pop		ebx
005C  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 003F

005D				__mbvtop:
005D  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
0061  F6 C6 FF				test		dh,0xff
0064  74 1A				je		L$4
0066  89 D0				mov		eax,edx
0068  88 15 01 00 00 00			mov		byte ptr DGROUP:L$7,dl
006E  C1 E8 08				shr		eax,0x08
0071  30 D2				xor		dl,dl
0073  A2 00 00 00 00			mov		byte ptr DGROUP:L$6,al
0078  88 15 02 00 00 00			mov		byte ptr DGROUP:L$8,dl
007E  EB 0E				jmp		L$5
0080				L$4:
0080  30 E4				xor		ah,ah
0082  88 15 00 00 00 00			mov		byte ptr DGROUP:L$6,dl
0088  88 25 01 00 00 00			mov		byte ptr DGROUP:L$7,ah
008E				L$5:
008E  B8 00 00 00 00			mov		eax,offset DGROUP:L$6
0093  C3				ret		

Routine Size: 55 bytes,    Routine Base: _TEXT + 005D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000003 bytes
0000				L$6:
0001				L$7:
0002				L$8:

BSS Size: 3 bytes

