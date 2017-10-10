Module: gtcmdwnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000CF bytes
0000				_bgetcmd:
0000  53				push		ebx
0001  56				push		esi
0002  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0006  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
000A  E8 00 00 00 00			call		_GetCommandLineA
000F  89 C2				mov		edx,eax
0011  85 C0				test		eax,eax
0013  75 12				jne		L$2
0015  85 F6				test		esi,esi
0017  74 07				je		L$1
0019  85 DB				test		ebx,ebx
001B  74 03				je		L$1
001D  C6 06 00				mov		byte ptr [esi],0x00
0020				L$1:
0020  31 D2				xor		edx,edx
0022  89 D0				mov		eax,edx
0024  5E				pop		esi
0025  5B				pop		ebx
0026  C3				ret		
0027				L$2:
0027  31 C9				xor		ecx,ecx
0029  8A 08				mov		cl,byte ptr [eax]
002B  83 F9 22				cmp		ecx,0x00000022
002E  75 16				jne		L$6
0030				L$3:
0030  40				inc		eax
0031  31 D2				xor		edx,edx
0033  8A 10				mov		dl,byte ptr [eax]
0035  83 FA 22				cmp		edx,0x00000022
0038  74 04				je		L$4
003A  84 D2				test		dl,dl
003C  75 F2				jne		L$3
003E				L$4:
003E  80 38 00				cmp		byte ptr [eax],0x00
0041  74 26				je		L$7
0043				L$5:
0043  40				inc		eax
0044  EB 23				jmp		L$7
0046				L$6:
0046  8A 10				mov		dl,byte ptr [eax]
0048  FE C2				inc		dl
004A  81 E2 FF 00 00 00			and		edx,0x000000ff
0050  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
0056  80 E2 02				and		dl,0x02
0059  81 E2 FF 00 00 00			and		edx,0x000000ff
005F  75 08				jne		L$7
0061  80 38 00				cmp		byte ptr [eax],0x00
0064  74 03				je		L$7
0066  40				inc		eax
0067  EB DD				jmp		L$6
0069				L$7:
0069  8A 10				mov		dl,byte ptr [eax]
006B  FE C2				inc		dl
006D  81 E2 FF 00 00 00			and		edx,0x000000ff
0073  8A 92 00 00 00 00			mov		dl,byte ptr _IsTable[edx]
0079  80 E2 02				and		dl,0x02
007C  81 E2 FF 00 00 00			and		edx,0x000000ff
0082  75 BF				jne		L$5
0084  85 F6				test		esi,esi
0086  75 11				jne		L$10
0088  89 C2				mov		edx,eax
008A  EB 01				jmp		L$9
008C				L$8:
008C  42				inc		edx
008D				L$9:
008D  80 3A 00				cmp		byte ptr [edx],0x00
0090  75 FA				jne		L$8
0092  29 C2				sub		edx,eax
0094  89 D0				mov		eax,edx
0096  5E				pop		esi
0097  5B				pop		ebx
0098  C3				ret		
0099				L$10:
0099  85 DB				test		ebx,ebx
009B  74 16				je		L$14
009D  89 F2				mov		edx,esi
009F  EB 0A				jmp		L$12
00A1				L$11:
00A1  8A 28				mov		ch,byte ptr [eax]
00A3  84 ED				test		ch,ch
00A5  74 07				je		L$13
00A7  40				inc		eax
00A8  88 2A				mov		byte ptr [edx],ch
00AA  42				inc		edx
00AB				L$12:
00AB  4B				dec		ebx
00AC  75 F3				jne		L$11
00AE				L$13:
00AE  C6 02 00				mov		byte ptr [edx],0x00
00B1  29 F2				sub		edx,esi
00B3				L$14:
00B3  89 D0				mov		eax,edx
00B5  5E				pop		esi
00B6  5B				pop		ebx
00B7  C3				ret		

Routine Size: 184 bytes,    Routine Base: _TEXT + 0000

00B8				getcmd:
00B8  68 FF FF FF 7F			push		0x7fffffff
00BD  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00C1  52				push		edx
00C2  E8 00 00 00 00			call		_bgetcmd
00C7  83 C4 08				add		esp,0x00000008
00CA  8B 44 24 04			mov		eax,dword ptr 0x4[esp]
00CE  C3				ret		

Routine Size: 23 bytes,    Routine Base: _TEXT + 00B8

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

