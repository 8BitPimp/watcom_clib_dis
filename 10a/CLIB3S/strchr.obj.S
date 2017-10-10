Module: strchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				strchr:
0000  53				push		ebx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0009				L$1:
0009  31 D2				xor		edx,edx
000B  8A 10				mov		dl,byte ptr [eax]
000D  39 DA				cmp		edx,ebx
000F  74 0B				je		L$2
0011  89 C2				mov		edx,eax
0013  8A 0A				mov		cl,byte ptr [edx]
0015  40				inc		eax
0016  84 C9				test		cl,cl
0018  75 EF				jne		L$1
001A  31 C0				xor		eax,eax
001C				L$2:
001C  5B				pop		ebx
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

