Module: strnicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000057 bytes
0000				strnicmp_:
0000  51				push		ecx
0001  83 EC 04				sub		esp,0x00000004
0004				L$1:
0004  85 DB				test		ebx,ebx
0006  75 07				jne		L$3
0008				L$2:
0008  31 C0				xor		eax,eax
000A  83 C4 04				add		esp,0x00000004
000D  59				pop		ecx
000E  C3				ret		
000F				L$3:
000F  8A 2A				mov		ch,byte ptr [edx]
0011  8A 08				mov		cl,byte ptr [eax]
0013  88 2C 24				mov		byte ptr [esp],ch
0016  80 F9 41				cmp		cl,0x41
0019  72 08				jb		L$4
001B  80 F9 5A				cmp		cl,0x5a
001E  77 03				ja		L$4
0020  80 C1 20				add		cl,0x20
0023				L$4:
0023  8A 2C 24				mov		ch,byte ptr [esp]
0026  80 FD 41				cmp		ch,0x41
0029  72 0B				jb		L$5
002B  80 FD 5A				cmp		ch,0x5a
002E  77 06				ja		L$5
0030  80 C5 20				add		ch,0x20
0033  88 2C 24				mov		byte ptr [esp],ch
0036				L$5:
0036  8A 2C 24				mov		ch,byte ptr [esp]
0039  38 E9				cmp		cl,ch
003B  74 11				je		L$6
003D  31 D2				xor		edx,edx
003F  31 C0				xor		eax,eax
0041  88 CA				mov		dl,cl
0043  88 E8				mov		al,ch
0045  29 C2				sub		edx,eax
0047  89 D0				mov		eax,edx
0049  83 C4 04				add		esp,0x00000004
004C  59				pop		ecx
004D  C3				ret		
004E				L$6:
004E  84 ED				test		ch,ch
0050  74 B6				je		L$2
0052  40				inc		eax
0053  42				inc		edx
0054  4B				dec		ebx
0055  EB AD				jmp		L$1

Routine Size: 87 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

