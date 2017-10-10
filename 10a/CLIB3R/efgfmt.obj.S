Module: efgfmt
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000125 bytes
0000				_EFG_Format_:
0000  51				push		ecx
0001  56				push		esi
0002  57				push		edi
0003  55				push		ebp
0004  83 EC 0C				sub		esp,0x0000000c
0007  89 C6				mov		esi,eax
0009  89 DF				mov		edi,ebx
000B  C7 43 0C 00 00 00 00		mov		dword ptr 0xc[ebx],0x00000000
0012  8C 5C 24 08			mov		dword ptr 0x8[esp],ds
0016  8A 4F 15				mov		cl,byte ptr 0x15[edi]
0019  31 DB				xor		ebx,ebx
001B  80 F9 47				cmp		cl,0x47
001E  72 1D				jb		L$2
0020  76 28				jbe		L$3
0022  80 F9 66				cmp		cl,0x66
0025  72 0C				jb		L$1
0027  76 36				jbe		L$6
0029  80 F9 67				cmp		cl,0x67
002C  74 1C				je		L$3
002E  E9 9E 00 00 00			jmp		L$11
0033				L$1:
0033  80 F9 65				cmp		cl,0x65
0036  74 22				je		L$5
0038  E9 94 00 00 00			jmp		L$11
003D				L$2:
003D  80 F9 45				cmp		cl,0x45
0040  0F 82 8B 00 00 00			jb		L$11
0046  76 12				jbe		L$5
0048  EB 15				jmp		L$6
004A				L$3:
004A  83 7F 08 00			cmp		dword ptr 0x8[edi],0x00000000
004E  75 07				jne		L$4
0050  C7 47 08 01 00 00 00		mov		dword ptr 0x8[edi],0x00000001
0057				L$4:
0057  80 E9 02				sub		cl,0x02
005A				L$5:
005A  BB 01 00 00 00			mov		ebx,0x00000001
005F				L$6:
005F  8B 2A				mov		ebp,dword ptr [edx]
0061  83 C5 08				add		ebp,0x00000008
0064  89 2A				mov		dword ptr [edx],ebp
0066  8B 45 F8				mov		eax,dword ptr -0x8[ebp]
0069  89 04 24				mov		dword ptr [esp],eax
006C  8B 45 FC				mov		eax,dword ptr -0x4[ebp]
006F  89 44 24 04			mov		dword ptr 0x4[esp],eax
0073  83 7F 08 FF			cmp		dword ptr 0x8[edi],0xffffffff
0077  75 07				jne		L$7
0079  C7 47 08 06 00 00 00		mov		dword ptr 0x8[edi],0x00000006
0080				L$7:
0080  8A 47 15				mov		al,byte ptr 0x15[edi]
0083  24 5F				and		al,0x5f
0085  25 FF 00 00 00			and		eax,0x000000ff
008A  50				push		eax
008B  31 C0				xor		eax,eax
008D  88 C8				mov		al,cl
008F  50				push		eax
0090  6A 03				push		0x00000003
0092  53				push		ebx
0093  8D 54 24 10			lea		edx,0x10[esp]
0097  31 C9				xor		ecx,ecx
0099  6A 27				push		0x00000027
009B  89 F0				mov		eax,esi
009D  8B 5F 08				mov		ebx,dword ptr 0x8[edi]
00A0  E8 00 00 00 00			call		_FtoS_
00A5  8A 26				mov		ah,byte ptr [esi]
00A7  80 FC 2A				cmp		ah,0x2a
00AA  75 03				jne		L$8
00AC  88 67 16				mov		byte ptr 0x16[edi],ah
00AF				L$8:
00AF  C6 46 27 00			mov		byte ptr 0x27[esi],0x00
00B3				L$9:
00B3  80 3E 20				cmp		byte ptr [esi],0x20
00B6  75 03				jne		L$10
00B8  46				inc		esi
00B9  EB F8				jmp		L$9
00BB				L$10:
00BB  89 F0				mov		eax,esi
00BD  89 FA				mov		edx,edi
00BF  E8 00 00 00 00			call		forcedecpt_
00C4  8C 5C 24 08			mov		dword ptr 0x8[esp],ds
00C8  89 F0				mov		eax,esi
00CA  C7 47 08 FF FF FF FF		mov		dword ptr 0x8[edi],0xffffffff
00D1				L$11:
00D1  8B 54 24 08			mov		edx,dword ptr 0x8[esp]
00D5  83 C4 0C				add		esp,0x0000000c
00D8  5D				pop		ebp
00D9  5F				pop		edi
00DA  5E				pop		esi
00DB  59				pop		ecx
00DC  C3				ret		
00DD				forcedecpt_:
00DD  53				push		ebx
00DE  51				push		ecx
00DF  89 D3				mov		ebx,edx
00E1  F6 42 14 01			test		byte ptr 0x14[edx],0x01
00E5  75 3B				jne		L$17
00E7				L$12:
00E7  8A 30				mov		dh,byte ptr [eax]
00E9  84 F6				test		dh,dh
00EB  74 0D				je		L$13
00ED  80 FE 65				cmp		dh,0x65
00F0  74 08				je		L$13
00F2  80 FE 45				cmp		dh,0x45
00F5  74 03				je		L$13
00F7  40				inc		eax
00F8  EB ED				jmp		L$12
00FA				L$13:
00FA  89 C2				mov		edx,eax
00FC  8A 4B 15				mov		cl,byte ptr 0x15[ebx]
00FF  48				dec		eax
0100  80 F9 47				cmp		cl,0x47
0103  74 05				je		L$14
0105  80 F9 67				cmp		cl,0x67
0108  75 08				jne		L$15
010A				L$14:
010A  80 38 30				cmp		byte ptr [eax],0x30
010D  75 03				jne		L$15
010F  48				dec		eax
0110  EB F8				jmp		L$14
0112				L$15:
0112  80 38 2E				cmp		byte ptr [eax],0x2e
0115  74 01				je		L$16
0117  40				inc		eax
0118				L$16:
0118  8A 1A				mov		bl,byte ptr [edx]
011A  42				inc		edx
011B  88 18				mov		byte ptr [eax],bl
011D  40				inc		eax
011E  84 DB				test		bl,bl
0120  75 F6				jne		L$16
0122				L$17:
0122  59				pop		ecx
0123  5B				pop		ebx
0124  C3				ret		

Routine Size: 293 bytes,    Routine Base: _TEXT + 0000

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

