Module: ustrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003B bytes
0000				_ustrncat:
0000  53				push		ebx
0001  55				push		ebp
0002  89 E5				mov		ebp,esp
0004  8B 5D 10				mov		ebx,dword ptr 0x10[ebp]
0007  6A FF				push		0xffffffff
0009  6A 00				push		0x00000000
000B  FF 75 0C				push		dword ptr 0xc[ebp]
000E  E8 00 00 00 00			call		__umemchr
0013  83 C4 0C				add		esp,0x0000000c
0016				L$1:
0016  83 7D 14 00			cmp		dword ptr 0x14[ebp],0x00000000
001A  74 14				je		L$2
001C  66 8B 13				mov		dx,word ptr [ebx]
001F  66 89 10				mov		word ptr [eax],dx
0022  66 85 D2				test		dx,dx
0025  74 09				je		L$2
0027  FF 4D 14				dec		dword ptr 0x14[ebp]
002A  40				inc		eax
002B  40				inc		eax
002C  43				inc		ebx
002D  43				inc		ebx
002E  EB E6				jmp		L$1
0030				L$2:
0030  66 C7 00 00 00			mov		word ptr [eax],0x0000
0035  8B 45 0C				mov		eax,dword ptr 0xc[ebp]
0038  5D				pop		ebp
0039  5B				pop		ebx
003A  C3				ret		

Routine Size: 59 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

