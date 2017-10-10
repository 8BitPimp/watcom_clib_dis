Module: jistojms
GROUP: 'DGROUP' CONST,CONST2,_DATA,_BSS

Segment: _TEXT BYTE USE32 00000125 bytes
0000				jmstojis:
0000  53				push		ebx
0001  31 DB				xor		ebx,ebx
0003  66 8B 5C 24 08			mov		bx,word ptr 0x8[esp]
0008  53				push		ebx
0009  E8 00 00 00 00			call		jiszen
000E  83 C4 04				add		esp,0x00000004
0011  85 C0				test		eax,eax
0013  75 04				jne		L$1
0015  31 C0				xor		eax,eax
0017  5B				pop		ebx
0018  C3				ret		
0019				L$1:
0019  C1 FB 08				sar		ebx,0x08
001C  31 D2				xor		edx,edx
001E  8A 44 24 08			mov		al,byte ptr 0x8[esp]
0022  88 DA				mov		dl,bl
0024  88 DC				mov		ah,bl
0026  81 FA A0 00 00 00			cmp		edx,0x000000a0
002C  7D 07				jge		L$2
002E  BA 71 00 00 00			mov		edx,0x00000071
0033  EB 05				jmp		L$3
0035				L$2:
0035  BA B1 00 00 00			mov		edx,0x000000b1
003A				L$3:
003A  31 DB				xor		ebx,ebx
003C  88 E3				mov		bl,ah
003E  29 D3				sub		ebx,edx
0040  31 D2				xor		edx,edx
0042  88 C2				mov		dl,al
0044  01 DB				add		ebx,ebx
0046  81 FA 9F 00 00 00			cmp		edx,0x0000009f
004C  0F 9D C4				setge		ah
004F  31 D2				xor		edx,edx
0051  88 E2				mov		dl,ah
0053  42				inc		edx
0054  01 DA				add		edx,ebx
0056  88 D4				mov		ah,dl
0058  31 DB				xor		ebx,ebx
005A  88 C3				mov		bl,al
005C  83 FB 7F				cmp		ebx,0x0000007f
005F  7C 16				jl		L$5
0061  81 FB 9F 00 00 00			cmp		ebx,0x0000009f
0067  7D 07				jge		L$4
0069  BB 20 00 00 00			mov		ebx,0x00000020
006E  EB 0C				jmp		L$6
0070				L$4:
0070  BB 7E 00 00 00			mov		ebx,0x0000007e
0075  EB 05				jmp		L$6
0077				L$5:
0077  BB 1F 00 00 00			mov		ebx,0x0000001f
007C				L$6:
007C  31 D2				xor		edx,edx
007E  88 C2				mov		dl,al
0080  29 DA				sub		edx,ebx
0082  88 D0				mov		al,dl
0084  30 F6				xor		dh,dh
0086  88 E2				mov		dl,ah
0088  C1 E2 08				shl		edx,0x08
008B  30 E4				xor		ah,ah
008D  01 D0				add		eax,edx
008F  5B				pop		ebx
0090  C3				ret		

Routine Size: 145 bytes,    Routine Base: _TEXT + 0000

0091				jistojms:
0091  53				push		ebx
0092  56				push		esi
0093  8B 4C 24 0C			mov		ecx,dword ptr 0xc[esp]
0097  31 C0				xor		eax,eax
0099  66 89 C8				mov		ax,cx
009C  31 D2				xor		edx,edx
009E  C1 F8 08				sar		eax,0x08
00A1  88 CF				mov		bh,cl
00A3  88 C2				mov		dl,al
00A5  88 C3				mov		bl,al
00A7  83 FA 21				cmp		edx,0x00000021
00AA  7C 15				jl		L$7
00AC  83 FA 7E				cmp		edx,0x0000007e
00AF  7F 10				jg		L$7
00B1  81 E1 FF 00 00 00			and		ecx,0x000000ff
00B7  83 F9 21				cmp		ecx,0x00000021
00BA  7C 05				jl		L$7
00BC  83 F9 7E				cmp		ecx,0x0000007e
00BF  7E 05				jle		L$8
00C1				L$7:
00C1  31 C0				xor		eax,eax
00C3  5E				pop		esi
00C4  5B				pop		ebx
00C5  C3				ret		
00C6				L$8:
00C6  BE 02 00 00 00			mov		esi,0x00000002
00CB  89 D0				mov		eax,edx
00CD  C1 FA 1F				sar		edx,0x1f
00D0  F7 FE				idiv		esi
00D2  85 D2				test		edx,edx
00D4  74 0F				je		L$9
00D6  83 F9 60				cmp		ecx,0x00000060
00D9  0F 9D C0				setge		al
00DC  31 C9				xor		ecx,ecx
00DE  88 C1				mov		cl,al
00E0  83 C1 1F				add		ecx,0x0000001f
00E3  EB 05				jmp		L$10
00E5				L$9:
00E5  B9 7E 00 00 00			mov		ecx,0x0000007e
00EA				L$10:
00EA  31 D2				xor		edx,edx
00EC  88 FA				mov		dl,bh
00EE  01 CA				add		edx,ecx
00F0  31 C0				xor		eax,eax
00F2  88 D7				mov		bh,dl
00F4  88 D8				mov		al,bl
00F6  83 F8 5F				cmp		eax,0x0000005f
00F9  7D 07				jge		L$11
00FB  B9 71 00 00 00			mov		ecx,0x00000071
0100  EB 05				jmp		L$12
0102				L$11:
0102  B9 B1 00 00 00			mov		ecx,0x000000b1
0107				L$12:
0107  31 D2				xor		edx,edx
0109  88 DA				mov		dl,bl
010B  4A				dec		edx
010C  89 D0				mov		eax,edx
010E  C1 FA 1F				sar		edx,0x1f
0111  2B C2				sub		eax,edx
0113  D1 F8				sar		eax,0x01
0115  01 C8				add		eax,ecx
0117  30 E4				xor		ah,ah
0119  89 C2				mov		edx,eax
011B  C1 E2 08				shl		edx,0x08
011E  88 F8				mov		al,bh
0120  01 D0				add		eax,edx
0122  5E				pop		esi
0123  5B				pop		ebx
0124  C3				ret		

Routine Size: 148 bytes,    Routine Base: _TEXT + 0091

No disassembly errors

Segment: CONST DWORD USE32 00000000 bytes

Segment: CONST2 DWORD USE32 00000000 bytes

Segment: _DATA DWORD USE32 00000000 bytes

Segment: _BSS DWORD USE32 00000000 bytes

BSS Size: 0 bytes

