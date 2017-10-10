Module: fstrncat
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000058 bytes
0000				_fstrncat_:
0000  56				push		esi
0001  57				push		edi
0002  06				push		es
0003  0F A0				push		fs
0005  55				push		ebp
0006  83 EC 04				sub		esp,0x00000004
0009  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000D  89 14 24				mov		dword ptr [esp],edx
0010  89 C5				mov		ebp,eax
0012  8E E1				mov		fs,ecx
0014  B9 FF FF FF FF			mov		ecx,0xffffffff
0019  89 C7				mov		edi,eax
001B  30 C0				xor		al,al
001D  06				push		es
001E  E3 0B				jecxz		L$1
0020  8E C2				mov		es,edx
0022  F2 AE				repne scasb	
0024  75 05				jne		L$1
0026  4F				dec		edi
0027  8C C1				mov		ecx,es
0029  66 A9                                           f.
002B				L$1:
002B  89 CF				mov		edi,ecx
002D  07				pop		es
002E  8E C1				mov		es,ecx
0030				L$2:
0030  85 F6				test		esi,esi
0032  74 0F				je		L$3
0034  64 8A 03				mov		al,byte ptr fs:[ebx]
0037  26 88 07				mov		byte ptr es:[edi],al
003A  84 C0				test		al,al
003C  74 05				je		L$3
003E  47				inc		edi
003F  43				inc		ebx
0040  4E				dec		esi
0041  EB ED				jmp		L$2
0043				L$3:
0043  8B 14 24				mov		edx,dword ptr [esp]
0046  89 E8				mov		eax,ebp
0048  26 C6 07 00			mov		byte ptr es:[edi],0x00
004C  83 C4 04				add		esp,0x00000004
004F  5D				pop		ebp
0050  0F A1				pop		fs
0052  07				pop		es
0053  5F				pop		edi
0054  5E				pop		esi
0055  C2 04 00				ret		0x0004

Routine Size: 88 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

