Module: exlpe
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000027 bytes
0000				execlpe:
0000  8D 44 24 08			lea		eax,0x8[esp]
0004				L$1:
0004  8B 10				mov		edx,dword ptr [eax]
0006  83 C0 04				add		eax,0x00000004
0009  85 D2				test		edx,edx
000B  75 F7				jne		L$1
000D  83 C0 04				add		eax,0x00000004
0010  8B 40 FC				mov		eax,dword ptr -0x4[eax]
0013  50				push		eax
0014  8D 44 24 0C			lea		eax,0xc[esp]
0018  50				push		eax
0019  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
001D  52				push		edx
001E  E8 00 00 00 00			call		execvpe
0023  83 C4 0C				add		esp,0x0000000c
0026  C3				ret		

Routine Size: 39 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

