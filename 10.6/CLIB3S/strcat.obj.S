Module: strcat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000035 bytes
0000				strcat:
0000  56				push		esi
0001  57				push		edi
0002  8B 74 24 10			mov		esi,dword ptr 0x10[esp]
0006  8B 7C 24 0C			mov		edi,dword ptr 0xc[esp]
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
001C  74 10				je		L$2
001E  8A 46 01				mov		al,byte ptr 0x1[esi]
0021  83 C6 02				add		esi,0x00000002
0024  88 47 01				mov		byte ptr 0x1[edi],al
0027  83 C7 02				add		edi,0x00000002
002A  3C 00				cmp		al,0x00
002C  75 E8				jne		L$1
002E				L$2:
002E  5F				pop		edi
002F  07				pop		es
0030  89 F8				mov		eax,edi
0032  5F				pop		edi
0033  5E				pop		esi
0034  C3				ret		

Routine Size: 53 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

