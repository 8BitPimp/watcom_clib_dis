Module: strcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000039 bytes
0000				strcat:
0000  56				push		esi
0001  57				push		edi
0002  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
0006  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
000A  06				push		es
000B  1E				push		ds
000C  07				pop		es
000D  57				push		edi
000E  2B C9				sub		ecx,ecx
0010  49				dec		ecx
0011  B0 00				mov		al,0x00
0013  F2 AE				repne scasb	
0015  4F				dec		edi
0016				L$1:
0016  8A 06				mov		al,byte ptr [esi]
0018  88 07				mov		byte ptr [edi],al
001A  3C 00				cmp		al,0x00
001C  0F 84 10 00 00 00			je		L$2
0022  8A 46 01				mov		al,byte ptr 0x1[esi]
0025  83 C6 02				add		esi,0x00000002
0028  88 47 01				mov		byte ptr 0x1[edi],al
002B  83 C7 02				add		edi,0x00000002
002E  3C 00				cmp		al,0x00
0030  75 E4				jne		L$1
0032				L$2:
0032  5F				pop		edi
0033  07				pop		es
0034  89 F8				mov		eax,edi
0036  5F				pop		edi
0037  5E				pop		esi
0038  C3				ret		

Routine Size: 57 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

