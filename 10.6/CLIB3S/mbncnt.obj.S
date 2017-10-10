Module: mbncnt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000F8 bytes
0000				_mbsnccnt:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 04				sub		esp,0x00000004
0005  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0009  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0010  74 28				je		L$3
0012  8B 74 24 14			mov		esi,dword ptr 0x14[esp]
0016  31 DB				xor		ebx,ebx
0018  01 D6				add		esi,edx
001A				L$1:
001A  89 E0				mov		eax,esp
001C  50				push		eax
001D  52				push		edx
001E  E8 00 00 00 00			call		_mbgetcode
0023  83 C4 08				add		esp,0x00000008
0026  8B 0C 24				mov		ecx,dword ptr [esp]
0029  89 C2				mov		edx,eax
002B  85 C9				test		ecx,ecx
002D  74 07				je		L$2
002F  39 F0				cmp		eax,esi
0031  77 03				ja		L$2
0033  43				inc		ebx
0034  EB E4				jmp		L$1
0036				L$2:
0036  89 D8				mov		eax,ebx
0038  EB 04				jmp		L$4
003A				L$3:
003A  8B 44 24 14			mov		eax,dword ptr 0x14[esp]
003E				L$4:
003E  83 C4 04				add		esp,0x00000004
0041  5E				pop		esi
0042  5B				pop		ebx
0043  C3				ret		

Routine Size: 68 bytes,    Routine Base: _TEXT + 0000

0044				_mbsnbcnt:
0044  53				push		ebx
0045  83 EC 04				sub		esp,0x00000004
0048  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
004C  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0053  74 25				je		L$7
0055  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
0059				L$5:
0059  4B				dec		ebx
005A  83 FB FF				cmp		ebx,0xffffffff
005D  74 12				je		L$6
005F  89 E2				mov		edx,esp
0061  52				push		edx
0062  50				push		eax
0063  E8 00 00 00 00			call		_mbgetcode
0068  83 C4 08				add		esp,0x00000008
006B  83 3C 24 00			cmp		dword ptr [esp],0x00000000
006F  75 E8				jne		L$5
0071				L$6:
0071  2B 44 24 0C			sub		eax,dword ptr 0xc[esp]
0075  83 C4 04				add		esp,0x00000004
0078  5B				pop		ebx
0079  C3				ret		
007A				L$7:
007A  89 D8				mov		eax,ebx
007C  83 C4 04				add		esp,0x00000004
007F  5B				pop		ebx
0080  C3				ret		

Routine Size: 61 bytes,    Routine Base: _TEXT + 0044

0081				_mbsninc:
0081  56				push		esi
0082  83 3D 00 00 00 00 00		cmp		dword ptr __IsDBCS,0x00000000
0089  74 16				je		L$8
008B  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
008F  51				push		ecx
0090  8B 74 24 0C			mov		esi,dword ptr 0xc[esp]
0094  56				push		esi
0095  E8 00 00 00 00			call		_mbsnbcnt
009A  83 C4 08				add		esp,0x00000008
009D  01 F0				add		eax,esi
009F  5E				pop		esi
00A0  C3				ret		
00A1				L$8:
00A1  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
00A5  03 44 24 0C			add		eax,dword ptr 0xc[esp]
00A9  5E				pop		esi
00AA  C3				ret		

Routine Size: 42 bytes,    Routine Base: _TEXT + 0081

00AB				__mbsninc:
00AB  53				push		ebx
00AC  56				push		esi
00AD  8B 35 00 00 00 00			mov		esi,dword ptr __IsDBCS
00B3  8B 44 24 0C			mov		eax,dword ptr 0xc[esp]
00B7  8B 5C 24 10			mov		ebx,dword ptr 0x10[esp]
00BB  85 F6				test		esi,esi
00BD  74 2E				je		L$12
00BF				L$9:
00BF  85 DB				test		ebx,ebx
00C1  7E 2C				jle		L$13
00C3  85 F6				test		esi,esi
00C5  74 15				je		L$10
00C7  31 D2				xor		edx,edx
00C9  8A 10				mov		dl,byte ptr [eax]
00CB  8A 92 01 00 00 00			mov		dl,byte ptr __MBCSIsTable+0x1[edx]
00D1  80 E2 01				and		dl,0x01
00D4  81 E2 FF 00 00 00			and		edx,0x000000ff
00DA  EB 02				jmp		L$11
00DC				L$10:
00DC  31 D2				xor		edx,edx
00DE				L$11:
00DE  0F 95 C2				setne		dl
00E1  81 E2 FF 00 00 00			and		edx,0x000000ff
00E7  42				inc		edx
00E8  4B				dec		ebx
00E9  01 D0				add		eax,edx
00EB  EB D2				jmp		L$9
00ED				L$12:
00ED  01 D8				add		eax,ebx
00EF				L$13:
00EF  89 35 00 00 00 00			mov		dword ptr __IsDBCS,esi
00F5  5E				pop		esi
00F6  5B				pop		ebx
00F7  C3				ret		

Routine Size: 77 bytes,    Routine Base: _TEXT + 00AB

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

