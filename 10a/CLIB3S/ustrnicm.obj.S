Module: ustrnicm
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000063 bytes
0000				_ustrnicmp:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 0C				mov		ebx,dword ptr 0xc[ebp]
0007  8B 4D 10				mov		ecx,dword ptr 0x10[ebp]
000A				L$1:
000A  83 7D 14 00			cmp		dword ptr 0x14[ebp],0x00000000
000E  75 05				jne		L$3
0010				L$2:
0010  31 C0				xor		eax,eax
0012  5D				pop		ebp
0013  5B				pop		ebx
0014  C3				ret		
0015				L$3:
0015  66 8B 03				mov		ax,word ptr [ebx]
0018  66 8B 11				mov		dx,word ptr [ecx]
001B  F6 C4 FF				test		ah,0xff
001E  75 25				jne		L$5
0020  F6 C6 FF				test		dh,0xff
0023  75 20				jne		L$5
0025  66 3D 41 00			cmp		ax,0x0041
0029  72 0B				jb		L$4
002B  66 3D 5A 00			cmp		ax,0x005a
002F  77 05				ja		L$4
0031  05 20 00 00 00			add		eax,0x00000020
0036				L$4:
0036  66 83 FA 41			cmp		dx,0x0041
003A  72 09				jb		L$5
003C  66 83 FA 5A			cmp		dx,0x005a
0040  77 03				ja		L$5
0042  83 C2 20				add		edx,0x00000020
0045				L$5:
0045  66 39 D0				cmp		ax,dx
0048  74 0B				je		L$6
004A  0F B7 C0				movzx		eax,ax
004D  0F B7 D2				movzx		edx,dx
0050  29 D0				sub		eax,edx
0052  5D				pop		ebp
0053  5B				pop		ebx
0054  C3				ret		
0055				L$6:
0055  66 85 D2				test		dx,dx
0058  74 B6				je		L$2
005A  FF 4D 14				dec		dword ptr 0x14[ebp]
005D  43				inc		ebx
005E  43				inc		ebx
005F  41				inc		ecx
0060  41				inc		ecx
0061  EB A7				jmp		L$1

Routine Size: 99 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

