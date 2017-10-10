Module: wmainwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000C4 bytes
0000				__WinMain:
0000  53				push		ebx
0001  51				push		ecx
0002  52				push		edx
0003  55				push		ebp
0004  89 E5				mov		ebp,esp
0006  83 EC 08				sub		esp,0x00000008
0009  B8 01 00 00 00			mov		eax,0x00000001
000E  E8 00 00 00 00			call		__InitRtns
0013  A1 00 00 00 00			mov		eax,dword ptr ___ThreadDataSize
0018  83 C0 03				add		eax,0x00000003
001B  24 FC				and		al,0xfc
001D  31 D2				xor		edx,edx
001F  29 C4				sub		esp,eax
0021  89 E1				mov		ecx,esp
0023  8B 1D 00 00 00 00			mov		ebx,dword ptr ___ThreadDataSize
0029  89 C8				mov		eax,ecx
002B  E8 00 00 00 00			call		memset_
0030  8D 45 F8				lea		eax,-0x8[ebp]
0033  89 CA				mov		edx,ecx
0035  E8 00 00 00 00			call		__NTMainInit_
003A  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
0040  83 C2 03				add		edx,0x00000003
0043  80 E2 FC				and		dl,0xfc
0046  E8 00 00 00 00			call		stackavail_
004B  39 C2				cmp		edx,eax
004D  73 08				jae		L$1
004F  89 D0				mov		eax,edx
0051  29 C4				sub		esp,eax
0053  89 E0				mov		eax,esp
0055  EB 02				jmp		L$2
0057				L$1:
0057  31 C0				xor		eax,eax
0059				L$2:
0059  8B 15 00 00 00 00			mov		edx,dword ptr __ASTACKSIZ
005F  01 D0				add		eax,edx
0061  A3 00 00 00 00			mov		dword ptr __ASTACKPTR,eax
0066  E8 00 00 00 00			call		__CommonInit_
006B  E8 00 00 00 00			call		_GetCommandLineA
0070  E8 00 00 00 00			call		strdup_
0075				L$3:
0075  8A 10				mov		dl,byte ptr [eax]
0077  FE C2				inc		dl
0079  81 E2 FF 00 00 00			and		edx,0x000000ff
007F  F6 82 00 00 00 00 02		test		byte ptr __IsTable[edx],0x02
0086  75 08				jne		L$4
0088  80 38 00				cmp		byte ptr [eax],0x00
008B  74 03				je		L$4
008D  40				inc		eax
008E  EB E5				jmp		L$3
0090				L$4:
0090  8A 10				mov		dl,byte ptr [eax]
0092  FE C2				inc		dl
0094  81 E2 FF 00 00 00			and		edx,0x000000ff
009A  F6 82 00 00 00 00 02		test		byte ptr __IsTable[edx],0x02
00A1  74 03				je		L$5
00A3  40				inc		eax
00A4  EB EA				jmp		L$4
00A6				L$5:
00A6  6A 0A				push		0x0000000a
00A8  50				push		eax
00A9  6A 00				push		0x00000000
00AB  6A 00				push		0x00000000
00AD  E8 00 00 00 00			call		_GetModuleHandleA
00B2  50				push		eax
00B3  E8 00 00 00 00			call		_WinMain
00B8  E8 00 00 00 00			call		exit_
00BD  89 EC				mov		esp,ebp
00BF  5D				pop		ebp
00C0  5A				pop		edx
00C1  59				pop		ecx
00C2  5B				pop		ebx
00C3  C3				ret		

Routine Size: 196 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

