Module: gtcmdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A1 bytes
0000				_bgetcmd:
0000  53				push		ebx
0001  56				push		esi
0002  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0006  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000A  E8 00 00 00 00			call		_GetCommandLineA
000F  85 C0				test		eax,eax
0011  75 12				jne		L$2
0013  85 F6				test		esi,esi
0015  74 07				je		L$1
0017  85 DB				test		ebx,ebx
0019  74 03				je		L$1
001B  C6 06 00				mov		byte ptr [esi],0x00
001E				L$1:
001E  31 D2				xor		edx,edx
0020  89 D0				mov		eax,edx
0022  5E				pop		esi
0023  5B				pop		ebx
0024  C3				ret		
0025				L$2:
0025  8A 10				mov		dl,byte ptr [eax]
0027  FE C2				inc		dl
0029  81 E2 FF 00 00 00			and		edx,0x000000ff
002F  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
0036  75 08				jne		L$3
0038  80 38 00				cmp		byte ptr [eax],0x00
003B  74 03				je		L$3
003D  40				inc		eax
003E  EB E5				jmp		L$2
0040				L$3:
0040  8A 10				mov		dl,byte ptr [eax]
0042  FE C2				inc		dl
0044  81 E2 FF 00 00 00			and		edx,0x000000ff
004A  F6 82 00 00 00 00 02		test		byte ptr _IsTable[edx],0x02
0051  74 03				je		L$4
0053  40				inc		eax
0054  EB EA				jmp		L$3
0056				L$4:
0056  85 F6				test		esi,esi
0058  75 11				jne		L$7
005A  89 C2				mov		edx,eax
005C  EB 01				jmp		L$6
005E				L$5:
005E  42				inc		edx
005F				L$6:
005F  80 3A 00				cmp		byte ptr [edx],0x00
0062  75 FA				jne		L$5
0064  29 C2				sub		edx,eax
0066  89 D0				mov		eax,edx
0068  5E				pop		esi
0069  5B				pop		ebx
006A  C3				ret		
006B				L$7:
006B  85 DB				test		ebx,ebx
006D  74 AF				je		L$1
006F  89 F2				mov		edx,esi
0071  EB 0A				jmp		L$9
0073				L$8:
0073  8A 28				mov		ch,byte ptr [eax]
0075  84 ED				test		ch,ch
0077  74 07				je		L$10
0079  40				inc		eax
007A  88 2A				mov		byte ptr [edx],ch
007C  42				inc		edx
007D				L$9:
007D  4B				dec		ebx
007E  75 F3				jne		L$8
0080				L$10:
0080  C6 02 00				mov		byte ptr [edx],0x00
0083  29 F2				sub		edx,esi
0085  89 D0				mov		eax,edx
0087  5E				pop		esi
0088  5B				pop		ebx
0089  C3				ret		

Routine Size: 138 bytes,    Routine Base: _TEXT + 0000

008A				getcmd:
008A  68 FF FF FF 7F			push		0x7fffffff
008F  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
0093  52				push		edx
0094  E8 00 00 00 00			call		_bgetcmd
0099  83 C4 08				add		esp,0x00000008
009C  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00A0  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 008A

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

