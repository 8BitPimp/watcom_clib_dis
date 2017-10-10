Module: uassert
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000				__uassert:
0000  C8 64 00 00			enter		0x0064,0x00
0004  83 7D 08 00			cmp		dword ptr 0x8[ebp],0x00000000
0008  75 2D				jne		L$1
000A  FF 75 14				push		dword ptr 0x14[ebp]
000D  FF 75 10				push		dword ptr 0x10[ebp]
0010  FF 75 0C				push		dword ptr 0xc[ebp]
0013  68 00 00 00 00			push		offset DGROUP:L$2
0018  8D 45 9C				lea		eax,-0x64[ebp]
001B  50				push		eax
001C  E8 00 00 00 00			call		_atouni
0021  83 C4 08				add		esp,0x00000008
0024  50				push		eax
0025  68 34 00 00 00			push		offset __iob+0x34
002A  E8 00 00 00 00			call		_ufprintf
002F  83 C4 14				add		esp,0x00000014
0032  E8 00 00 00 00			call		abort
0037				L$1:
0037  C9				leave		
0038  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 0000002A bytes
0000				L$2:
0000  41 73 73 65 72 74 69 6F 6E 20 66 61 69 6C 65 64 Assertion failed
0010  3A 20 25 68 73 2C 20 66 69 6C 65 20 25 68 73 2C : %hs, file %hs,
0020  20 6C 69 6E 65 20 25 64 0A 00                    line %d..

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

