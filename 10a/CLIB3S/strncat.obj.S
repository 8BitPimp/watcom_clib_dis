Module: strncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000045 bytes
0000				strncat:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  8B 6C 24 14			mov		ebp,dword ptr 0x14[esp]
0008  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000C  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
0010  B9 FF FF FF FF			mov		ecx,0xffffffff
0015  89 EF				mov		edi,ebp
0017  30 C0				xor		al,al
0019  06				push		es
001A  E3 0B				jecxz		L$1
001C  8C DA				mov		edx,ds
001E  8E C2				mov		es,edx
0020  F2 AE				repne scasb	
0022  75 03				jne		L$1
0024  4F				dec		edi
0025  66 A9                                           f.
0027				L$1:
0027  89 CF				mov		edi,ecx
0029  07				pop		es
002A				L$2:
002A  85 F6				test		esi,esi
002C  74 0D				je		L$3
002E  8A 03				mov		al,byte ptr [ebx]
0030  88 07				mov		byte ptr [edi],al
0032  84 C0				test		al,al
0034  74 05				je		L$3
0036  47				inc		edi
0037  43				inc		ebx
0038  4E				dec		esi
0039  EB EF				jmp		L$2
003B				L$3:
003B  89 E8				mov		eax,ebp
003D  C6 07 00				mov		byte ptr [edi],0x00
0040  5D				pop		ebp
0041  5F				pop		edi
0042  5E				pop		esi
0043  5B				pop		ebx
0044  C3				ret		

Routine Size: 69 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

