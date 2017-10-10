Module: fstrcpy
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000033 bytes
0000				_fstrcpy_:
0000  56				push		esi
0001  57				push		edi
0002  1E				push		ds
0003  06				push		es
0004  50				push		eax
0005  66 8E C2				mov		es,dx
0008  66 8E D9				mov		ds,cx
000B  8B F3				mov		esi,ebx
000D  8B F8				mov		edi,eax
000F				L$1:
000F  8A 06				mov		al,byte ptr [esi]
0011  26 88 07				mov		byte ptr es:[edi],al
0014  3C 00				cmp		al,0x00
0016  0F 84 11 00 00 00			je		L$2
001C  8A 46 01				mov		al,byte ptr 0x1[esi]
001F  83 C6 02				add		esi,0x00000002
0022  26 88 47 01			mov		byte ptr es:0x1[edi],al
0026  83 C7 02				add		edi,0x00000002
0029  3C 00				cmp		al,0x00
002B  75 E2				jne		L$1
002D				L$2:
002D  58				pop		eax
002E  07				pop		es
002F  1F				pop		ds
0030  5F				pop		edi
0031  5E				pop		esi
0032  C3				ret		

Routine Size: 51 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

