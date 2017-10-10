Module: makepath
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 0000010B bytes
0000				pickup:
0000  8A 54 24 04			mov		dl,byte ptr 0x4[esp]
0004  8B 44 24 08			mov		eax,dword ptr 0x8[esp]
0008  80 FA 5C				cmp		dl,0x5c
000B  74 05				je		L$1
000D  80 FA 2F				cmp		dl,0x2f
0010  75 09				jne		L$3
0012				L$1:
0012  80 38 00				cmp		byte ptr [eax],0x00
0015  75 02				jne		L$2
0017  88 10				mov		byte ptr [eax],dl
0019				L$2:
0019  8A 10				mov		dl,byte ptr [eax]
001B				L$3:
001B  88 D0				mov		al,dl
001D  C3				ret		

Routine Size: 30 bytes,    Routine Base: _TEXT + 0000

001E				_makepath:
001E  53				push		ebx
001F  56				push		esi
0020  57				push		edi
0021  55				push		ebp
0022  83 EC 04				sub		esp,0x00000004
0025  8B 5C 24 18			mov		ebx,dword ptr 0x18[esp]
0029  8B 44 24 1C			mov		eax,dword ptr 0x1c[esp]
002D  8B 6C 24 20			mov		ebp,dword ptr 0x20[esp]
0031  8B 7C 24 24			mov		edi,dword ptr 0x24[esp]
0035  8B 74 24 28			mov		esi,dword ptr 0x28[esp]
0039  30 D2				xor		dl,dl
003B  88 14 24				mov		byte ptr [esp],dl
003E  85 C0				test		eax,eax
0040  74 0D				je		L$4
0042  8A 30				mov		dh,byte ptr [eax]
0044  84 F6				test		dh,dh
0046  74 07				je		L$4
0048  88 33				mov		byte ptr [ebx],dh
004A  43				inc		ebx
004B  C6 03 3A				mov		byte ptr [ebx],0x3a
004E  43				inc		ebx
004F				L$4:
004F  C6 03 00				mov		byte ptr [ebx],0x00
0052  85 ED				test		ebp,ebp
0054  74 39				je		L$8
0056  80 7D 00 00			cmp		byte ptr [ebp],0x00
005A  74 33				je		L$8
005C				L$5:
005C  89 E0				mov		eax,esp
005E  50				push		eax
005F  31 C0				xor		eax,eax
0061  8A 45 00				mov		al,byte ptr [ebp]
0064  50				push		eax
0065  45				inc		ebp
0066  E8 00 00 00 00			call		pickup
006B  88 03				mov		byte ptr [ebx],al
006D  83 C4 08				add		esp,0x00000008
0070  8A 6D 00				mov		ch,byte ptr [ebp]
0073  43				inc		ebx
0074  84 ED				test		ch,ch
0076  75 E4				jne		L$5
0078  80 3C 24 00			cmp		byte ptr [esp],0x00
007C  75 04				jne		L$6
007E  C6 04 24 5C			mov		byte ptr [esp],0x5c
0082				L$6:
0082  8A 14 24				mov		dl,byte ptr [esp]
0085  3A 53 FF				cmp		dl,byte ptr -0x1[ebx]
0088  75 03				jne		L$7
008A  4B				dec		ebx
008B  EB 02				jmp		L$8
008D				L$7:
008D  88 13				mov		byte ptr [ebx],dl
008F				L$8:
008F  80 3C 24 00			cmp		byte ptr [esp],0x00
0093  75 04				jne		L$9
0095  C6 04 24 5C			mov		byte ptr [esp],0x5c
0099				L$9:
0099  8D 6B 01				lea		ebp,0x1[ebx]
009C  85 FF				test		edi,edi
009E  74 39				je		L$11
00A0  89 E0				mov		eax,esp
00A2  50				push		eax
00A3  31 C0				xor		eax,eax
00A5  8A 07				mov		al,byte ptr [edi]
00A7  50				push		eax
00A8  E8 00 00 00 00			call		pickup
00AD  83 C4 08				add		esp,0x00000008
00B0  8A 24 24				mov		ah,byte ptr [esp]
00B3  38 E0				cmp		al,ah
00B5  74 06				je		L$10
00B7  3A 23				cmp		ah,byte ptr [ebx]
00B9  75 02				jne		L$10
00BB  89 EB				mov		ebx,ebp
00BD				L$10:
00BD  8A 37				mov		dh,byte ptr [edi]
00BF  84 F6				test		dh,dh
00C1  74 1F				je		L$12
00C3  89 E0				mov		eax,esp
00C5  50				push		eax
00C6  31 C0				xor		eax,eax
00C8  88 F0				mov		al,dh
00CA  50				push		eax
00CB  47				inc		edi
00CC  E8 00 00 00 00			call		pickup
00D1  83 C4 08				add		esp,0x00000008
00D4  88 03				mov		byte ptr [ebx],al
00D6  43				inc		ebx
00D7  EB E4				jmp		L$10
00D9				L$11:
00D9  8A 2C 24				mov		ch,byte ptr [esp]
00DC  3A 2B				cmp		ch,byte ptr [ebx]
00DE  75 02				jne		L$12
00E0  89 EB				mov		ebx,ebp
00E2				L$12:
00E2  85 F6				test		esi,esi
00E4  74 1A				je		L$15
00E6  8A 0E				mov		cl,byte ptr [esi]
00E8  84 C9				test		cl,cl
00EA  74 14				je		L$15
00EC  80 F9 2E				cmp		cl,0x2e
00EF  74 04				je		L$14
00F1  C6 03 2E				mov		byte ptr [ebx],0x2e
00F4				L$13:
00F4  43				inc		ebx
00F5				L$14:
00F5  8A 06				mov		al,byte ptr [esi]
00F7  84 C0				test		al,al
00F9  74 05				je		L$15
00FB  46				inc		esi
00FC  88 03				mov		byte ptr [ebx],al
00FE  EB F4				jmp		L$13
0100				L$15:
0100  C6 03 00				mov		byte ptr [ebx],0x00
0103  83 C4 04				add		esp,0x00000004
0106  5D				pop		ebp
0107  5F				pop		edi
0108  5E				pop		esi
0109  5B				pop		ebx
010A  C3				ret		

Routine Size: 237 bytes,    Routine Base: _TEXT + 001E

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

