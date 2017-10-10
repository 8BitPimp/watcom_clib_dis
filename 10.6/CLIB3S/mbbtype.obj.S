Module: mbbtype
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000099 bytes
0000				_mbbtype:
0000  8B 15 00 00 00 00			mov		edx,dword ptr __IsDBCS
0006  85 D2				test		edx,edx
0008  74 54				je		L$7
000A  83 7C 24 08 01			cmp		dword ptr 0x8[esp],0x00000001
000F  75 29				jne		L$4
0011  85 D2				test		edx,edx
0013  74 15				je		L$1
0015  31 C0				xor		eax,eax
0017  8A 44 24 04			mov		al,byte ptr 0x4[esp]
001B  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
0021  24 02				and		al,0x02
0023  25 FF 00 00 00			and		eax,0x000000ff
0028  EB 02				jmp		L$2
002A				L$1:
002A  31 C0				xor		eax,eax
002C				L$2:
002C  74 06				je		L$3
002E  B8 02 00 00 00			mov		eax,0x00000002
0033  C3				ret		
0034				L$3:
0034  B8 FF FF FF FF			mov		eax,0xffffffff
0039  C3				ret		
003A				L$4:
003A  85 D2				test		edx,edx
003C  74 15				je		L$5
003E  31 C0				xor		eax,eax
0040  8A 44 24 04			mov		al,byte ptr 0x4[esp]
0044  8A 80 01 00 00 00			mov		al,byte ptr __MBCSIsTable+0x1[eax]
004A  24 01				and		al,0x01
004C  25 FF 00 00 00			and		eax,0x000000ff
0051  EB 02				jmp		L$6
0053				L$5:
0053  31 C0				xor		eax,eax
0055				L$6:
0055  0F 95 C0				setne		al
0058  25 FF 00 00 00			and		eax,0x000000ff
005D  C3				ret		
005E				L$7:
005E  31 C0				xor		eax,eax
0060  C3				ret		

Routine Size: 97 bytes,    Routine Base: _TEXT + 0000

0061				_mbsbtype:
0061  53				push		ebx
0062  56				push		esi
0063  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0067  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
006B  B8 FF FF FF FF			mov		eax,0xffffffff
0070				L$8:
0070  89 F2				mov		edx,esi
0072  4E				dec		esi
0073  85 D2				test		edx,edx
0075  7C 1F				jl		L$10
0077  8A 13				mov		dl,byte ptr [ebx]
0079  84 D2				test		dl,dl
007B  75 08				jne		L$9
007D  B8 FF FF FF FF			mov		eax,0xffffffff
0082  5E				pop		esi
0083  5B				pop		ebx
0084  C3				ret		
0085				L$9:
0085  50				push		eax
0086  31 C0				xor		eax,eax
0088  88 D0				mov		al,dl
008A  50				push		eax
008B  43				inc		ebx
008C  E8 00 00 00 00			call		_mbbtype
0091  83 C4 08				add		esp,0x00000008
0094  EB DA				jmp		L$8
0096				L$10:
0096  5E				pop		esi
0097  5B				pop		ebx
0098  C3				ret		

Routine Size: 56 bytes,    Routine Base: _TEXT + 0061

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

