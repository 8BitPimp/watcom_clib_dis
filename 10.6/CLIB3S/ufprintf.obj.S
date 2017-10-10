Module: ufprintf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000001E bytes
0000				_ufprintf:
0000  C8 04 00 00			enter		0x0004,0x00
0004  8D 45 10				lea		eax,0x10[ebp]
0007  89 45 FC				mov		dword ptr -0x4[ebp],eax
000A  8D 45 FC				lea		eax,-0x4[ebp]
000D  50				push		eax
000E  FF 75 0C				push		dword ptr 0xc[ebp]
0011  FF 75 08				push		dword ptr 0x8[ebp]
0014  E8 00 00 00 00			call		__ufprtf
0019  83 C4 0C				add		esp,0x0000000c
001C  C9				leave		
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

