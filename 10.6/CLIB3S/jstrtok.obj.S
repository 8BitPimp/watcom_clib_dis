Module: jstrtok
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A8 bytes
0000				jstrtok:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0007  85 D2				test		edx,edx
0009  75 07				jne		L$1
000B  A1 00 00 00 00			mov		eax,dword ptr DGROUP:L$9
0010  EB 02				jmp		L$2
0012				L$1:
0012  89 D0				mov		eax,edx
0014				L$2:
0014  85 C0				test		eax,eax
0016  0F 84 88 00 00 00			je		L$8
001C  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0020  53				push		ebx
0021  50				push		eax
0022  E8 00 00 00 00			call		jstrskip
0027  83 C4 08				add		esp,0x00000008
002A  89 C6				mov		esi,eax
002C  85 C0				test		eax,eax
002E  0F 84 70 00 00 00			je		L$8
0034  80 38 00				cmp		byte ptr [eax],0x00
0037  74 1B				je		L$3
0039  31 D2				xor		edx,edx
003B  8A 10				mov		dl,byte ptr [eax]
003D  8A 92 01 00 00 00			mov		dl,byte ptr _IsKTable+0x1[edx]
0043  80 E2 04				and		dl,0x04
0046  81 E2 FF 00 00 00			and		edx,0x000000ff
004C  74 0C				je		L$4
004E  80 78 01 00			cmp		byte ptr 0x1[eax],0x00
0052  75 06				jne		L$4
0054				L$3:
0054  31 C0				xor		eax,eax
0056  5F				pop		edi
0057  5E				pop		esi
0058  5B				pop		ebx
0059  C3				ret		
005A				L$4:
005A  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
005E  51				push		ecx
005F  56				push		esi
0060  E8 00 00 00 00			call		jstrmatch
0065  83 C4 08				add		esp,0x00000008
0068  89 C2				mov		edx,eax
006A  85 C0				test		eax,eax
006C  74 36				je		L$8
006E  80 38 00				cmp		byte ptr [eax],0x00
0071  75 0A				jne		L$5
0073  31 FF				xor		edi,edi
0075  89 3D 00 00 00 00			mov		dword ptr DGROUP:L$9,edi
007B  EB 25				jmp		L$7
007D				L$5:
007D  31 DB				xor		ebx,ebx
007F  8A 18				mov		bl,byte ptr [eax]
0081  8A 9B 01 00 00 00			mov		bl,byte ptr _IsKTable+0x1[ebx]
0087  80 E3 04				and		bl,0x04
008A  81 E3 FF 00 00 00			and		ebx,0x000000ff
0090  74 06				je		L$6
0092  8D 50 01				lea		edx,0x1[eax]
0095  C6 00 00				mov		byte ptr [eax],0x00
0098				L$6:
0098  C6 02 00				mov		byte ptr [edx],0x00
009B  42				inc		edx
009C  89 15 00 00 00 00			mov		dword ptr DGROUP:L$9,edx
00A2				L$7:
00A2  89 F0				mov		eax,esi
00A4				L$8:
00A4  5F				pop		edi
00A5  5E				pop		esi
00A6  5B				pop		ebx
00A7  C3				ret		

Routine Size: 168 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000004 bytes
0000				L$9:

BSS Size: 4 bytes

