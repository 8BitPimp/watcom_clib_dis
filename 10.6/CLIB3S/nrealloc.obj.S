Module: nrealloc
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000A9 bytes
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
0019  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
001D  8B 7C 24 18			mov		edi,dword ptr 0x18[esp]
0021  85 DB				test		ebx,ebx
0023  75 0E				jne		L$1
0025  57				push		edi
0026  E8 00 00 00 00			call		_nmalloc
002B  83 C4 04				add		esp,0x00000004
002E  5D				pop		ebp
002F  5F				pop		edi
0030  5E				pop		esi
0031  5B				pop		ebx
0032  C3				ret		
0033				L$1:
0033  85 FF				test		edi,edi
0035  75 10				jne		L$2
0037  53				push		ebx
0038  E8 00 00 00 00			call		_nfree
003D  83 C4 04				add		esp,0x00000004
0040  31 C0				xor		eax,eax
0042  5D				pop		ebp
0043  5F				pop		edi
0044  5E				pop		esi
0045  5B				pop		ebx
0046  C3				ret		
0047				L$2:
0047  53				push		ebx
0048  E8 00 00 00 00			call		_nmsize
004D  83 C4 04				add		esp,0x00000004
0050  57				push		edi
0051  53				push		ebx
0052  89 C6				mov		esi,eax
0054  E8 00 00 00 00			call		_nexpand
0059  83 C4 08				add		esp,0x00000008
005C  89 C5				mov		ebp,eax
005E  85 C0				test		eax,eax
0060  75 40				jne		L$4
0062  57				push		edi
0063  E8 00 00 00 00			call		_nmalloc
0068  83 C4 04				add		esp,0x00000004
006B  89 C5				mov		ebp,eax
006D  85 C0				test		eax,eax
006F  74 27				je		L$3
0071  89 F1				mov		ecx,esi
0073  89 C7				mov		edi,eax
0075  89 DE				mov		esi,ebx
0077  06				push		es
0078  8C D8				mov		eax,ds
007A  8E C0				mov		es,eax
007C  57				push		edi
007D  89 C8				mov		eax,ecx
007F  C1 E9 02				shr		ecx,0x02
0082  F2 A5				repne movsd	
0084  8A C8				mov		cl,al
0086  80 E1 03				and		cl,0x03
0089  F2 A4				repne movsb	
008B  5F				pop		edi
008C  07				pop		es
008D  53				push		ebx
008E  E8 00 00 00 00			call		_nfree
0093  83 C4 04				add		esp,0x00000004
0096  EB 0A				jmp		L$4
0098				L$3:
0098  56				push		esi
0099  53				push		ebx
009A  E8 00 00 00 00			call		_nexpand
009F  83 C4 08				add		esp,0x00000008
00A2				L$4:
00A2  89 E8				mov		eax,ebp
00A4  5D				pop		ebp
00A5  5F				pop		edi
00A6  5E				pop		esi
00A7  5B				pop		ebx
00A8  C3				ret		

Routine Size: 148 bytes,    Routine Base: _TEXT + 0015

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

