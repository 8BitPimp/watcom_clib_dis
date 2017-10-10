Module: strcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000025 bytes
0000				strcpy:
0000  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0004  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
0008  50				push		eax
0009				L$1:
0009  8A 0A				mov		cl,byte ptr [edx]
000B  88 08				mov		byte ptr [eax],cl
000D  80 F9 00				cmp		cl,0x00
0010  74 11				je		L$2
0012  8A 4A 01				mov		cl,byte ptr 0x1[edx]
0015  83 C2 02				add		edx,0x00000002
0018  88 48 01				mov		byte ptr 0x1[eax],cl
001B  83 C0 02				add		eax,0x00000002
001E  80 F9 00				cmp		cl,0x00
0021  75 E6				jne		L$1
0023				L$2:
0023  58				pop		eax
0024  C3				ret		

Routine Size: 37 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

