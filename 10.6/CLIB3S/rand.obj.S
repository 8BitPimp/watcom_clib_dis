Module: rand
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000003D bytes
0000				initrandnext:
0000  FF 15 00 00 00 00			call		dword ptr __GetThreadPtr
0006  83 C0 0C				add		eax,0x0000000c
0009  C3				ret		

Routine Size: 10 bytes,    Routine Base: _TEXT + 0000

000A				rand:
000A  E8 00 00 00 00			call		initrandnext
000F  85 C0				test		eax,eax
0011  75 01				jne		L$1
0013  C3				ret		
0014				L$1:
0014  69 10 6D 4E C6 41			imul		edx,dword ptr [eax],0x41c64e6d
001A  81 C2 39 30 00 00			add		edx,0x00003039
0020  89 10				mov		dword ptr [eax],edx
0022  89 D0				mov		eax,edx
0024  C1 E8 10				shr		eax,0x10
0027  25 FF 7F 00 00			and		eax,0x00007fff
002C  C3				ret		

Routine Size: 35 bytes,    Routine Base: _TEXT + 000A

002D				srand:
002D  E8 00 00 00 00			call		initrandnext
0032  85 C0				test		eax,eax
0034  74 06				je		L$2
0036  8B 54 24 04			mov		edx,dword ptr 0x4[esp]
003A  89 10				mov		dword ptr [eax],edx
003C				L$2:
003C  C3				ret		

Routine Size: 16 bytes,    Routine Base: _TEXT + 002D

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

