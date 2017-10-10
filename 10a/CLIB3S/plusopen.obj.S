Module: plusopen
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000009A bytes
0000				__plusplus_open:
0000  53				push		ebx
0001  56				push		esi
0002  83 EC 48				sub		esp,0x00000048
0005  8B 54 24 58			mov		edx,dword ptr 0x58[esp]
0009  8B 02				mov		eax,dword ptr [edx]
000B  89 C3				mov		ebx,eax
000D  83 E3 03				and		ebx,0x00000003
0010  83 FB 03				cmp		ebx,0x00000003
0013  75 07				jne		L$1
0015  BB 22 00 00 00			mov		ebx,0x00000022
001A  EB 1B				jmp		L$5
001C				L$1:
001C  A8 01				test		al,0x01
001E  74 04				je		L$2
0020  31 DB				xor		ebx,ebx
0022  EB 13				jmp		L$5
0024				L$2:
0024  A8 02				test		al,0x02
0026  75 0A				jne		L$4
0028				L$3:
0028  B8 FF FF FF FF			mov		eax,0xffffffff
002D  E9 62 00 00 00			jmp		L$12
0032				L$4:
0032  BB 21 00 00 00			mov		ebx,0x00000021
0037				L$5:
0037  A8 08				test		al,0x08
0039  74 03				je		L$6
003B  80 CB 10				or		bl,0x10
003E				L$6:
003E  A8 10				test		al,0x10
0040  74 03				je		L$7
0042  80 CB 40				or		bl,0x40
0045				L$7:
0045  A8 20				test		al,0x20
0047  74 03				je		L$8
0049  80 E3 DF				and		bl,0xdf
004C				L$8:
004C  F6 C4 01				test		ah,0x01
004F  74 05				je		L$9
0051  80 CF 02				or		bh,0x02
0054  EB 0A				jmp		L$10
0056				L$9:
0056  8A 0A				mov		cl,byte ptr [edx]
0058  80 C9 80				or		cl,0x80
005B  80 CF 01				or		bh,0x01
005E  88 0A				mov		byte ptr [edx],cl
0060				L$10:
0060  A8 40				test		al,0x40
0062  74 1D				je		L$11
0064  89 D8				mov		eax,ebx
0066  0C 20				or		al,0x20
0068  85 C0				test		eax,eax
006A  74 15				je		L$11
006C  89 E0				mov		eax,esp
006E  50				push		eax
006F  8B 54 24 58			mov		edx,dword ptr 0x58[esp]
0073  52				push		edx
0074  E8 00 00 00 00			call		stat
0079  83 C4 08				add		esp,0x00000008
007C  83 F8 FF				cmp		eax,0xffffffff
007F  75 A7				jne		L$3
0081				L$11:
0081  8B 4C 24 5C			mov		ecx,dword ptr 0x5c[esp]
0085  51				push		ecx
0086  53				push		ebx
0087  8B 74 24 5C			mov		esi,dword ptr 0x5c[esp]
008B  56				push		esi
008C  E8 00 00 00 00			call		open
0091  83 C4 0C				add		esp,0x0000000c
0094				L$12:
0094  83 C4 48				add		esp,0x00000048
0097  5E				pop		esi
0098  5B				pop		ebx
0099  C3				ret		

Routine Size: 154 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

