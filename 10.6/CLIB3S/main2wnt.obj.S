Module: main2wnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000048 bytes
0000				__NTMain:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  83 EC 08				sub		esp,0x00000008
0007  B8 01 00 00 00			mov		eax,0x00000001
000C  E8 00 00 00 00			call		__InitRtns
0011  A1 00 00 00 00			mov		eax,dword ptr __ThreadDataSize
0016  83 C0 03				add		eax,0x00000003
0019  24 FC				and		al,0xfc
001B  29 C4				sub		esp,eax
001D  89 E3				mov		ebx,esp
001F  8B 15 00 00 00 00			mov		edx,dword ptr __ThreadDataSize
0025  52				push		edx
0026  6A 00				push		0x00000000
0028  53				push		ebx
0029  E8 00 00 00 00			call		memset
002E  83 C4 0C				add		esp,0x0000000c
0031  53				push		ebx
0032  8D 45 F8				lea		eax,-0x8[ebp]
0035  50				push		eax
0036  E8 00 00 00 00			call		__NTMainInit
003B  83 C4 08				add		esp,0x00000008
003E  E8 00 00 00 00			call		__CMain
0043  89 EC				mov		esp,ebp
0045  5D				pop		ebp
0046  5B				pop		ebx
0047  C3				ret		

Routine Size: 72 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

