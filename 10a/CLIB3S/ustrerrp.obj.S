Module: ustrerrp
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000016 bytes
0000				_ustrerror:
0000  55				push		ebp
0001  89 E5				mov		ebp,esp
0003  8B 45 08				mov		eax,dword ptr 0x8[ebp]
0006  0D 00 00 00 80			or		eax,0x80000000
000B  50				push		eax
000C  E8 00 00 00 00			call		__uPenPointError
0011  83 C4 04				add		esp,0x00000004
0014  5D				pop		ebp
0015  C3				ret		

Routine Size: 22 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

