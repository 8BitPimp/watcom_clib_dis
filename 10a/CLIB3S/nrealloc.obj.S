Module: nrealloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AF bytes
0000				realloc:
0000  53				push		ebx
0001  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0005  52				push		edx
0006  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
000A  53				push		ebx
000B  E8 00 00 00 00			call		_nrealloc
0010  83 C4 08				add		esp,0x00000008
0013  5B				pop		ebx
0014  C3				ret		

Routine Size: 21 bytes,    Routine Base: _TEXT + 0000

0015				_nrealloc:
0015  53				push		ebx
0016  56				push		esi
0017  57				push		edi
0018  55				push		ebp
0019  83 EC 04				sub		esp,0x00000004
001C  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0020  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0024  85 DB				test		ebx,ebx
0026  75 0E				jne		L$1
0028  56				push		esi
0029  E8 00 00 00 00			call		_nmalloc
002E  83 C4 04				add		esp,0x00000004
0031  E9 71 00 00 00			jmp		L$5
0036				L$1:
0036  85 F6				test		esi,esi
0038  75 0D				jne		L$2
003A  53				push		ebx
003B  E8 00 00 00 00			call		_nfree
0040  83 C4 04				add		esp,0x00000004
0043  31 C0				xor		eax,eax
0045  EB 60				jmp		L$5
0047				L$2:
0047  53				push		ebx
0048  E8 00 00 00 00			call		_nmsize
004D  83 C4 04				add		esp,0x00000004
0050  56				push		esi
0051  53				push		ebx
0052  89 C5				mov		ebp,eax
0054  E8 00 00 00 00			call		_nexpand
0059  83 C4 08				add		esp,0x00000008
005C  89 04 24				mov		dword ptr [esp],eax
005F  85 C0				test		eax,eax
0061  75 41				jne		L$4
0063  56				push		esi
0064  E8 00 00 00 00			call		_nmalloc
0069  83 C4 04				add		esp,0x00000004
006C  89 04 24				mov		dword ptr [esp],eax
006F  85 C0				test		eax,eax
0071  74 27				je		L$3
0073  89 C7				mov		edi,eax
0075  89 DE				mov		esi,ebx
0077  89 E9				mov		ecx,ebp
0079  06				push		es
007A  8C D8				mov		eax,ds
007C  8E C0				mov		es,eax
007E  57				push		edi
007F  89 C8				mov		eax,ecx
0081  C1 E9 02				shr		ecx,0x02
0084  F2 A5				repne movsd	
0086  8A C8				mov		cl,al
0088  80 E1 03				and		cl,0x03
008B  F2 A4				repne movsb	
008D  5F				pop		edi
008E  07				pop		es
008F  53				push		ebx
0090  E8 00 00 00 00			call		_nfree
0095  83 C4 04				add		esp,0x00000004
0098  EB 0A				jmp		L$4
009A				L$3:
009A  55				push		ebp
009B  53				push		ebx
009C  E8 00 00 00 00			call		_nexpand
00A1  83 C4 08				add		esp,0x00000008
00A4				L$4:
00A4  8B 04 24				mov		eax,dword ptr [esp]
00A7				L$5:
00A7  83 C4 04				add		esp,0x00000004
00AA  5D				pop		ebp
00AB  5F				pop		edi
00AC  5E				pop		esi
00AD  5B				pop		ebx
00AE  C3				ret		

Routine Size: 154 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

