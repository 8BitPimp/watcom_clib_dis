Module: ustrchr
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000018 bytes
0000				_ustrchr_:
0000  53				push		ebx
0001  89 D3				mov		ebx,edx
0003				L$1:
0003  0F B7 10				movzx		edx,word ptr [eax]
0006  39 DA				cmp		edx,ebx
0008  74 0C				je		L$2
000A  89 C2				mov		edx,eax
000C  40				inc		eax
000D  40				inc		eax
000E  66 83 3A 00			cmp		word ptr [edx],0x0000
0012  75 EF				jne		L$1
0014  31 C0				xor		eax,eax
0016				L$2:
0016  5B				pop		ebx
0017  C3				ret		

Routine Size: 24 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

