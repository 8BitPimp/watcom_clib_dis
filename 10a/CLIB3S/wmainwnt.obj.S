Module: wmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CE bytes
0000				__WinMain:
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
003B  8B 1D 00 00 00 00			mov		ebx,dword ptr __ASTACKSIZ
0041  83 C3 03				add		ebx,0x00000003
0044  83 C4 08				add		esp,0x00000008
0047  80 E3 FC				and		bl,0xfc
004A  E8 00 00 00 00			call		stackavail
004F  39 C3				cmp		ebx,eax
0051  73 08				jae		L$1
0053  89 D8				mov		eax,ebx
0055  29 C4				sub		esp,eax
0057  89 E0				mov		eax,esp
0059  EB 02				jmp		L$2
005B				L$1:
005B  31 C0				xor		eax,eax
005D				L$2:
005D  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
0063  01 D0				add		eax,edx
0065  A3 00 00 00 00			mov		dword ptr __ASTACKPTR,eax
006A  E8 00 00 00 00			call		__CommonInit
006F  E8 00 00 00 00			call		_GetCommandLineA
0074  50				push		eax
0075  E8 00 00 00 00			call		strdup
007A  83 C4 04				add		esp,0x00000004
007D				L$3:
007D  8A 10				mov		dl,byte ptr [eax]
007F  FE C2				inc		dl
0081  81 E2 FF 00 00 00			and		edx,0x000000ff
0087  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
008E  75 08				jne		L$4
0090  80 38 00				cmp		byte ptr [eax],0x00
0093  74 03				je		L$4
0095  40				inc		eax
0096  EB E5				jmp		L$3
0098				L$4:
0098  8A 10				mov		dl,byte ptr [eax]
009A  FE C2				inc		dl
009C  81 E2 FF 00 00 00			and		edx,0x000000ff
00A2  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
00A9  74 03				je		L$5
00AB  40				inc		eax
00AC  EB EA				jmp		L$4
00AE				L$5:
00AE  6A 0A				push		0x0000000a
00B0  50				push		eax
00B1  6A 00				push		0x00000000
00B3  6A 00				push		0x00000000
00B5  E8 00 00 00 00			call		_GetModuleHandleA
00BA  50				push		eax
00BB  E8 00 00 00 00			call		_WinMain
00C0  50				push		eax
00C1  E8 00 00 00 00			call		exit
00C6  83 C4 04				add		esp,0x00000004
00C9  89 EC				mov		esp,ebp
00CB  5D				pop		ebp
00CC  5B				pop		ebx
00CD  C3				ret		

Routine Size: 206 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

