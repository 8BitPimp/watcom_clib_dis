Module: fgets
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000075 bytes
0000				fgets_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  89 C7				mov		edi,eax
0009  89 D1				mov		ecx,edx
000B  8B 43 10				mov		eax,dword ptr 0x10[ebx]
000E  89 FA				mov		edx,edi
0010  FF 15 00 00 00 00			call		dword ptr __AccessFileH
0016  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
0019  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
001C  80 E4 CF				and		ah,0xcf
001F  83 E5 30				and		ebp,0x00000030
0022  88 63 0C				mov		byte ptr 0xc[ebx],ah
0025				L$1:
0025  49				dec		ecx
0026  85 C9				test		ecx,ecx
0028  7E 19				jle		L$2
002A  89 D8				mov		eax,ebx
002C  E8 00 00 00 00			call		fgetc_
0031  89 04 24				mov		dword ptr [esp],eax
0034  83 F8 FF				cmp		eax,0xffffffff
0037  74 0A				je		L$2
0039  8A 04 24				mov		al,byte ptr [esp]
003C  88 02				mov		byte ptr [edx],al
003E  42				inc		edx
003F  3C 0A				cmp		al,0x0a
0041  75 E2				jne		L$1
0043				L$2:
0043  83 3C 24 FF			cmp		dword ptr [esp],0xffffffff
0047  75 0E				jne		L$4
0049  39 FA				cmp		edx,edi
004B  74 06				je		L$3
004D  F6 43 0C 20			test		byte ptr 0xc[ebx],0x20
0051  74 04				je		L$4
0053				L$3:
0053  31 FF				xor		edi,edi
0055  EB 03				jmp		L$5
0057				L$4:
0057  C6 02 00				mov		byte ptr [edx],0x00
005A				L$5:
005A  8B 73 0C				mov		esi,dword ptr 0xc[ebx]
005D  09 EE				or		esi,ebp
005F  8B 43 10				mov		eax,dword ptr 0x10[ebx]
0062  89 73 0C				mov		dword ptr 0xc[ebx],esi
0065  FF 15 00 00 00 00			call		dword ptr __ReleaseFileH
006B  89 F8				mov		eax,edi
006D  83 C4 04				add		esp,0x00000004
0070  5D				pop		ebp
0071  5F				pop		edi
0072  5E				pop		esi
0073  59				pop		ecx
0074  C3				ret		

Routine Size: 117 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

