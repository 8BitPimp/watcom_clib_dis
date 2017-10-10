Module: fstrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000061 bytes
0000				_fstrnicmp_:
0000  06				push		es
0001  0F A0				push		fs
0003  83 EC 04				sub		esp,0x00000004
0006  8E C2				mov		es,edx
0008  8E E1				mov		fs,ecx
000A  8B 54 24 10			mov		edx,dword ptr 0x10[esp]
000E				L$1:
000E  85 D2				test		edx,edx
0010  75 04				jne		L$3
0012				L$2:
0012  31 C0				xor		eax,eax
0014  EB 42				jmp		L$7
0016				L$3:
0016  26 8A 08				mov		cl,byte ptr es:[eax]
0019  80 F9 41				cmp		cl,0x41
001C  72 08				jb		L$4
001E  80 F9 5A				cmp		cl,0x5a
0021  77 03				ja		L$4
0023  80 C1 20				add		cl,0x20
0026				L$4:
0026  64 8A 2B				mov		ch,byte ptr fs:[ebx]
0029  88 2C 24				mov		byte ptr [esp],ch
002C  80 FD 41				cmp		ch,0x41
002F  72 0B				jb		L$5
0031  80 FD 5A				cmp		ch,0x5a
0034  77 06				ja		L$5
0036  80 C5 20				add		ch,0x20
0039  88 2C 24				mov		byte ptr [esp],ch
003C				L$5:
003C  8A 2C 24				mov		ch,byte ptr [esp]
003F  38 E9				cmp		cl,ch
0041  74 0C				je		L$6
0043  31 C0				xor		eax,eax
0045  31 D2				xor		edx,edx
0047  88 C8				mov		al,cl
0049  88 EA				mov		dl,ch
004B  29 D0				sub		eax,edx
004D  EB 09				jmp		L$7
004F				L$6:
004F  84 ED				test		ch,ch
0051  74 BF				je		L$2
0053  40				inc		eax
0054  43				inc		ebx
0055  4A				dec		edx
0056  EB B6				jmp		L$1
0058				L$7:
0058  83 C4 04				add		esp,0x00000004
005B  0F A1				pop		fs
005D  07				pop		es
005E  C2 04 00				ret		0x0004

Routine Size: 97 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

