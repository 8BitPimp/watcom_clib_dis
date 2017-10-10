Module: jstrset
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000077 bytes
0000				jstrset:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 74 24 18			mov		esi,dword ptr 0x18[esp]
000B  89 F5				mov		ebp,esi
000D  31 DB				xor		ebx,ebx
000F  89 F7				mov		edi,esi
0011  66 8B 5C 24 1C			mov		bx,word ptr 0x1c[esp]
0016  06				push		es
0017  8C D8				mov		eax,ds
0019  8E C0				mov		es,eax
001B  29 C9				sub		ecx,ecx
001D  49				dec		ecx
001E  31 C0				xor		eax,eax
0020  F2 AE				repne scasb	
0022  F7 D1				not		ecx
0024  49				dec		ecx
0025  07				pop		es
0026  53				push		ebx
0027  89 CF				mov		edi,ecx
0029  89 4C 24 04			mov		dword ptr 0x4[esp],ecx
002D  E8 00 00 00 00			call		jiszen
0032  83 C4 04				add		esp,0x00000004
0035  85 C0				test		eax,eax
0037  74 29				je		L$3
0039  D1 EF				shr		edi,0x01
003B  31 DB				xor		ebx,ebx
003D  EB 14				jmp		L$2
003F				L$1:
003F  31 C0				xor		eax,eax
0041  66 8B 44 24 1C			mov		ax,word ptr 0x1c[esp]
0046  50				push		eax
0047  56				push		esi
0048  43				inc		ebx
0049  E8 00 00 00 00			call		jputmoji
004E  83 C4 08				add		esp,0x00000008
0051  89 C6				mov		esi,eax
0053				L$2:
0053  39 FB				cmp		ebx,edi
0055  72 E8				jb		L$1
0057  F6 04 24 01			test		byte ptr [esp],0x01
005B  74 10				je		L$4
005D  C6 06 20				mov		byte ptr [esi],0x20
0060  EB 0B				jmp		L$4
0062				L$3:
0062  57				push		edi
0063  53				push		ebx
0064  56				push		esi
0065  E8 00 00 00 00			call		memset
006A  83 C4 0C				add		esp,0x0000000c
006D				L$4:
006D  89 E8				mov		eax,ebp
006F  83 C4 04				add		esp,0x00000004
0072  5D				pop		ebp
0073  5F				pop		edi
0074  5E				pop		esi
0075  5B				pop		ebx
0076  C3				ret		

Routine Size: 119 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

