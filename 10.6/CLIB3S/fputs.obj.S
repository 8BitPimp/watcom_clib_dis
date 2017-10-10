Module: fputs
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 000000AA bytes
0000				fputs:
0000  53				push		ebx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 04				sub		esp,0x00000004
0007  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
000B  8B 74 24 1C			mov		esi,dword ptr 0x1c[esp]
000F  8B 56 10				mov		edx,dword ptr 0x10[esi]
0012  52				push		edx
0013  FF 15 00 00 00 00			call		dword ptr _AccessFileH
0019  8B 4E 08				mov		ecx,dword ptr 0x8[esi]
001C  83 C4 04				add		esp,0x00000004
001F  85 C9				test		ecx,ecx
0021  75 09				jne		L$1
0023  56				push		esi
0024  E8 00 00 00 00			call		__ioalloc
0029  83 C4 04				add		esp,0x00000004
002C				L$1:
002C  8A 66 0D				mov		ah,byte ptr 0xd[esi]
002F  31 ED				xor		ebp,ebp
0031  F6 C4 04				test		ah,0x04
0034  74 12				je		L$2
0036  88 E2				mov		dl,ah
0038  80 E2 F9				and		dl,0xf9
003B  88 D6				mov		dh,dl
003D  80 CE 02				or		dh,0x02
0040  BD 01 00 00 00			mov		ebp,0x00000001
0045  88 76 0D				mov		byte ptr 0xd[esi],dh
0048				L$2:
0048  89 1C 24				mov		dword ptr [esp],ebx
004B  31 FF				xor		edi,edi
004D				L$3:
004D  31 C0				xor		eax,eax
004F  8A 03				mov		al,byte ptr [ebx]
0051  85 C0				test		eax,eax
0053  74 12				je		L$4
0055  56				push		esi
0056  50				push		eax
0057  43				inc		ebx
0058  E8 00 00 00 00			call		fputc
005D  83 C4 08				add		esp,0x00000008
0060  83 F8 FF				cmp		eax,0xffffffff
0063  75 E8				jne		L$3
0065  89 C7				mov		edi,eax
0067				L$4:
0067  85 ED				test		ebp,ebp
0069  74 1D				je		L$5
006B  8A 4E 0D				mov		cl,byte ptr 0xd[esi]
006E  80 E1 F9				and		cl,0xf9
0071  88 CD				mov		ch,cl
0073  80 CD 04				or		ch,0x04
0076  88 6E 0D				mov		byte ptr 0xd[esi],ch
0079  85 FF				test		edi,edi
007B  75 0B				jne		L$5
007D  56				push		esi
007E  E8 00 00 00 00			call		__flush
0083  83 C4 04				add		esp,0x00000004
0086  89 C7				mov		edi,eax
0088				L$5:
0088  85 FF				test		edi,edi
008A  75 07				jne		L$6
008C  8B 3C 24				mov		edi,dword ptr [esp]
008F  29 FB				sub		ebx,edi
0091  89 DF				mov		edi,ebx
0093				L$6:
0093  8B 6E 10				mov		ebp,dword ptr 0x10[esi]
0096  55				push		ebp
0097  FF 15 00 00 00 00			call		dword ptr _ReleaseFileH
009D  83 C4 04				add		esp,0x00000004
00A0  89 F8				mov		eax,edi
00A2  83 C4 04				add		esp,0x00000004
00A5  5D				pop		ebp
00A6  5F				pop		edi
00A7  5E				pop		esi
00A8  5B				pop		ebx
00A9  C3				ret		

Routine Size: 170 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

