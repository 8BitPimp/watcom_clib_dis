Module: strnicmp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				strnicmp:
0000  53				push		ebx
0001  83 EC 04				sub		esp,0x00000004
0004  8B 54 24 0C			mov		edx,dword ptr 0xc[esp]
0008  8B 44 24 10			mov		eax,dword ptr 0x10[esp]
000C  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0010				L$1:
0010  85 DB				test		ebx,ebx
0012  75 07				jne		L$3
0014				L$2:
0014  31 C0				xor		eax,eax
0016  83 C4 04				add		esp,0x00000004
0019  5B				pop		ebx
001A  C3				ret		
001B				L$3:
001B  8A 28				mov		ch,byte ptr [eax]
001D  8A 0A				mov		cl,byte ptr [edx]
001F  88 2C 24				mov		byte ptr [esp],ch
0022  80 F9 41				cmp		cl,0x41
0025  72 08				jb		L$4
0027  80 F9 5A				cmp		cl,0x5a
002A  77 03				ja		L$4
002C  80 C1 20				add		cl,0x20
002F				L$4:
002F  8A 2C 24				mov		ch,byte ptr [esp]
0032  80 FD 41				cmp		ch,0x41
0035  72 0B				jb		L$5
0037  80 FD 5A				cmp		ch,0x5a
003A  77 06				ja		L$5
003C  80 C5 20				add		ch,0x20
003F  88 2C 24				mov		byte ptr [esp],ch
0042				L$5:
0042  8A 2C 24				mov		ch,byte ptr [esp]
0045  38 E9				cmp		cl,ch
0047  74 11				je		L$6
0049  31 D2				xor		edx,edx
004B  31 C0				xor		eax,eax
004D  88 CA				mov		dl,cl
004F  88 E8				mov		al,ch
0051  29 C2				sub		edx,eax
0053  89 D0				mov		eax,edx
0055  83 C4 04				add		esp,0x00000004
0058  5B				pop		ebx
0059  C3				ret		
005A				L$6:
005A  84 ED				test		ch,ch
005C  74 B6				je		L$2
005E  42				inc		edx
005F  40				inc		eax
0060  4B				dec		ebx
0061  EB AD				jmp		L$1

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

