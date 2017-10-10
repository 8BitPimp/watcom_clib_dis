Module: fstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000069 bytes
0000				_fstrnicmp:
0000  53				push		ebx
0001  06				push		es
0002  83 EC 04				sub		esp,0x00000004
0005  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
0009  8B 44 24 18			mov		eax,dword ptr 0x18[esp]
000D  8B 5C 24 20			mov		ebx,dword ptr 0x20[esp]
0011				L$1:
0011  85 DB				test		ebx,ebx
0013  75 04				jne		L$3
0015				L$2:
0015  31 C0				xor		eax,eax
0017  EB 4A				jmp		L$7
0019				L$3:
0019  8E 44 24 14			mov		es,dword ptr 0x14[esp]
001D  26 8A 0A				mov		cl,byte ptr es:[edx]
0020  80 F9 41				cmp		cl,0x41
0023  72 08				jb		L$4
0025  80 F9 5A				cmp		cl,0x5a
0028  77 03				ja		L$4
002A  80 C1 20				add		cl,0x20
002D				L$4:
002D  8E 44 24 1C			mov		es,dword ptr 0x1c[esp]
0031  26 8A 28				mov		ch,byte ptr es:[eax]
0034  88 2C 24				mov		byte ptr [esp],ch
0037  80 FD 41				cmp		ch,0x41
003A  72 0B				jb		L$5
003C  80 FD 5A				cmp		ch,0x5a
003F  77 06				ja		L$5
0041  80 C5 20				add		ch,0x20
0044  88 2C 24				mov		byte ptr [esp],ch
0047				L$5:
0047  8A 2C 24				mov		ch,byte ptr [esp]
004A  38 E9				cmp		cl,ch
004C  74 0C				je		L$6
004E  31 C0				xor		eax,eax
0050  31 D2				xor		edx,edx
0052  88 C8				mov		al,cl
0054  88 EA				mov		dl,ch
0056  29 D0				sub		eax,edx
0058  EB 09				jmp		L$7
005A				L$6:
005A  84 ED				test		ch,ch
005C  74 B7				je		L$2
005E  42				inc		edx
005F  40				inc		eax
0060  4B				dec		ebx
0061  EB AE				jmp		L$1
0063				L$7:
0063  83 C4 04				add		esp,0x00000004
0066  07				pop		es
0067  5B				pop		ebx
0068  C3				ret		

Routine Size: 105 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

