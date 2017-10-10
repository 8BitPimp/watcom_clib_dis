Module: umemchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001F bytes
0000				__umemchr:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006				L$1:
0006  83 7D 10 00			cmp		dword ptr 0x10[ebp],0x00000000
000A  74 0F				je		L$2
000C  0F B7 10				movzx		edx,word ptr [eax]
000F  3B 55 0C				cmp		edx,dword ptr 0xc[ebp]
0012  74 09				je		L$3
0014  FF 4D 10				dec		dword ptr 0x10[ebp]
0017  40				inc		eax
0018  40				inc		eax
0019  EB EB				jmp		L$1
001B				L$2:
001B  31 C0				xor		eax,eax
001D				L$3:
001D  5D				pop		ebp
001E  C3				ret		

Routine Size: 31 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

