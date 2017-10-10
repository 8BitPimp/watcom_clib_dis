Module: memicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000053 bytes
0000				_memicmp_:
0000				memicmp_:
0000  51				push		ecx
0001  83 EC 04				sub		esp,0x00000004
0004  EB 42				jmp		L$5
0006				L$1:
0006  8A 2A				mov		ch,byte ptr [edx]
0008  8A 08				mov		cl,byte ptr [eax]
000A  88 2C 24				mov		byte ptr [esp],ch
000D  80 F9 41				cmp		cl,0x41
0010  72 08				jb		L$2
0012  80 F9 5A				cmp		cl,0x5a
0015  77 03				ja		L$2
0017  80 C1 20				add		cl,0x20
001A				L$2:
001A  8A 2C 24				mov		ch,byte ptr [esp]
001D  80 FD 41				cmp		ch,0x41
0020  72 0B				jb		L$3
0022  80 FD 5A				cmp		ch,0x5a
0025  77 06				ja		L$3
0027  80 C5 20				add		ch,0x20
002A  88 2C 24				mov		byte ptr [esp],ch
002D				L$3:
002D  8A 2C 24				mov		ch,byte ptr [esp]
0030  38 E9				cmp		cl,ch
0032  74 11				je		L$4
0034  31 D2				xor		edx,edx
0036  31 C0				xor		eax,eax
0038  88 CA				mov		dl,cl
003A  88 E8				mov		al,ch
003C  29 C2				sub		edx,eax
003E  89 D0				mov		eax,edx
0040  83 C4 04				add		esp,0x00000004
0043  59				pop		ecx
0044  C3				ret		
0045				L$4:
0045  40				inc		eax
0046  42				inc		edx
0047  4B				dec		ebx
0048				L$5:
0048  85 DB				test		ebx,ebx
004A  75 BA				jne		L$1
004C  31 C0				xor		eax,eax
004E  83 C4 04				add		esp,0x00000004
0051  59				pop		ecx
0052  C3				ret		

Routine Size: 83 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

