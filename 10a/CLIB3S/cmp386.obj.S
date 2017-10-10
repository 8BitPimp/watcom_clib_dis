Module: cmp386
GROUP: 'DGROUP' _DATA

Segment: _TEXT PARA USE32 000000AC bytes
0000				strcmp:
0000  52				push		edx
0001  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0005  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0009  53				push		ebx
000A  51				push		ecx
000B  89 C3				mov		ebx,eax
000D  39 D0				cmp		eax,edx
000F  74 6C				je		L$2
0011				L$1:
0011  8B 03				mov		eax,dword ptr [ebx]
0013  8B 0A				mov		ecx,dword ptr [edx]
0015  39 C1				cmp		ecx,eax
0017  75 6A				jne		L$3
0019  F7 D1				not		ecx
001B  05 FF FE FE FE			add		eax,0xfefefeff
0020  21 C8				and		eax,ecx
0022  25 80 80 80 80			and		eax,0x80808080
0027  75 54				jne		L$2
0029  8B 43 04				mov		eax,dword ptr 0x4[ebx]
002C  8B 4A 04				mov		ecx,dword ptr 0x4[edx]
002F  39 C1				cmp		ecx,eax
0031  75 50				jne		L$3
0033  F7 D1				not		ecx
0035  05 FF FE FE FE			add		eax,0xfefefeff
003A  21 C8				and		eax,ecx
003C  25 80 80 80 80			and		eax,0x80808080
0041  75 3A				jne		L$2
0043  8B 43 08				mov		eax,dword ptr 0x8[ebx]
0046  8B 4A 08				mov		ecx,dword ptr 0x8[edx]
0049  39 C1				cmp		ecx,eax
004B  75 36				jne		L$3
004D  F7 D1				not		ecx
004F  05 FF FE FE FE			add		eax,0xfefefeff
0054  21 C8				and		eax,ecx
0056  25 80 80 80 80			and		eax,0x80808080
005B  75 20				jne		L$2
005D  8B 43 0C				mov		eax,dword ptr 0xc[ebx]
0060  8B 4A 0C				mov		ecx,dword ptr 0xc[edx]
0063  39 C1				cmp		ecx,eax
0065  75 1C				jne		L$3
0067  83 C3 10				add		ebx,0x00000010
006A  83 C2 10				add		edx,0x00000010
006D  F7 D1				not		ecx
006F  05 FF FE FE FE			add		eax,0xfefefeff
0074  21 C8				and		eax,ecx
0076  25 80 80 80 80			and		eax,0x80808080
007B  74 94				je		L$1
007D				L$2:
007D  29 C0				sub		eax,eax
007F  59				pop		ecx
0080  5B				pop		ebx
0081  5A				pop		edx
0082  C3				ret		
0083				L$3:
0083  38 C8				cmp		al,cl
0085  75 1D				jne		L$4
0087  3C 00				cmp		al,0x00
0089  74 F2				je		L$2
008B  38 EC				cmp		ah,ch
008D  75 15				jne		L$4
008F  80 FC 00				cmp		ah,0x00
0092  74 E9				je		L$2
0094  C1 E8 10				shr		eax,0x10
0097  C1 E9 10				shr		ecx,0x10
009A  38 C8				cmp		al,cl
009C  75 06				jne		L$4
009E  3C 00				cmp		al,0x00
00A0  74 DB				je		L$2
00A2  38 EC				cmp		ah,ch
00A4				L$4:
00A4  19 C0				sbb		eax,eax
00A6  0C 01				or		al,0x01
00A8  59				pop		ecx
00A9  5B				pop		ebx
00AA  5A				pop		edx
00AB  C3				ret		

Routine Size: 172 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: _DATA WORD USE32 00000000 bytes

