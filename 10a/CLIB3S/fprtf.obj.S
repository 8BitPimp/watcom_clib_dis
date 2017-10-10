Module: fprtf
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000D3 bytes
0000				file_putc:
0000  53				push		ebx
0001  56				push		esi
0002  8B 5C 24 0C			mov		ebx,dword ptr 0xc[esp]
0006  8B 13				mov		edx,dword ptr [ebx]
0008  52				push		edx
0009  8B 4C 24 14			mov		ecx,dword ptr 0x14[esp]
000D  51				push		ecx
000E  E8 00 00 00 00			call		fputc
0013  8B 73 10				mov		esi,dword ptr 0x10[ebx]
0016  46				inc		esi
0017  83 C4 08				add		esp,0x00000008
001A  89 73 10				mov		dword ptr 0x10[ebx],esi
001D  5E				pop		esi
001E  5B				pop		ebx
001F  C3				ret		

Routine Size: 32 bytes,    Routine Base: _TEXT + 0000

0020				__fprtf:
0020  53				push		ebx
0021  56				push		esi
0022  57				push		edi
0023  55				push		ebp
0024  8B 5C 24 14			mov		ebx,dword ptr 0x14[esp]
0028  8B 53 10				mov		edx,dword ptr 0x10[ebx]
002B  52				push		edx
002C  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0032  83 C4 04				add		esp,0x00000004
0035  8B 6B 0C				mov		ebp,dword ptr 0xc[ebx]
0038  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
003B  8B 4B 08				mov		ecx,dword ptr 0x8[ebx]
003E  80 E4 CF				and		ah,0xcf
0041  83 E5 30				and		ebp,0x00000030
0044  88 63 0C				mov		byte ptr 0xc[ebx],ah
0047  85 C9				test		ecx,ecx
0049  75 09				jne		L$1
004B  53				push		ebx
004C  E8 00 00 00 00			call		__ioalloc
0051  83 C4 04				add		esp,0x00000004
0054				L$1:
0054  8A 53 0D				mov		dl,byte ptr 0xd[ebx]
0057  31 FF				xor		edi,edi
0059  F6 C2 04				test		dl,0x04
005C  74 15				je		L$2
005E  88 D6				mov		dh,dl
0060  80 E6 FA				and		dh,0xfa
0063  88 F1				mov		cl,dh
0065  88 73 0D				mov		byte ptr 0xd[ebx],dh
0068  80 C9 01				or		cl,0x01
006B  BF 01 00 00 00			mov		edi,0x00000001
0070  88 4B 0D				mov		byte ptr 0xd[ebx],cl
0073				L$2:
0073  68 00 00 00 00			push		offset file_putc
0078  8B 74 24 20			mov		esi,dword ptr 0x20[esp]
007C  56				push		esi
007D  8B 44 24 20			mov		eax,dword ptr 0x20[esp]
0081  50				push		eax
0082  53				push		ebx
0083  E8 00 00 00 00			call		__prtf
0088  89 C6				mov		esi,eax
008A  83 C4 10				add		esp,0x00000010
008D  85 FF				test		edi,edi
008F  74 19				je		L$3
0091  8A 6B 0D				mov		ch,byte ptr 0xd[ebx]
0094  80 E5 FA				and		ch,0xfa
0097  88 E8				mov		al,ch
0099  88 6B 0D				mov		byte ptr 0xd[ebx],ch
009C  0C 04				or		al,0x04
009E  53				push		ebx
009F  88 43 0D				mov		byte ptr 0xd[ebx],al
00A2  E8 00 00 00 00			call		__flush
00A7  83 C4 04				add		esp,0x00000004
00AA				L$3:
00AA  8B 53 10				mov		edx,dword ptr 0x10[ebx]
00AD  52				push		edx
00AE  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
00B4  8A 63 0C				mov		ah,byte ptr 0xc[ebx]
00B7  83 C4 04				add		esp,0x00000004
00BA  F6 C4 20				test		ah,0x20
00BD  74 05				je		L$4
00BF  BE FF FF FF FF			mov		esi,0xffffffff
00C4				L$4:
00C4  8B 4B 0C				mov		ecx,dword ptr 0xc[ebx]
00C7  09 E9				or		ecx,ebp
00C9  89 F0				mov		eax,esi
00CB  89 4B 0C				mov		dword ptr 0xc[ebx],ecx
00CE  5D				pop		ebp
00CF  5F				pop		edi
00D0  5E				pop		esi
00D1  5B				pop		ebx
00D2  C3				ret		

Routine Size: 179 bytes,    Routine Base: _TEXT + 0020

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

