Module: uprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000020 bytes
0000				_uprintf:
0000  C8 04 00 00			enter		0x0004,0x00
0004  8D 45 0C				lea		eax,0xc[ebp]
0007  89 45 FC				mov		dword ptr -0x4[ebp],eax
000A  8D 45 FC				lea		eax,-0x4[ebp]
000D  50				push		eax
000E  FF 75 08				push		dword ptr 0x8[ebp]
0011  68 1A 00 00 00			push		offset __iob+0x1a
0016  E8 00 00 00 00			call		__ufprtf
001B  83 C4 0C				add		esp,0x0000000c
001E  C9				leave		
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

